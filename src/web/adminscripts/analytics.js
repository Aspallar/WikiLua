(function () {
    'use strict';
    /*global mw, BannerNotification, sectionsData*/
    /*jshint -W106*/ // allow names to not be camel case

    if (mw.config.get('wgCanonicalSpecialPageName') !== 'Analytics' ||
        !/sysop|staff|content-team-member|helper|wiki-manager/.test(mw.config.get('wgUserGroups').join())
    ) return;

    var viewsKey = 'mdw-analytics-views';
    var editsKey  = 'mdw-analytics-edits';
    var visibilityKey = 'mdw-analytics-visibility';
    var maxSavedDays = 365;
    var visibleBoxes;

    function newLine() {
        var ua = navigator.userAgent;
        return ua.indexOf('Windows') !== -1 && ua.indexOf('Firefox') !== -1 ? '\r\n' : '\n';
    }

    function notify(msg, timeout) {
        new BannerNotification(msg, 'notify', undefined, timeout).show();
    }

    function loadVisibleStatus() {
        var data = localStorage.getItem(visibilityKey);
        var visibility = (data) ? JSON.parse(data) : {
            number_of_pageviews: false,
            edits_per_day: false,
            top_viewed_pages: false,
            geolocation: false,
            most_visited_files: false,
            desktop_vs_mobile: false,
            browser_breakdown: false,
            top_search_terms: false,
            logged_in_out: false
        };
        return visibility;
    }

    function saveVisibleStatus(status) {
        localStorage.setItem(visibilityKey, JSON.stringify(status));
    }

    function formatDate(d) {
        return new Date(d * 1000).toISOString().substr(0, 10);
    }

    function formatValue(v) {
        return v === undefined ? '': v;
    }

    function getCsv(data) {
        return Object.keys(data).map(function (key) {
            return [formatDate(key), data[key]].join(',');
        }).join(newLine());
    }

    function mergeData(target, data, prop) {
        Object.keys(data).forEach(function (key) {
            var entry = target[key];
            if (entry === undefined)
                entry = target[key] = {};
            entry[prop] = data[key];
        });
    }

    function mergeStats(views, edits) {
        var merged = {};
        mergeData(merged, edits, 'edits');
        mergeData(merged, views, 'views');
        return merged;
    }

    function getCombinedCsv(views, edits) {
        var merged = mergeStats(views, edits);
        return Object.keys(merged).sort().map(function (key) {
            var item = merged[key];
            return [formatDate(key), formatValue(item.views), formatValue(item.edits)].join(',');
        }).join(newLine());
    }

    function loadData(key) {
        var savedData = localStorage.getItem(key);
        return (savedData) ? JSON.parse(savedData) : {};
    }

    function trimmedMerge(data1, data2) {
        var trimmed = false;
        var updatedData = $.extend(data1, data2);
        var keys = Object.keys(updatedData);
        if (keys.length > maxSavedDays) {
            keys.slice(0, keys.length - maxSavedDays).forEach(function (key) {
                delete updatedData[key];
            });
            trimmed = true;
        }
        return {wasTrimmed: trimmed, data: updatedData};
    }

    function updateDataEntry(itemKey, currentData) {
        var savedData = loadData(itemKey);
        var result = trimmedMerge(savedData, currentData);
        localStorage.setItem(itemKey, JSON.stringify(result.data));
        return result.wasTrimmed;
    }

    function updateData() {
        var trimmedViews, trimmedEdits;
        try {
            trimmedViews = updateDataEntry(viewsKey, sectionsData.number_of_pageviews.per_day);
            trimmedEdits = updateDataEntry(editsKey, sectionsData.edits_per_day);
        } catch(e) {
            console.error(e);
            notify('There was a problem whilst saving current data. Data may not be saved.');
        }
        if (trimmedEdits || trimmedViews)
            notify('Saved analytics data is at max capacity (' + maxSavedDays + ' days)', 5000);
    }

    function purgeData() {
        localStorage.removeItem(viewsKey);
        localStorage.removeItem(editsKey);
    }

    function button(image, alt, title, handler) {
        return $('<img>', {
            src: 'https://vignette.wikia.nocookie.net/magicarena/images/' + image,
            alt: alt,
            title: title,
            width: '24',
            height: '24'
        }).css({
            float: 'right',
            margin: '5px'
        }).click(handler);
    }

    function copyButton(handler) {
        return button('8/88/Copyicon.svg/revision/latest?cb=20190815182005', 'Copy Icon',  'Copy to clipboard', handler);
    }

    function copySavedButton(handler) {
        return button('5/5d/Saveicon.svg/revision/latest?cb=20190816012418', 'Saved Icon', 'Copy saved data to clipboard', handler);
    }

    function copyClick(event, dataSource) {
        var element = $(event.target);
        event.stopPropagation();
        element.css('background-color', 'grey');
        navigator.clipboard.writeText(getCsv(dataSource)).then(function () {
            setTimeout(function () {
                element.css('background-color', '');
            }, 100);
        });
    }

    function toggleVisibility(event) {
        var boxHeader = $(event.target);
        boxHeader.next().toggle();
        var id = boxHeader.parent().attr('id');
        visibleBoxes[id] = !visibleBoxes[id];
        saveVisibleStatus(visibleBoxes);
    }

    function setInitialVisiblity(status) {
        Object.keys(status).forEach(function (key) {
            if (status[key])
                $('#' + key).children().eq(1).show();
        });
    }

    function purgeDataClick() {
        $.showCustomModal(
            'Confirm Data Purge',
            '<p>You are about to delete all saved analytics data. Are you sure you wish to continue?</p>', {
            id: 'mdw-confirmpurge-dialog',
            width: 350,
            buttons: [
                {
                    message: 'Continue',
                    defaultButton: true,
                    handler: function () {
                        purgeData();
                        $('#mdw-confirmpurge-dialog').closeModal();
                        setTimeout(function () {
                            notify('Saved analytics data has been purged.', 5000);
                            updateData();
                        }, 500);
                    }
                },
                {
                    message: 'Cancel',
                    defaultButton: true,
                    handler: function () {
                        $('#mdw-confirmpurge-dialog').closeModal();
                    }
                }
            ]
        });

    }

    function completeInit() {
        $('.grid_box_header').css('cursor', 'pointer')
            .click(toggleVisibility)
            .next().hide()
            .next().remove();

        $('#number_of_pageviews > .grid_box_header').append(
            copySavedButton(function () {
                copyClick(event, loadData(viewsKey));
            })
        ).append(
            copyButton(function (event) {
                copyClick(event, sectionsData.number_of_pageviews.per_day);
            })
        );

        $('#edits_per_day > .grid_box_header').append(
            copySavedButton(function () {
                copyClick(event, loadData(editsKey));
            })
        ).append(
            copyButton(function (event) {
                copyClick(event, sectionsData.edits_per_day);
            })
        );

        $('#analytics_header').append(
            $('<button>Purge Saved Data</button>').css({width: '33%', 'margin-right': '4px'}).click(purgeDataClick),
            $('<button>Copy Current Views and Edits</button>').css({width: '33%', 'margin-right': '4px'}).click(function () {
                navigator.clipboard.writeText(getCombinedCsv(sectionsData.number_of_pageviews.per_day, sectionsData.edits_per_day));
            }),
            $('<button>Copy Saved Views and Edits</button>').css({width: '33%'}).click(function () {
                navigator.clipboard.writeText(getCombinedCsv(loadData(viewsKey), loadData(editsKey)));
            })
        ).css('margin-bottom', '10px');

        $('#edits_per_day').attr('style', 'grid-area: top_search_terms;');
        $('#top_search_terms').attr('style', 'grid-area: edits_per_day;');

        $('#top_viewed_pages').attr('style', 'grid-area: geolocation;');
        $('#geolocation').attr('style', 'grid-area: top_viewed_pages;');

        setInitialVisiblity(visibleBoxes);

        setTimeout(updateData, 500);
    }

    function whenLoadedCompleteInit() {
        var interval = setInterval(function () {
            if ($('.last30').length > 0) {
                clearInterval(interval);
                completeInit();
            }
        }, 100);
    }

    function init() {
        visibleBoxes = loadVisibleStatus();
        $('#PageHeader').remove();
        $('#analytics_confidential_header').remove();
        $('#analytics_report_time').remove();
        $('#analytics_wrapper').css('padding-top', '0');
        whenLoadedCompleteInit();
    }

    $(init);
}());

