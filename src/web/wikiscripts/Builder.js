(function ($) {
    'use strict';
    /*global mw, globalCardnames */
    /*jshint -W003*/

    console.log('Build B');

    if (document.getElementById('mdw-deck-builder') === null || $('#mdw-disabled-js').attr('builder-1-0-0'))
        return;

    var builtDeck = {};
    var cardNames;

    function validCard(card) {
        return cardNames.includes(card);
    }

    function addToDeck(amount, name) {
        if (builtDeck[name])
            builtDeck[name] += amount;
        else
            builtDeck[name] = amount;
    }

    function removeFromDeck(name) {
        if (builtDeck[name])
            delete builtDeck[name];
    }

    function onClickRemoveDeckEntry(){
        /*jshint -W040 */ // allow old school jquery this
        var card = $(this).attr('data-card');
        removeFromDeck(card);
        renderDeck();
    }

    function showError(message) {
        $('#mdw-db-error').text('* ' + message);
    }

    function hideError() {
        $('#mdw-db-error').text('');
    }

    function renderDeckEntry(amount, card) {
        // <li>12 Plains<span class="mdw-db-close" data-card="Plains">x</span></li>
        var close = $('<span class="mdw-db-close">x</span>')
            .attr('data-card', card)
            .click(onClickRemoveDeckEntry);
        var entry = $('<li>').html(amount + ' ' + card).append(close);
        return entry;
    }

    function renderDeck() {
        var count = 0;
        var deckContents = $(document.createDocumentFragment());
        for (var card in builtDeck) {
            if (builtDeck.hasOwnProperty(card)) {
                count += builtDeck[card];
                deckContents.append(renderDeckEntry(builtDeck[card], card));
            }
        }
        var countElement = $('#mdw-db-cardcount');
        countElement.text(count);
        if (count < 60)
            countElement.addClass('mdw-db-baddeck');
        else
            countElement.removeClass('mdw-db-baddeck');
        $('.mdw-db-deck').html(deckContents);
    }


    // function wikiApiCall(data, method) {
    //     data.format = 'json';
    //     return $.ajax({
    //         data: data,
    //         dataType: 'json',
    //         url: mw.config.get('wgScriptPath') + '/api.php',
    //         type: method,
    //         timeout: 10000 
    //     });
    // }

    function fetchCardNames() {
        var deferred = $.Deferred();
        deferred.resolve(globalCardnames);
        // $.get(mw.config.get('wgArticlePath').replace('$1', 'MediaWiki:Custom-Cards?action=raw'), function (data) {
        //     var cardnames = [];
        //     data.split('\n').forEach(function (cardname) {
        //         if (cardname.length > 0) cardnames.push(cardname);
        //     });
        //     cardnames.sort();
        //     deferred.resolve(cardnames);
        // });
        return deferred;
    }

    function onClickAdd() {
        hideError();
        var card = $('#mdw-db-cardname').val();
        var amount = $('#mdw-db-amount').val();
        var cards = $('')
        if (card.length !== 0) {
            if (validCard(card)) {
                amount = amount === '' ? 1 : parseInt(amount, 10);
                addToDeck(amount, card);
                renderDeck();
            } else {
                showError('Not a valid card name.')
            }
        }
    }

    function onAmountInput() {
        /*jshint -W040 */ // allow old school jquery this
        hideError();
        var amount = $(this);
        var val = amount.val();
        if (val !== '') {
            var max = parseInt(amount.attr('max'), 10);
            var min = parseInt(amount.attr('min'), 10);
            if (val > max)
                amount.val(max);
            else if (val < min)
                amount.val(min);
        }
    }

    function createForm() {
        var add = $('<input type="button" id="mdw-db-add" value="Add" />')
            .click(onClickAdd);
        var amount = $(document.createDocumentFragment())
            .append('<label for="mdw-db-amount">Amount</label><br />')
            .append($('<input type="number" id="mdw-db-amount" min="1" max="99" value="1">').on('input', onAmountInput));
        $('#mdw-db-cardname-span').replaceWith('<label for="mdw-db-cardname">Card Name</label><br /><input type="text" id="mdw-db-cardname" />');
        $('#mdw-db-amount-span').replaceWith(amount);
        $('#mdw-db-add-span').replaceWith(add);
        $('#mdw-db-deck-container').html('<textarea id="mdw-db-deck" cols="40" rows="25"></textarea>');
    }

    function initialize() {
        fetchCardNames().done(function (cardnames) {
            cardNames = cardnames;
            mw.loader.using('jquery.ui.autocomplete', function () {
                createForm();
                $('#mdw-db-cardname').autocomplete({
                    source: cardnames
                });
            });
        });
    }

    $(document).ready(initialize);

}(jQuery));