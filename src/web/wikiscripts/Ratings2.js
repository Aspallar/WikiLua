(function ($) {
	'use strict';

	if (document.getElementById('mdw-rating') === null)
		return;

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
        // alert('Rating: ' + rating);
	}

	function fetchRatingData(cbDone) {
		cbDone([{name:'Test',total:30,votes:10}]);
	}

	function setRating(rating) {
		$('.mdw-rating-score').each(function () {
			var $this = $(this);
			if (rating >= parseInt($this.attr('data-rating'), 10))
				$this.addClass('mdw-rating-active');
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

	function getRating() {
		var pageName = 'Test';
		fetchRatingData(function (data) {
			var rating = findRating(pageName, data);
			setRating(Math.floor(rating.total / rating.votes));
		});
	}

	function wireUpEvents() {
	    $('.mdw-rating')
	    	.mouseenter(onRatingMouseEnter)
			.mouseleave(onRatingMouseLeave)
			.click(onRatingClick);
	}

	function addDataRatingAttributes() {
		$('.mdw-rating-score').each(function (index, elem) {
			$(elem).attr('data-rating', index + 1);
		});
		$('.mdw-rating').each(function (index, elem) {
			$(elem).attr('data-rating', index + 1);
		});
	}

	$(document).ready(function () {
		addDataRatingAttributes();
		wireUpEvents();
		getRating();
	});

}(jQuery));
