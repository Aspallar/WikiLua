/* jshint strict:false */

var mw = mw || {};
mw.config = mw.config || {};

mw.config.get = function(param) {
	// TODO: implement test mw.config.get(param)
	switch (param) {
		// case 'wgArticlePath':
		// 	return wgArticlePath || param;
		// case 'wgPageName':
		// 	return wgPageName || param;
		case 'wgScriptPath':
			return 'http://aspallar.wikia.com';
	}
	throw 'Unknown config item';
};

mw.hook = function (func) {
	jQuery(func);
};
