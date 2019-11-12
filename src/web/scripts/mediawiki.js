/* jshint strict:false */

// NOTE:no longer used, left here for reference

var __baseUrl = 'https://aspallar.fandom.com';
//var __baseUrl = 'https://magicarena.fandom.com';

var mw = mw || {};
mw.config = mw.config || {};

mw.config.get = function(param) {
	switch (param) {
        case 'wgPageName':
            return 'Decks/Test_Three';
        case 'wgTitle':
            // return 'Decks/Test Three';
            return 'Lightning Strike';
            // return "foobar";
		case 'wgScriptPath':
            return __baseUrl;
        case 'wgUserName':
            return 'Aspallar';
        case 'wgArticlePath':
            return __baseUrl + '/wiki/$1';
        case 'stylepath':
            return 'https://slot1-images.wikia.nocookie.net/__cb1528286929/common/skins';
	}
	throw 'Unknown config item [' + param + ']';
};

mw.util = {};
mw.util.getParamValue = function(paramName) {
    paramName = paramName;
    return 'TestDeck';
    // return 'Test Deck - Bad Deck';
    // return null;
};

mw.util.getUrl = function (page, query) {
    return mw.config.get('wgArticlePath').replace('$1', '') + page + (query ? '?' + $.param(query) : '');
};

mw.util.wikiScript = function (param) {
    if (param === 'api')
        return __baseUrl + '/api.php';
    throw 'mw.util.wikiScript ' + param + ' not implemented';
};

mw.html = {};
mw.html.escape = function(s) {
    return s.replace(/&/g, '&amp;')
        .replace(/</g, '&lt;')
        .replace(/>/g, '&gt;')
        .replace(/"/g, '&quot;')
        .replace(/'/g, '&#039;');
};

mw.loader = {};
mw.loader.using = function(what, cb) {
    if (cb) {
       cb();
    } else {
        var deferred = $.Deferred();
        deferred.resolve();
        return deferred.promise();
    }
};

var tooltips = {};
tooltips.applyTooltips = function (el) {
    el = el;
    // do nothing
};

var mediawiki = mw;
mediawiki = mediawiki;

// mw.hook = function (eventname) {
//     var hooks = {};
//     return {
//         fire: function (o) {
//             var fns = hooks
//         }
//         add: function (fn) {
//             if (typeof fn === "function")
//                 fn();
//         }
//     }
// };
