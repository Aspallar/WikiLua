// ==========================================================================
// Start: Deck Ratings
//    1. Supports the rating 'stars' on deck pages
//    2. Updates the rating column on deck tables
// Version 1.2.1
// Author: Aspallar
//
// ** Please do not edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
// This code was inspired by the rating system used on http://de.sonic.wikia.com
//
(function ($) {
    /* global mw */
    'use strict';

    if ((document.getElementById('mdw-rating') === null && $('.mdw-ratingtable').length === 0) ||
         $('#mdw-disabled-js').attr('data-ratings-1-2-1'))
        return;

    var ratingsDataPageName = 'Ratings:DeckRatings';

    function showError(error) {
        console.log(error);
        $('#mdw-rating').html('Error');
    }

    function stripDeckPrefix(deckName) {
        if (deckName.substring(0, 6) === 'Decks/')
            return deckName.substring(6);
        return deckName;
    }

    function getDeckName() {
        var name = mw.config.get('wgTitle');
        name = stripDeckPrefix(name);
        return name;
    }

    function validRating(rating) {
        return typeof rating === 'object' &&
            typeof rating.votes === 'number' &&
            rating.votes !== 0 &&
            typeof rating.total === 'number';
    }

    function calcScore(rating) {
        if (!validRating(rating))
            return 0;
        return Math.round(rating.total / rating.votes);
    }

    function parseData(dataText) {
        try {
            return JSON.parse(dataText);
        } catch(error) {
            $('.mdw-ratings-box').css('display', 'none');
            showError('Ratings data error: ' + error);
            return null; 
        }
    }

    function wikiApiCall(data, method, cbSuccess) {
        data.format = 'json';
        $.ajax({
            data: data,
            dataType: 'json',
            url: mw.config.get('wgScriptPath') + '/api.php',
            type: method,
            success: function (response) {
                if (response.error === undefined)
                    cbSuccess(response);
                else
                    showError('API error in wikiApiCall: ' + response.error.info);
            },
            error: function (xhr, error) {
                showError('AJAX error in wikiApiCall: ' + error);
            },
            timeout: 10000 
        });
    }

    function findRating(name, ratingData) {
        for (var k = 0, l = ratingData.length; k < l; k++) {
            if (ratingData[k].name === name) {
                return ratingData[k];
            }
        }
        return null;
    }

    function getRating(name, ratingData) {
        var rating = findRating(name, ratingData);
        if (rating === null) {
            rating = {name:name, total:0, votes:0};
            ratingData.push(rating);
        }
        return rating;
    }

    function updateRatingUiValue(rating) {
        $('.mdw-rating-score').each(function () {
            var ratingStar = $(this);
            if (rating >= parseInt(ratingStar.attr('data-rating'), 10))
                ratingStar.addClass('mdw-rating-active');
            else
                ratingStar.removeClass('mdw-rating-active');
        });
    }

    function getDataFromPage(page) {
        var content = page.revisions[0]['*'];
        return parseData(content);
    }

    function getPageFromResponse(response) {
        var pages = response.query.pages;
        for (var property in pages) {
            if (pages.hasOwnProperty(property))
                return pages[property];
        }
        return null;
    }

    function fetchRatingPage(cbDone) {
        wikiApiCall({
            action: 'query',
            prop: 'info|revisions',
            intoken: 'edit',
            titles: ratingsDataPageName,
            rvprop: 'content|timestamp',
            rvlimit: '1'
        },
        'GET',
        function (response) {
            var page = getPageFromResponse(response);
            cbDone(page);
        });
    }

    function fetchRatingData(cbDone) {
        fetchRatingPage(function (page) {
            var data = getDataFromPage(page);
            if (data === null)
                data = [];
            cbDone(data);
        });
    }

    function addScore(rating, score) {
        rating.total += score;
        ++rating.votes;
    }

    function updateRating(deckName, score) {
        fetchRatingPage(function (page) {
            var data = getDataFromPage(page);
            if (data === null)
                return; 
            var rating = getRating(deckName, data);
            addScore(rating, score);
            var newContent = JSON.stringify(data, null, 1);
            updateRatingUiValue(calcScore(rating));
            wikiApiCall({
                minor: 'yes',
                summary: 'Rating for [[Decks/' + deckName + '|' + deckName + ']] (' + score + ')',
                action: 'edit',
                title: ratingsDataPageName,
                basetimestamp: page.revisions[0].timestamp,
                startimestamp: page.starttimestamp,
                token: page.edittoken,
                watchlist: 'unwatch',
                text: newContent
            },
            'POST',
            function (response) {
                if (response.edit.result !== 'Success')
                    showError('Update fail in updateRating: ' + response.edit.result);
                else
                    $('#mdw-rating').html('Voted.');
            });
        });
    }

    function onRatingMouseEnter() {
        /* jshint -W040 */ // allow old school jquery use of this
        var rating = parseInt($(this).attr('data-rating'), 10);
        $('.mdw-rating').each(function () {
            var voteStar = $(this);
            var voteStarRating = parseInt(voteStar.attr('data-rating'), 10);
            if (voteStarRating <= rating) {
                voteStar.addClass('mdw-rating-active');
            }
        });
    }

    function onRatingMouseLeave() {
        $('.mdw-rating').removeClass('mdw-rating-active');
    }

    function onRatingClick() {
        /* jshint -W040 */ // allow old school jquery use of this
        var rating = parseInt($(this).attr('data-rating'), 10);
        var indicator = $('<img>', {
            src: mw.config.get('stylepath') + '/common/images/ajax.gif'
        });
        $('#mdw-rating').html(indicator);
        updateRating(getDeckName(), rating);
    }

    function initializeRating() {
        fetchRatingData(function (data) {
            var rating = findRating(getDeckName(), data);
            if (rating !== null)
                updateRatingUiValue(calcScore(rating));
        });
    }

    function wireUpEvents() {
        $('.mdw-rating')
            .mouseenter(onRatingMouseEnter)
            .mouseleave(onRatingMouseLeave)
            .click(onRatingClick);
    }

    function addDataRatingAttributes(className) {
        $(className).each(function (index, element) {
            $(element).attr('data-rating', index + 1);
        });
    }

    function addAllDataRatingAttributes() {
        addDataRatingAttributes('.mdw-rating-score');
        addDataRatingAttributes('.mdw-rating');
    }

    function getDeckNames(table) {
        var names = [];
        table.find('td:nth-child(' + table.attr('data-deckcol') + ') a').each(function () {
            names.push(stripDeckPrefix($(this).attr('title')));
        });
        return names;
    }

    function validateRatingsTable(table) {
        var digits = /^\d+$/;
        var messages = ['The following mdw-ratingrable table contains errors.'];
        var attr = table.attr('data-deckcol');
        if (attr === undefined)
            messages.push('Missing data-deckcol attribute.');
        else if (!digits.test(attr))
            messages.push('Invalid data-deckcol attribute, value must be an integer.');
        attr = table.attr('data-ratingcol');
        if (attr === undefined)
            messages.push('Missing data-ratingcol attribute.');
        else if (!digits.test(attr))
            messages.push('Invalid data-ratingcol attribute, value must be an integer.');
        return messages.length === 1 ? null : messages.join(' ');
    }

    function updateRatingColumn() {
        fetchRatingData(function (data) {
            $('.mdw-ratingtable').each(function () {
                var table = $(this);
                var deckRow = 0;
                var errors = validateRatingsTable(table);
                if (errors === null) {
                    var deckNames = getDeckNames(table);
                    table.find('td:nth-child(' + table.attr('data-ratingcol') + ')').each(function () {
                        var rating = findRating(deckNames[deckRow++], data);
                        if (rating !== null)
                            $(this).text(calcScore(rating));
                    });
                } else {
                    table.before($('<p class="mdw-error">').text(errors));
                }
            });
        });
    }

    function initializeStars() {
        addAllDataRatingAttributes();
        wireUpEvents();
        initializeRating();
    }

    $(document).ready(function () {
        if (document.getElementById('mdw-rating') !== null) {
            // we are on a deck page with rating
            initializeStars();
        }
        else {
            // we are on a page with a ratings table
            updateRatingColumn();
        }
    });

}(jQuery));
// End: Deck Ratings
// ==========================================================================

