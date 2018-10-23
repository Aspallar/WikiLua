/* jshint strict:false */

var mw = mw || {};
mw.config = mw.config || {};

mw.config.get = function(param) {
	switch (param) {
        case 'wgPageName':
            return 'Decks/Test_Three';
        case 'wgTitle':
            // return 'Decks/Test Three';
            return "Lightning Strike";
            // return "foobar";
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
// mw.util.getUrl = function(title) {
//     return title.replace(/ /g, '_');
// }

mw.util.getUrl = function (page, query) {
    return mw.config.get('wgArticlePath').replace('$1', '') + page + (query ? '?' + $.param(query) : '');
}

mw.html = {};
mw.html.escape = function(s) {
    return s.replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;");
}

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

tooltips = {};
tooltips.applyTooltips = function (el) {
    // do nothing
}




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
