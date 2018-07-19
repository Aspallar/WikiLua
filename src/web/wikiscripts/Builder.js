(function ($) {
    'use strict';
    /*global mw, globalCardnames */
    /*jshint -W003*/

    console.log('Build C');

    if (document.getElementById('mdw-deck-builder') === null || $('#mdw-disabled-js').attr('builder-1-0-0'))
        return;

    var builtDeck = {};
    var cardNames;

    function getBaseUrl() {
        return mw.config.get('wgArticlePath').replace('$1', '');
    }

    function buildUrl(page, query) {
        return getBaseUrl() + page + (query ? '?' + $.param(query) : '');
    }

    function removeIncludes(contents) {
        return contents.replace(/<[\/]?noinclude>|<[\/]?includeonly>/g, '');
    }

    function validCard(card) {
        return cardNames.includes(card);
    }

    function updateUi() {
        $('#mdw-db-savedeck').prop('disabled', $.isEmptyObject(builtDeck));
    }

    function addToDeck(amount, name) {
        if (builtDeck[name] !== undefined)
            builtDeck[name] += amount;
        else
            builtDeck[name] = amount;
    }

    function removeFromDeck(name) {
        if (builtDeck[name])
            delete builtDeck[name];
    }

    function deckText() {
        var text = '\n';
        for (var card in builtDeck) {
            if (builtDeck.hasOwnProperty(card)) {
                text += builtDeck[card] + ' ' + card + '\n';
            }
        }
        return text;
    }

    function onClickRemoveDeckEntry(){
        /*jshint -W040 */ // allow old school jquery this
        var card = $(this).attr('data-card');
        removeFromDeck(card);
        renderDeck();
        updateUi();
    }

    function showError(message, targetId) {
        $('#' + targetId).text('* ' + message);
    }

    function resetErrors() {
        $('.mdw-error').text('');
    }

    function renderDeckEntry(amount, card) {
        // <li>12 Plains<span class="mdw-db-close" data-card="Plains">x</span></li>
        var close = $('<span class="mdw-db-close" title="Remove deck entry">x</span>')
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
        // deferred.resolve(globalCardnames);
        $.get(buildUrl('MediaWiki:Custom-Cards', {action: 'raw'}), function (data) {
            var cardnames = [];
            data.split('\n').forEach(function (cardname) {
                if (cardname.length > 0) cardnames.push(cardname);
            });
            cardnames.sort();
            deferred.resolve(cardnames);
        });
        return deferred;
    }

    function onClickAdd() {
        resetErrors();
        var card = $('#mdw-db-cardname').val();
        var amount = $('#mdw-db-amount').val();
        if (card.length !== 0) {
            if (validCard(card)) {
                amount = amount === '' ? 1 : parseInt(amount, 10);
                addToDeck(amount, card);
                renderDeck();
            } else {
                showError('Not a valid card name.', 'mdw-db-error');
            }
        }
        updateUi();
    }

    function onAmountInput() {
        /*jshint -W040 */ // allow old school jquery this
        resetErrors();
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

    function onFocusSelectAll() {
        /*jshint -W040 */ // allow old school jquery this
        $(this).select();
    }

    function unexpectedError(message) {
        console.log(message);
    }

    function handleCreateError(error) {
        // enableButton();
        if (error.code === 'articleexists') {
            showError('Deck name already in use.', 'mdw-deckname-error');
            $('#mdw-import-deckname').focus();
        } else if (error.code === 'invalidtitle') {
            showError('Invalid deck name.', 'mdw-deckname-error');
            $('#mdw-import-deckname').focus();
        } else {
            unexpectedError(error.info);
        }
    }

    function redirectToTitle(title) {
        var url = mw.config.get('wgArticlePath').replace('$1', title);
        window.location = url;
    }

    function createDeckPage(name, deckText) {
        mw.loader.using('mediawiki.api').then(function () {
            $.get(buildUrl('Template:NewDeck', {action: 'raw'})).then(function (newDeckTemplate) {
                var content = removeIncludes(newDeckTemplate).replace('$1', deckText);
                var title = 'Decks/' + name;
                new mw.Api().post({
                    action: 'edit',
                    title: title,
                    summary: 'New deck posted via deck builder',
                    createonly: 'yes',
                    text: content,
                    token: mw.user.tokens.get('editToken')
                }).done(function(result) {
                    if (result.error === undefined) {
                        redirectToTitle(title);
                    } else {
                        handleCreateError(result.error);
                    }
                }).fail(function(code, result) {
                    unexpectedError(code + (code === 'http' ? ' ' + result.textStatus : ''));
                });
            });
        });
    }

    function onClickSave() {
        resetErrors();
        var name = $('#mdw-db-deckname').val();
        if (name.length > 0) {
            var text = deckText();
            createDeckPage(name, text);
        } else {
            showError('You must enter a deck name.', 'mdw-deckname-error');
        }
    }

    function createForm() {
        var add = $('<input type="button" id="mdw-db-add" value="Add" />')
            .click(onClickAdd);
        var save = $('<input type="button" id="mdw-db-savedeck" disabled value="Save Deck">')
            .click(onClickSave);
        var amount = $(document.createDocumentFragment())
            .append('<label for="mdw-db-amount">Amount</label><br />')
            .append($('<input type="number" id="mdw-db-amount" min="1" max="99" value="1">').on('input', onAmountInput));
        var cardname = $(document.createDocumentFragment())
            .append('<label for="mdw-db-cardname">Card Name</label><br />')
            .append($('<input type="text" id="mdw-db-cardname">').focus(onFocusSelectAll).on('input', resetErrors));
        $('#mdw-db-cardname-span').replaceWith(cardname);
        $('#mdw-db-amount-span').replaceWith(amount);
        $('#mdw-db-add-span').replaceWith(add);
        $('#mdw-db-savedeck-span').replaceWith(save);
        $('#mdw-db-deckname-span').replaceWith('<label for="mdw-db-deckname">Deck Name</span> <input type="text" id="mdw-db-deckname" placeholder="Enter a name for your deck here." size="40">');
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