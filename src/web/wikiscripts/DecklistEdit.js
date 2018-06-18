// ==========================================================================
// DecklistEdit
//
// Version 1.0.0
// Author: Aspallar
//
// ** Please do not edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
(function ($) {
    /*global mw */
    'use strict';

    // return;

    console.log('DecklistEdit Build 10');

    // var decklistTitle = 'User:Aspallar/Sandbox/Decklists';
    var decklistTitle = 'Decklists';
    
    if (document.getElementById('mdw-editor') === null || $('#mdw-disabled-js').attr('decklistedit-1-0-0'))
        return;

    function showWorking() {
        $('#mdw-working').show();
    }

    function hideWorking() {
        $('#mdw-working').hide();
    }

    function fatalError(additionalInfo) {
        if (additionalInfo) {
            $('#mdw-dle-additionalinfo').html(additionalInfo);
        }
        $('#mdw-dle-deckselect').prop('disabled', true) ;
        $('#mdw-dle-addtolist').prop('disabled', true) ;
        hideWorking();
        $('#mdw-dle-fatalerror').show(400);
    }

    function extractJson(id, contents) {
        var invalidDeckException = 'Invalid deck';
        var start = '<pre id="$1"'.replace('$1', id);
        var startPos = contents.indexOf(start);
        if (startPos === -1) throw invalidDeckException;
        startPos = contents.indexOf('>', startPos + 1) + 1;
        if (startPos === -1) throw invalidDeckException;
        var endPos = contents.indexOf('</pre>', startPos);
        if (endPos === -1) throw invalidDeckException;
        return contents.substring(startPos, endPos);
    }

    function wikiApiCall(data, method) {
        data.format = 'json';
        return $.ajax({
            data: data,
            dataType: 'json',
            url: mw.config.get('wgScriptPath') + '/api.php',
            type: method,
            timeout: 10000 
        });
    }

    function getUnlistedDecks(decklistDecks) {

        var deferred = $.Deferred();
        var decks = [];

        function getDecks(apfrom) {
            wikiApiCall({
                action: 'query',
                list: 'allpages',
                apprefix: 'Decks/',
                aplimit: 100,
                apfrom: apfrom
            }, 'GET').done(function(data) {
                if (data.error) {
                    deferred.reject('getUnlistedDecks ' + data.error.info);
                    return;
                }
                data.query.allpages.forEach(function (deck) {
                    var title = deck.title.substring(6);
                    if (!decklistDecks.includes(title))
                        decks.push(title);
                });
                if (data['query-continue']) {
                    getDecks(data['query-continue'].allpages.apfrom);
                } else {
                    deferred.resolve(decks);
                }
            }).fail(function (xhr, status, statusText) {
                console.log(xhr);
                deferred.reject('getUnlistedDecks ' + statusText);
            });
        }

        getDecks(null);
        return deferred.promise();
    }   

    function getContent(page) {
        return page.revisions[0]['*'];
    }

    function getPage(data) {
        var pages = data.query.pages;
        for (var property in pages) {
            if (pages.hasOwnProperty(property))
                return pages[property];
        }
        return null;
    }

    function getDeckTitlesFromDecklists(content) {
        var decks = [];
        var matches = content.match(/\|link=.*/g);
        if (matches) {
            matches.forEach(function(match) {
                decks.push(match.substring(6).replace(/_/g, ' '));
            });
        }
        return decks;
    }

    function getDecklistsDecks() {
        // nada
        var deferred = $.Deferred();

        wikiApiCall({
            action: 'query',
            prop: 'info|revisions',
            intoken: 'edit',
            titles: decklistTitle,
            rvprop: 'content|timestamp',
            rvlimit: '1'
        }, 'GET').done(function (data) {
            if (data.error) {
                deferred.reject('getDecklistsDecks ' + data.error.info);
                return;
            }
            var page = getPage(data);
            if (page.missing !== undefined) {
                deferred.reject('Deck lists page [' + decklistTitle + '] not found.');
                return;
            }
            var content = getContent(page);
            var decks = getDeckTitlesFromDecklists(content);
            deferred.resolve(decks);
        }).fail(function (xhr, status, statusText) {
            console.log(xhr);
            deferred.reject('getDecklistsDecks ' + statusText);
        });

        return deferred.promise();
    }

    function addToDecklists(entry, name) {

        var deferred = $.Deferred();

        wikiApiCall({
            action: 'query',
            prop: 'info|revisions',
            intoken: 'edit',
            titles: decklistTitle,
            rvprop: 'content|timestamp',
            rvlimit: '1'
        }, 'GET').done(function (data) {
            var page = getPage(data);
            var content = getContent(page);
            var insertPos = content.indexOf('<!-- Add your deck info above here! -->');
            if (insertPos === -1) {
                deferred.reject('Unable to locate deck insertion marker.');
                return;
            }
            content = content.substr(0, insertPos) + entry + content.substr(insertPos);
            wikiApiCall({
                minor: 'yes',
                summary: 'adding ' + name + ' via deck list editor',
                action: 'edit',
                title: decklistTitle,
                basetimestamp: page.revisions[0].timestamp,
                startimestamp: page.starttimestamp,
                token: page.edittoken,
                watchlist: 'unwatch',
                text: content,
            }, 'POST').then(function (data) {
                if (data.error) {
                    deferred.reject(data.error.code === 'editconflict' ? 'editconflict' : data.error.info);
                } else if (data.edit.result !== 'Success') {
                    deferred.reject(data.edit.result);
                } else {
                    deferred.resolve();
                }
            }).fail(function (xhr, status, statusText) {
                console.log(xhr);
                deferred.reject('addToDecklists ' + statusText);
            });
        }).fail(function (xhr, status, statusText) {
            console.log(xhr);
            deferred.reject('addToDecklists ' + statusText);
        });

        return deferred.promise();
    }

    function extractDeckColors(colors, data) {
        data.forEach(function (card) {
            if (card.colors) {
                card.colors.forEach(function (color) {
                    if (!colors.some(function (c) { return c === color; }))
                        colors.push(color);
                });
            }
        });
    }

    function getDeckColors(title) {
        var deferred = $.Deferred();

        $.get(mw.config.get('wgArticlePath').replace('$1', 'Decks/' + title)).done(function (data) {
            try {
                var deckJson = JSON.parse(extractJson('mdw-chartdata-pre', data));
                var sideboardJson = JSON.parse(extractJson('mdw-sideboard-data', data));
                var colors = [];
                extractDeckColors(colors, deckJson);
                extractDeckColors(colors, sideboardJson);
                deferred.resolve(colors);
            } catch (error) {
                if (data.indexOf('class="redirectMsg"') !== -1)
                    deferred.reject('redirected');
                else
                    deferred.reject('baddeck');
            }
        }).fail(function (xhr, status, statusText) {
            console.log(xhr);
            deferred.reject('Failed to obtain deck colors from ' + title + '. Reason: ' + statusText);
        }) ;

        return deferred.promise();
    }

    function setAuthor() {
        var loggedUser = mw.config.get('wgUserName');
        if (loggedUser) {
            $('#mdw-dle-author').val('[[User:' + loggedUser + '|' + loggedUser + ']]');
        } else {
            $('#mdw-dle-author').val('Annon');
        }
    }

    function tickColors(colors) {
        $('#mdw-dle-colors>input').prop('checked', false);
        colors.forEach(function (color) {
            var id = '#mdw-dle-' + color.toLowerCase();
            $(id).prop('checked', true);
        });
    }

    function selectDeck() {
        /* jshint -W040 */ // allow old school jquery use of this
        $('#mdw-mainform').hide();
        $('.mdw-dle-errordiv').hide();
        var deck = this.options[this.selectedIndex].text;
        console.log(deck);
        showWorking();
        getDeckColors(deck).done(function (colors) {
            hideWorking();
            $('#mdw-dle-name').val(deck);
            setAuthor();
            tickColors(colors);
            $('#mdw-mainform').show(500);
        }).fail(function (reason) {
            hideWorking();
            if (reason === 'baddeck' || reason === 'redirected')
                $('#mdw-dle-' + reason).show(200);
            else
                fatalError(reason);
        });
    }

    function validateTextField(name, value) {
        if (value === '') {
            $('#mdw-dle-error-' + name).html('* A value is required.');
            return false;
        }
        return true;
    }

    function validate(values) {
        $('.mdw-error').html('');
        var name = validateTextField('name', values.name);
        var type = validateTextField('type', values.type);
        var author = validateTextField('author', values.author);
        var desc = validateTextField('desc', values.desc);
        return name && type && author && desc;
    }

    function getColors() {
        var colors = '';
        $('#mdw-dle-colors>input:checked').each(function () {
            colors += $(this).val();
        });
        return colors;
    }

    function getValues() {
        var values = {};
        values.link = $('#mdw-dle-deckselect>option:selected').text();
        values.name = $('#mdw-dle-name').val();
        values.type = $('#mdw-dle-type').val();
        values.author = $('#mdw-dle-author').val();
        values.desc = $('#mdw-dle-desc').val();
        values.colors = getColors();
        return values;
    }

    function makeDecklistEntry(values) {
        var entry = '{{DeckRow\n';
        entry += '|link=' + values.link + '\n';
        entry += '|strategy=' + values.type + '\n';
        entry += '|colors=' + values.colors + '\n';
        entry += '|author=' + values.author + '\n';
        entry += '|desc=' + values.desc + '\n';
        entry += '|name=' + values.name + '}}\n\n';
        return entry;
    }

    function redirectToDeckLists() {
        var url = mw.config.get('wgArticlePath').replace('$1', decklistTitle);
        window.location = url;
    }

    function clickAddToDecklists() {
        /* jshint -W040 */ // allow old school jquery use of this
        $('.mdw-dle-errordiv').hide();
        var values = getValues();
        if (!validate(values)) {
            $('#mdw-dle-error').html('Please correct the errors above and try again');
            return;
        }
        var entry = makeDecklistEntry(values);
        var button = $(this);
        button.prop('disabled', true);
        showWorking();
        addToDecklists(entry, values.link)
            .done(redirectToDeckLists)
            .fail(function (reason) {
                hideWorking();
                if (reason === 'editconflict') {
                    button.prop('disabled', false);
                    $('#mdw-dle-editconflict').show(300);
                } else {
                    fatalError(reason);
                }
            });
    }

    function createMainForm() {
        /*jshint -W043 */ // allow multiline string escaping
        $('#mdw-dle-name-span')
            .html('<input type="input" id="mdw-dle-name" size="40" placeholder="Deck name"/>');
        $('#mdw-dle-type-span')
            .html('<input type="input" id="mdw-dle-type" size="10" placeholder="Type"/>');
        $('#mdw-dle-author-span')
            .html('<input type="input" id="mdw-dle-author" size="20" placeholder="Author"/>');
        $('#mdw-dle-desc-span')
            .html('<input type="input" id="mdw-dle-desc" size="50" placeholder="Description"/>');
        $('#mdw-dle-colors')
            .html('<input type="checkbox" id="mdw-dle-white" value="{{W}}">\
                    <label for="mdw-dle-white">White</label>&nbsp;&nbsp;\
                    <input type="checkbox" id="mdw-dle-blue" value="{{U}}">\
                    <label for="mdw-dle-blue">Blue</label>&nbsp;&nbsp;\
                    <input type="checkbox" id="mdw-dle-black" value="{{B}}">\
                    <label for="mdw-dle-black">Black</label>&nbsp;&nbsp;\
                    <input type="checkbox" id="mdw-dle-red" value="{{R}}">\
                    <label for="mdw-dle-red">Red</label>&nbsp;&nbsp;\
                    <input type="checkbox" id="mdw-dle-green" value="{{G}}">\
                    <label for="mdw-dle-green">Green</label>&nbsp;&nbsp;\
                    <input type="checkbox" id="mdw-dle-colorless" value="{{C}}">\
                    <label for="mdw-dle-colorless">Colorless</label>&nbsp;&nbsp;');
        var button = $('<input type="button" id="mdw-dle-addtolist" value="Add to deck lists" />').click(clickAddToDecklists);
        $('#mdw-dle-update-span').html(button);
    }

    function initialize() {
        $('#mdw-working').html($('<img>', {
            src: mw.config.get('stylepath') + '/common/images/ajax.gif'
        }));
        createMainForm();
        showWorking();
        getDecklistsDecks().done(function (decklistDecks) {
            getUnlistedDecks(decklistDecks).done(function (unlistedDecks) {
                var select = $('<select id="mdw-dle-deckselect">')
                    .append($('<option disabled selected>Select deck to add --</option>'))
                    .change(selectDeck);
                unlistedDecks.forEach(function (deck) {
                    select.append($('<option>').text(deck));
                });
                $('#mdw-deck-select').html(select);
                $('#mdw-deck-select-div').show(500);
                hideWorking();
            }).fail(fatalError);
        }).fail(fatalError);
    }

    $(document).ready(initialize);

}(jQuery));
