(function () {
    'use strict';
    /*global mw, Set */

    if (mw.config.get('wgTitle').substring(0, 6) !== 'Decks/' ||
            mw.config.get('wgAction') !== 'view') {
        return;
    }

    function safeParse(jsonText) {
        try {
            return JSON.parse(jsonText);
        } catch(e) {
            return [];
        }
    }

    function sumCards(cards, sums) {
        cards.forEach(function (card) {
            if (!card.isCmp && card.rarity !== 'Basic Land')
                sums[card.name] = (sums[card.name] + card.num) || card.num;
        });
    }

    function getOverCards() {
        var card, over = new Set(), sums = Object.create(null);
        sumCards(safeParse($('#mdw-chartdata-pre').text()), sums);
        sumCards(safeParse($('#mdw-sideboard-data').text()), sums);
        for (card in sums) {
            if (sums[card] > 4)
                over.add(card);
        }
        return over;
    }

    function validateDeck() {
        var over = getOverCards();
        if (over.size > 0) {
            $('div.div-col.columns.column-count.column-count-2 span.card-image-tooltip')
                .filter(function () { return over.has($(this).text()); })
                .addClass('mdw-more-than-4');
        }
    }

    $(validateDeck);

}());