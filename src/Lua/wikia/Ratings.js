(function ($) {
	'use strict';

	if (document.getElementById('mdw-ratings') === null)
		return;

	function setYouMustBeloggedInToVoteWarning() {
		console.log('To be implemented: setYouMustBeloggedInToVoteWarning');
	}

	function getRating(ratingPageName, userIdentifier) {
	}

	function initializeRatings() {
        var pageName = 'Ratings:' + mw.config.get(wgPageName);
        // TODO: check for logged in 'properly'
        if (!wgUserName)
        {
        	setYouMustBeloggedInToVoteWarning()
        	return;
        }
        getRating(pageName, wgUserName);
	}

	mw.hook(initializeRatings);

}(jQuery))
