/* jshint strict:false */

var mw = mw || {};
mw.config = mw.config || {};

mw.config.get = function(param) {
	switch (param) {
		case 'wgPageName':
			return 'Decks/Test Two';
		case 'wgScriptPath':
			return 'http://aspallar.wikia.com';
	}
	throw 'Unknown config item';
};

mw.hook = function (func) {
	jQuery(func);
};
