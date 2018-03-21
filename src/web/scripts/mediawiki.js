/* jshint strict:false */

var mw = mw || {};
mw.config = mw.config || {};

mw.config.get = function(param) {
	switch (param) {
        case 'wgPageName':
            return 'Decks/Test_Three';
        case 'wgTitle':
            return 'Decks/Test Three';
		case 'wgScriptPath':
			return 'http://aspallar.wikia.com';
	}
	throw 'Unknown config item [' + param + ']';
};

mw.hook = function (func) {
	jQuery(func);
};
