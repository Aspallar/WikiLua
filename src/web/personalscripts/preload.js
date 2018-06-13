(function () {
    'use strict';
    /*global mw*/
    console.log('Build 11');

    var config = mw.config.get(['wgScript', 'wgTitle', 'wgArticleId', 'wgAction']);
    console.dir(config);

    if (config.wgArticleId !== 0 || 
        config.wgAction !== 'edit' ||
        config.wgTitle.substring(0, 6) !== 'Decks/') {
            console.log('Exiting: not editing a new deck.');
            return;
    }

    function removeIncludes(contents) {
        return contents
            .replace(/<[\/]?noinclude>|<[\/]?includeonly>/g, '');
    }


    $(function () {
        if ($('textarea').length !== 1) {
            console.log('Exiting: invalid textarea');
        }
        console.log('fetching template');
        $.get(config.wgScript, {
                title: 'Template:DecklistPage',
                action: 'raw',
                ctype: 'text/plain'
        }).done(function (data) {
            var textarea = $('#wpTextbox1');
            if (textarea.exists()) {
                console.log('First attempt fpunf. replacing text');
                textarea.text(removeIncludes(data));
                return;
            }
            var count = 10;
            var timer = setInterval(function () {
                console.log('Trying ' + count);
                if (--count === 0) {
                    console.log('Failed to find textarea');
                    clearInterval(timer);
                    return;
                }
                var textarea = $('#wpTextbox1');
                if (textarea.exists()) {
                    console.log('Seting text');
                    textarea.text(removeIncludes(data));
                    clearInterval(timer);
                }
            }, 300);
        }).fail(function () {
            console.log('template load failed.');
        });
    });
}());

