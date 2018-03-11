(function ($) {
	/* global mw */

	'use strict';

	var pageName = 'Test';

	if (document.getElementById('mdw-rating') === null)
		return;

	var ratingsDataPageName = 'Ratings:DeckRatings';

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
	            if (response.error !== undefined)
	                showError('API error in wikiApiCall: ' + response.error.info);
	            else
	                cbSuccess(response);
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
		});
	}

	function getPageFromResponse(response) {
		/* jshint -W089 */ // no need for hasOwnProperty guard here
		var pages = response.query.pages;
    	var page;
        for (var i in pages)
	        page = pages[i];
	    return page;
	}

	// function fetchRatingData(cbDone) {
	// 	cbDone([{name:'Test',total:30,votes:10}]);
	// }

	function fetchRatingData(cbDone) {
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
	        var content = page.revisions[0]['*'];
	        var data = JSON.parse(content);
			cbDone(data);
    	});
	}

	function updateRatingData(deckName, score) {
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
	        var content = page.revisions[0]['*'];
	        var data = JSON.parse(content);
	        var rating = findRating(deckName, data);
	        if (rating.name === undefined) {
	        	rating = {name:deckName, total:score, votes:1};
	        	data.push(rating);
	        } else {
	        	rating.total += score;
	        	++rating.votes;
	        }
	        content = JSON.stringify(data);
	        // TODO: save data
			setRating(calcRating(rating.total, rating.votes));
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
        var rating = parseInt($(this).attr('data-rating'), 10);
        $('#mdw-rating').css('display', 'none');
        updateRatingData(pageName, rating);
        console.log(rating);
	}


	function initializeRating() {
		fetchRatingData(function (data) {
			var rating = findRating(pageName, data);
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
