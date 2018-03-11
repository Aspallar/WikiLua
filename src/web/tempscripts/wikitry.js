(function () {
	/* globals mw */
	'use strict';
 
	var div = document.getElementById('mdw-test-button-div');
	if ( div === null)
		return;

	function showError(error) {
		console.log(error);
	}

	function fullPagePath(title) {
		return mw.config.get('wgArticlePath').replace('$1', title);
	}

	function getRawPage(title, cbDone) {
		var url = fullPagePath(title) + "?action=raw";
	    $.ajax({
	        url: url,
	        type: 'GET',
	        success: function (response) {
	        	cbDone(response);
	        },
	        error: function (xhr, error) {
	            showError('AJAX error: ' + error);
	        },
	        timeout: 10000 // msec
	    });
	}

	function onClick() {
	    // var pageName = 'Ratings:' + mw.config.get('wgPageName');
	    // alert(pageName);
	    // window.location = pageName;
	    console.log(mw.config.get('wgPageName'));
	    console.log(mw.config.get('wgArticlePath'));
	    getRawPage(mw.config.get('wgPageName'), function (response) {
	    	console.log(response);
	    });
	}
 
	$('<input type="button" value="Test"></input>')
		.click(onClick)
		.appendTo(div);
 
}());
