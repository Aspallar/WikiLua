(function () {
    'use strict';
    /*global mw*/
    if (mw.config.get('wgPageName') !== 'Special:CreateCardPages')
        return;

    var api, cardNames, summary, status, lastStatus, cardIndex = 0;

    function fetchCardNames(setCode) {
        var deferred = $.Deferred(),
            wikiText = '{{CardNames|Set$' + setCode + '}}';

        api.get({
            action: 'parse',
            disablepp: '',
            prop: 'text',
            contentformat: 'text/plain',
            text: wikiText
        }).done(function(data) {
            if (data.parse && data.parse.text) {
                var names = data.parse.text['*'].split('\n');
                if (names.length > 0 && names[0].startsWith('<p>')) {
                    names[0] = names[0].substring(3);
                    names.pop();
                    cardNames = names;
                } else {
                    cardNames = [];
                }
                deferred.resolve();
            }
        });

        return deferred.promise();
    }

    function enableButton(enabled) {
        $('#mdw-cpp-create').prop('disabled', !enabled);
    }

    function startMessage(msg) {
        lastStatus = $('<span>', {
            class: 'mdw-cpp-message',
            html: mw.html.escape(msg)
        });
        status.append(lastStatus);
        $('html').animate({
            scrollTop: (lastStatus.offset().top)
        }, 50);        
    }

    function endMessage(resultCode, isError) {
        lastStatus.append(' (' + mw.html.escape(resultCode) + ')').append('<br>');
        if (isError)
            lastStatus.addClass('mdw-cpp-error');
    }

    function createCardPages() {
        startMessage(cardNames[cardIndex]);
        api.post({
            action: 'edit',
            summary: summary,
            createonly: '',
            title: cardNames[cardIndex],
            text: '{{CardPage}}',
            token: mw.user.tokens.get('editToken')
        }).done(function (data) {
            if (data.error)
                endMessage(data.error.code, true);
            else
                endMessage(data.edit.result);
            if (++cardIndex < cardNames.length) {
                setTimeout(createCardPages, 1000);
            } else {
                status.append('<br>DONE!');
                enableButton(true);
            }
        }).fail(function () {
            endMessage('ABORTED: Network failure', true);
            enableButton(true);
        });
    }

    function clickCreate() {
        var setCode = $('#mdw-ccp-setcode').val().trim().toUpperCase();
        if (setCode.length > 0) {
            enableButton(false);
            status.empty();
            fetchCardNames(setCode).done(function () {
                if (cardNames.length > 0) {
                    summary = 'Creating card pages for ' + setCode;
                    setTimeout(createCardPages, 100);
                } else {
                    status.html('<p>No cards found in set</p>');
                    enableButton(true);
                }
            });
        } else {
            status.html('<p>Enter a set code</p>');
        }
    }

    function createForm(container) {
        var button = $('<button id="mdw-cpp-create">Create Card Pages</button>').click(clickCreate);
        status = $('<div>', {style: 'clear:both;'});
        container.empty()
            .append($('<img>', {
                style: 'float: left; margin-right:20px;',
                src: 'https://vignette.wikia.nocookie.net/magicarena/images/1/19/Cardback.png/revision/latest?cb=20171013170540',
                width: '80px'
            }))
            .append('Set: <input type="text" id="mdw-ccp-setcode" class="mdw-ctt-input"/><br><br>')
            .append(button)
            .append('<br><br>')
            .append(status);
    }

    function initialize() {
        var title = 'Create Card Pages';
        $('.page-header__title').text(title);
        $('title').text(title);
        $('footer').remove();
        createForm($('#mw-content-text'));
    }

    mw.loader.using('mediawiki.api', function () {
        api = new mw.Api();
        $(initialize);
    });

}());
