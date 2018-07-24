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
            // return 'http://aspallar.wikia.com';
            return 'http://magicarena.wikia.com';
        case 'wgUserName':
            return 'Aspallar';
        case 'wgArticlePath':
            // return 'http://aspallar.wikia.com/wiki/$1';
            return 'http://magicarena.wikia.com/wiki/$1';
        case 'stylepath':
            return 'https://slot1-images.wikia.nocookie.net/__cb1528286929/common/skins';
	}
	throw 'Unknown config item [' + param + ']';
};

mw.util = {};
mw.util.getParamValue = function(paramName) {
    return 'TestDeck';
    // return 'Test Deck - Bad Deck';
    // return null;
}

mw.loader = {};
mw.loader.using = function(what, cb) {
    cb();
};

mw.hook = function (func) {
	jQuery(func);
};
