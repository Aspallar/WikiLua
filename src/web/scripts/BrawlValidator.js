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

    function checkBasicLands(deck) {
        var landNames = ['Forest', 'Plains', 'Mountain', 'Island', 'Swamp'];
        var lands = deck.filter(function () {
            return landNames.includes($(this).text());
        }).addClass('mdw-basic-land');
        if (lands.length > 1) {
            lands.addClass('mdw-wrong-color-identity');
            return false;
        }
        return true;
    }

    function notifyResult(valid, commander, identity) {
        var commanderText = ' (' + commander + ': ' + (identity || 'colorless') + ').';
        if (valid)
            notify('Deck passes color identity checks' + commanderText, 'notify');
        else
            notify('Deck failed color identity checks' + commanderText, 'error');
    }

    function validateBrawl(event) {
        event.preventDefault();
        loadIdentities().done(function () {
            var deck = $('div.div-col.columns.column-count.column-count-2 span.card-image-tooltip');
            var commander = deck.first().text();
            var commanderIdentity = getIdentity(commander);
            if (commanderIdentity !== undefined) {
                var identityCheck, valid;
                if (commanderIdentity === '') {
                    identityCheck = /^$/;
                    valid = checkBasicLands(deck);
                    deck = deck.not('.mdw-basic-land');
                } else {
                    identityCheck = new RegExp('^[' + commanderIdentity + ']*$');
                    valid = true;
                }
                valid = deck.filter(function () {
                    return !identityCheck.test(getIdentity($(this).text()));
                }).addClass('mdw-wrong-color-identity').length === 0 && valid;
                notifyResult(valid, commander, commanderIdentity);
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
