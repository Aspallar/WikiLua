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
            identities[entry[0]] = {
                id: entry[1],
                legendary: entry.length > 2
            };
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
        if (identity === undefined) {
            notify('No identity data for ' + name, 'error');
            return identity;
        }
        return identity.id;
    }

    function checkBasicLands(deck) {
        var landNames = ['Forest', 'Plains', 'Mountain', 'Island', 'Swamp'];
        var lands = deck.filter(function () {
            return landNames.includes($(this).text());
        }).addClass('mdw-basic-land');
        if (lands.length > 1) {
            lands.addClass('mdw-wrong-color-identity');
            return 1;
        }
        return 0;
    }

    function getCardData() {
        var data;
        try { data = JSON.parse($('#mdw-chartdata-pre').text()); } catch (e) { }
        return data || [];
    }

    function commanderText(commander, identity) {
        return '(' + commander + ': ' + (identity || 'colorless') + ').';
    }

    function checkCommanderType(commander, identity, cardData) {
        if (!identities[commander].legendary ||
            !cardData.find(function (e) {
                return e.name === commander && (e.types.includes('Planeswalker') || e.types.includes('Creature'));
            })
        ) {
            notify(commanderText(commander, identity) + ' is not a legendary planeswalker or creature.', 'error');
            return 1;
        }
        return 0;
    }

    function checkAmounts(cardData) {
        if (cardData.find(function (e) { return e.rarity !== 'Basic Land' && e.num !== 1; })) {
            notify('Amounts check failed. More than 1 card of the same type', 'error');
            return 1;
        }
        return 0;
    }

    function checkColors(deck, commander, identity) {
        var identityCheck, errors;
        if (identity === '') {
            identityCheck = /^$/;
            errors = checkBasicLands(deck);
            deck = deck.not('.mdw-basic-land');
        } else {
            identityCheck = new RegExp('^[' + identity + ']*$');
            errors = 0;
        }
        errors += deck.filter(function () {
            return !identityCheck.test(getIdentity($(this).text()));
        }).addClass('mdw-wrong-color-identity').length;
        if (errors !== 0)
            notify('Deck failed color identity checks ' + commanderText(commander,identity), 'error');

        return errors;
    }

    function validateBrawl(event) {
        event.preventDefault();
        loadIdentities().done(function () {
            var cardData = getCardData();
            var deck = $('div.div-col.columns.column-count.column-count-2 span.card-image-tooltip');
            var commander = deck.first().text();
            var commanderIdentity = getIdentity(commander);
            var errors = checkCommanderType(commander, commanderIdentity, cardData) +
                checkAmounts(cardData) +
                checkColors(deck, commander, commanderIdentity);
            if (errors === 0)
                notify('All brawl checks passed ' + commanderText(commander, commanderIdentity),'notify');
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
