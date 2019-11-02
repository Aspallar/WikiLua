(function ($) {
    'use strict';
    /*global mw, BannerNotification*/

    if (mw.config.get('wgTitle').substring(0, 6) !== 'Decks/')
        return;

    var identities;

    function notify(message, type) {
        new BannerNotification(message, type).show();
    }

    function parseIdentities(data) {
        identities = {};
        data.split('\n').forEach(function (line) {
            var entry = line.split('|');
            identities[entry[0]] = entry[1];
        });
    }

    function loadIdentities() {
        var deferred = $.Deferred();
        if (identities) {
            deferred.resolve();
        } else {
            var cached = sessionStorage.getItem('mdw-color-identity');
            if (cached !== null) {
                identities = JSON.parse(cached);
                deferred.resolve();
            } else {
                $.get(mw.util.getUrl('MediaWiki:Custom-Cards-ColorIdentity', {action: 'raw'})).done(function (data) {
                    parseIdentities(data);
                    sessionStorage.setItem('mdw-color-identity', JSON.stringify(identities));
                    deferred.resolve();
                }).fail(function () {
                    deferred.reject();
                });
            }
        }
        return deferred.promise();
    }

    function getIdentity(name) {
        var identity = identities[name];
        if (identity === undefined)
            notify('No identity data for ' + name, 'error');
        return identity;
    }

    function validateBrawl(event) {
        event.preventDefault();
        loadIdentities().done(function () {
            var deck = $('div.div-col.columns.column-count.column-count-2 span.card-image-tooltip');
            deck.removeClass('mdw-wrong-color-identity');
            var commander = deck.first().text();
            var commanderIdentity = getIdentity(commander);
            if (commanderIdentity) {
                var identityCheck = new RegExp('^[' + commanderIdentity + ']+$|^$');
                var valid = true;
                deck.each(function () {
                    var that = $(this);
                    if (!identityCheck.test(getIdentity(that.text()))) {
                        valid = false;
                        that.addClass('mdw-wrong-color-identity');
                    }
                });
                if (valid)
                    notify('Deck passes color identity checks (' + commander + ' ' + commanderIdentity + ').', 'notify');
                else
                    notify('Deck failed color identity checks (' + commander + ' ' + commanderIdentity + ').', 'error');
            } else {
                notify('Cannot verify colorless commander decks (' + commander + ').', 'error');
            }
        }).fail(function () {
            notify('Unable to obtain color identity data','error');
        });
    }

    $(function () {
        $('#my-tools-menu').prepend(
            $('<li>').append($('<a href="#">Brawl Check</a>').click(validateBrawl))
        );
    });

}(jQuery));
