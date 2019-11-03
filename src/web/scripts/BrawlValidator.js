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
        var basicLands = JSON.parse($('#mdw-chartdata-pre').text())
            .filter(function (c) { return c.rarity === 'Basic Land'; });
        var count = 0;
        deck.each(function () {
            var that = $(this);
            var name = that.text();
            if (basicLands.find(function (c) { return c.name === name; })) {
                that.addClass('mdw-basic-land');
                ++count;
            }
        });
        if (count > 1) {
            deck.siblings('.mdw-basic-land').addClass('mdw-wrong-color-identity');
            return false;
        }
        return true;
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
