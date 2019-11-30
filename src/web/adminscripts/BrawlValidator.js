(function ($) {
    'use strict';
    /*global mw, BannerNotification*/

    if (mw.config.get('wgTitle').substring(0, 6) !== 'Decks/')
        return;

    var identities;
    var wrongColorClass = 'mdw-wrong-color-identity';
    var basicLandClass = 'mdw-basic-land';

    function notify(message, type) {
        new BannerNotification(message, type || 'error').show();
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
        var cacheKey = 'mdw-color-identity';
        var deferred = $.Deferred();
        if (identities) {
            deferred.resolve();
        } else {
            var cached = sessionStorage.getItem(cacheKey);
            if (cached !== null) {
                identities = JSON.parse(cached);
                deferred.resolve();
            } else {
                $.get(mw.util.getUrl('MediaWiki:Custom-Cards-ColorIdentity', {action: 'raw'})).done(function (data) {
                    parseIdentities(data);
                    sessionStorage.setItem(cacheKey, JSON.stringify(identities));
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
        if (!identity) {
            notify('No identity data for ' + name);
            return identity;
        }
        return identity.id;
    }

    function checkBasicLands(deck) {
        var landNames = ['Forest', 'Plains', 'Mountain', 'Island', 'Swamp'];
        var lands = deck.filter(function () {
            return landNames.includes($(this).text());
        }).addClass(basicLandClass);
        if (lands.length > 1) {
            lands.addClass(wrongColorClass);
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
            notify(commanderText(commander, identity) + ' is not a legendary planeswalker or creature.');
            return 1;
        }
        return 0;
    }

    function checkAmounts(deck, cardData) {
        var wrongAmounts = cardData.filter(function (e) {
                return e.name === 'Seven Dwarves' ? e.num > 7 : e.rarity !== 'Basic Land' && e.num !== 1;
            }).map(function (e) { return e.name; });
        if (wrongAmounts.length > 0) {
            deck.filter(function () { return wrongAmounts.includes($(this).text()); })
                .addClass('mdw-wrong-brawl-amount');
            notify('Invalid card amounts.');
        }
        return wrongAmounts.length;
    }

    function checkTotal(cardData) {
        if (cardData.reduce(function (a, e) { return a + e.num; }, 0) !== 60) {
            notify('Deck is not exacly 60 cards.');
            return 1;
        }
        return 0;
    }

    function checkNoSideboard() {
        if ($('#mdw-sideboard-data').text() !== '[]') {
            notify('Sideboards are not allowed in brawl decks.');
            return 1;
        }
        return 0;
    }

    function checkColors(deck, commander, identity) {
        var identityCheck, errors;
        if (identity === '') {
            identityCheck = /^$/;
            errors = checkBasicLands(deck);
            deck = deck.not('.' + basicLandClass);
        } else {
            identityCheck = new RegExp('^[' + identity + ']*$');
            errors = 0;
        }
        errors += deck.filter(function () {
            return !identityCheck.test(getIdentity($(this).text()));
        }).addClass(wrongColorClass).length;
        if (errors !== 0)
            notify('Deck failed color identity checks ' + commanderText(commander, identity));

        return errors;
    }

    function validateBrawl(event) {
        event.preventDefault();
        loadIdentities().done(function () {
            var cardData = getCardData();
            var deck = $('div.div-col.columns.column-count.column-count-2 span.card-image-tooltip');
            var commander = deck.first().text();
            var commanderIdentity = getIdentity(commander);
            var errors = checkNoSideboard() +
                checkTotal(cardData) +
                checkAmounts(deck, cardData) +
                checkCommanderType(commander, commanderIdentity, cardData) +
                checkColors(deck, commander, commanderIdentity);
            if (errors === 0)
                notify('All brawl checks passed ' + commanderText(commander, commanderIdentity), 'notify');
        }).fail(function () {
            notify('Unable to obtain color identity data');
        });
    }

    $(function () {
        $('#my-tools-menu').prepend(
            $('<li>').append($('<a href="#">Brawl Check</a>').click(validateBrawl))
        );
    });

}(jQuery));
