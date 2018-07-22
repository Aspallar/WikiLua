(function ($) {
    'use strict';
    /*global mw, globalCardnames */
    /*jshint -W003*/

    console.log('Builder Build X');

    if (document.getElementById('mdw-deck-builder') === null || $('#mdw-disabled-js').attr('builder-1-0-0'))
        return;

    var builtDeck = {};
    var builtSideboard = {};
    var activeBuilt = builtDeck;
    var deckPage;
    var cardNames;
    var cardNamesCasing;
    var isNewDeck = true;

    function getBaseUrl() {
        return mw.config.get('wgArticlePath').replace('$1', '');
    }

    function buildUrl(page, query) {
        return getBaseUrl() + page + (query ? '?' + $.param(query) : '');
    }

    function removeIncludes(contents) {
        return contents.replace(/<[\/]?noinclude>|<[\/]?includeonly>/g, '');
    }

    function updateUi() {
        $('#mdw-db-savedeck').prop('disabled', $.isEmptyObject(builtDeck));
    }

    function addToBuild(amount, name) {
        if (activeBuilt[name] !== undefined)
            activeBuilt[name] += amount;
        else
            activeBuilt[name] = amount;
    }

    function removeFromBuild(name) {
        if (activeBuilt[name] !== undefined)
            delete activeBuilt[name];
    }

    function parseCardEntry(entry) {
        entry = entry.trim();
        if (entry.length === 0)
            return null;
        var pos = entry.indexOf('///');
        if (pos === -1)
            pos = entry.indexOf('(');
        if (pos !== -1 && pos > 1)
            entry = entry.substring(0, pos - 1);
        var match = /([0-9]+)\s+(.*)/.exec(entry);
        if (match) {
            var amount = parseInt(match[1], 10);
            var casedName = cardNamesCasing[match[2].toLowerCase()];
            var name = casedName !== undefined ? casedName : match[2];
            return { amount: amount, name: name };
        } else {
            return null;
        }
    }

    function initCardNamesCasing() {
        cardNamesCasing = {};
        cardNames.forEach(function (card) {
            cardNamesCasing[card.toLowerCase()] = card;
        });
    }

    function deckText() {
        var text = '\n';
        for (var card in builtDeck) {
            if (builtDeck.hasOwnProperty(card)) {
                text += builtDeck[card] + ' ' + card + '\n';
            }
        }
        if (!$.isEmptyObject(builtSideboard)) {
            text += '---- sideboard ----\n';
            for (var card in builtSideboard) {
                if (builtSideboard.hasOwnProperty(card)) {
                    text += builtSideboard[card] + ' ' + card + '\n';
                }
            }
        }
        return text;
    }

    function extractDeckText(content) {
        // TODO: handle deck format error, assuming page is correct for now
        var startPos = content.indexOf('|Deck=') + 6;
        var endPos = content.indexOf('}}', startPos);
        var deckText = content.substring(startPos, endPos);
        return deckText;
    }


    function showError(message, targetId) {
        $('#' + targetId).text('* ' + message);
    }

    function resetErrors() {
        $('.mdw-error').text('');
    }

    function renderCardEntry(amount, card) {
        // <li>12 Plains<span class="mdw-db-close" data-card="Plains">x</span></li>
        var close = $('<span class="mdw-db-close" title="Remove deck entry">&times;</span>')
            .attr('data-card', card)
            .click(onClickRemoveDeckEntry);
        var entry = $('<li>').html(amount + ' ' + card).append(close);
        return entry;
    }

    function renderCardList(cardList) {
        var count = 0;
        var renderedList = $(document.createDocumentFragment());
        for (var card in cardList) {
            if (cardList.hasOwnProperty(card)) {
                count += cardList[card];
                renderedList.append(renderCardEntry(cardList[card], card));
            }
        }
        return { content: renderedList, count: count };
    }

    function renderOneList(cardList, listElement, countElement, badCheck) {
        var renderedList = renderCardList(cardList);
        listElement.html(renderedList.content);
        countElement.text(renderedList.count);
        if (badCheck(renderedList.count))
            countElement.addClass('mdw-db-baddeck');
        else
            countElement.removeClass('mdw-db-baddeck');
    }

    function renderDeck() {
        renderOneList(builtDeck, $('#mdw-db-decklist'), $('#mdw-db-deckcount'), function (count) {
            return count < 60;
        });
        renderOneList(builtSideboard, $('#mdw-db-sidelist'), $('#mdw-db-sidecount'), function (count) {
            return count > 15;
        });
    }

    function onClickRemoveDeckEntry(){
        /*jshint -W040 */ // allow old school jquery this
        var card = $(this).attr('data-card');
        removeFromBuild(card);
        renderDeck();
        updateUi();
    }

    function wikiApiCall(data, method) {
        data.format = 'json';
        return $.ajax({
            data: data,
            dataType: 'json',
            url: mw.config.get('wgScriptPath') + '/api.php',
            type: method,
            timeout: 10000 
        });
    }

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
            var name = cardNamesCasing[card.toLowerCase()];
            if (name !== undefined) {
                amount = amount === '' ? 1 : parseInt(amount, 10);
                addToBuild(amount, name);
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

    function updateDeckPage(name, deckText) {
        var content = getContentsFromPage(deckPage);
        var startPos = content.indexOf('|Deck=') + 6;
        var endPos = content.indexOf('}}', startPos);
        var newContent = content.substring(0, startPos) + deckText + content.substring(endPos);
        var title = 'Decks/' + name;
        wikiApiCall({
            action: 'edit',
            summary: 'Deck update via deck builder',
            title: title,
            basetimestamp: deckPage.revisions[0].timestamp,
            startimestamp: deckPage.starttimestamp,
            text: newContent,
            token: deckPage.edittoken
        },'POST').done(function (response) {
            redirectToTitle(title);
        });
    }

    function getContentsFromPage(page) {
        var content = page.revisions[0]['*'];
        return content;
    }

    function getPageFromResponse(response) {
        var pages = response.query.pages;
        for (var property in pages) {
            if (pages.hasOwnProperty(property))
                return pages[property];
        }
        return null;
    }

    function fetchDeckPage(title) {
        var deferred = $.Deferred();
        wikiApiCall({
            action: 'query',
            prop: 'info|revisions',
            intoken: 'edit',
            titles: 'Decks/' + title,
            rvprop: 'content|timestamp',
            rvlimit: '1'
        }, 'GET').done(function (response) {
            var page = getPageFromResponse(response);
            deferred.resolve(page);
        });
        return deferred;
    }

    function initDeckFromDeckText(text) {
        var currentList = builtDeck;
        text.split('\n').forEach(function (line) {
            if (line.substring(0, 2) !== '--') {
                var card = parseCardEntry(line);
                if (card !== null)
                    currentList[card.name] = card.amount;
            } else {
                currentList = builtSideboard;
            }
        });
        renderDeck();
    }

    function onClickSave() {
        resetErrors();
        var name = $('#mdw-db-deckname').val();
        if (name.length > 0) {
            var text = deckText();
            if (isNewDeck)
                createDeckPage(name, text);
            else
                updateDeckPage(name, text);
        } else {
            showError('You must enter a deck name.', 'mdw-deckname-error');
        }
    }

    function activateDeck() {
        activeBuilt = builtDeck;
        $('#mdw-sidetab-button').removeClass('mdw-db-activetab');
        $('#mdw-decktab-button').addClass('mdw-db-activetab');
        $('#mdw-db-sidetab').hide();
        $('#mdw-db-decktab').fadeIn(100);
    }

    function activateSideboard() {
        activeBuilt = builtSideboard;
        $('#mdw-decktab-button').removeClass('mdw-db-activetab');
        $('#mdw-sidetab-button').addClass('mdw-db-activetab');
        $('#mdw-db-decktab').hide();
        $('#mdw-db-sidetab').fadeIn(100);
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
        $('#mdw-decktab-button').click(activateDeck);
        $('#mdw-sidetab-button').click(activateSideboard);
    }

    function initialize() {
        fetchCardNames().done(function (cardnames) {
            cardNames = cardnames;
            mw.loader.using('jquery.ui.autocomplete', function () {
                createForm();
                initCardNamesCasing();
                $('#mdw-db-cardname').autocomplete({
                    source: cardnames
                });
                var deckName = mw.util.getParamValue('deck');
                if (deckName) {
                    isNewDeck = false;
                    $('#mdw-db-deckname').val(deckName).prop('disabled', true);
                    fetchDeckPage(deckName).done(function (page) {
                        deckPage = page;
                        var deckText = extractDeckText(getContentsFromPage(page));
                        initDeckFromDeckText(deckText);
                    });
                }
            });
        });
    }

    $(document).ready(initialize);

}(jQuery));