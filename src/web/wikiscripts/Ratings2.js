(function ($) {
    /* global mw */
    'use strict';

    if (document.getElementById('mdw-rating') === null)
        return;

    var ratingsDataPageName = 'Ratings:DeckRatings';

    function getPageName() {
        var name = mw.config.get('wgPageName');
        if (name.substring(0, 6) === 'Decks/')
            name = name.substring(6);
        return name;
    }

    function calcRating(total, numberOfVotes) {
        return Math.floor(total / numberOfVotes);
    }

    function showError(error) {
        console.log(error);
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
        return {total:0, votes:1};
    }

    function setRating(rating) {
        $('.mdw-rating-score').each(function () {
            var $this = $(this);
            if (rating >= parseInt($this.attr('data-rating'), 10))
                $this.addClass('mdw-rating-active');
            else
                $this.removeClass('mdw-rating-active');
        });
    }

    function getDataFromPage(page) {
        var content = page.revisions[0]['*'];
        return JSON.parse(content);
    }

    function getPageFromResponse(response) {
        /* jshint -W089 */ // no need for hasOwnProperty guard here
        var pages = response.query.pages;
        var page;
        for (var i in pages)
            page = pages[i];
        return page;
    }

    function fetchRatingPage(cbDone) {
        wikiApiCall({
            'action': 'query',
            'prop': 'info|revisions',
            'intoken': 'edit',
            'titles': ratingsDataPageName,
            'rvprop': 'content',
            'rvlimit': '1'
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
            cbDone(data);
        });
    }

    function updateRatingData(deckName, score) {
        fetchRatingPage(function (page) {
            var data = getDataFromPage(page);
            var rating = findRating(deckName, data);
            if (rating.name === undefined) {
                rating = {name:deckName, total:score, votes:1};
                data.push(rating);
            } else {
                rating.total += score;
                ++rating.votes;
            }
            var newContent = JSON.stringify(data);
            setRating(calcRating(rating.total, rating.votes));
            wikiApiCall({
                'minor': 'yes',
                'summary': 'Rating update (automatic)',
                'action': 'edit',
                'title': ratingsDataPageName,
                'basetimestamp': page.revisions[0].timestamp,
                'startimestamp': page.starttimestamp,
                'token': page.edittoken,
                'watchlist': 'unwatch',
                'text': newContent
            },
            'POST',
            function (response) {
                if (response.edit.result !== 'Success')
                    showError('Update fail in updateRatingData: ' + response.edit.result);
            });
        });
    }

    function onRatingMouseEnter() {
        /* jshint -W040 */ // allow old school jquery use of this
        var rating = parseInt($(this).attr('data-rating'), 10);
        $('.mdw-rating').each(function () {
            var $this = $(this);
            var thisRating = parseInt($this.attr('data-rating'), 10);
            if (thisRating <= rating) {
                $this.addClass('mdw-rating-active');
            }
        });
    }

    function onRatingMouseLeave() {
        $('.mdw-rating').removeClass('mdw-rating-active');
    }

    function onRatingClick() {
        /* jshint -W040 */ // allow old school jquery use of this
        var rating = parseInt($(this).attr('data-rating'), 10);
        $('#mdw-rating').css('display', 'none');
        updateRatingData(getPageName(), rating);
    }

    function initializeRating() {
        fetchRatingData(function (data) {
            var rating = findRating(getPageName(), data);
            setRating(calcRating(rating.total, rating.votes));
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

    $(document).ready(function () {
        addAllDataRatingAttributes();
        wireUpEvents();
        initializeRating();
    });

}(jQuery));
