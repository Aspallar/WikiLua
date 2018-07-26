// ==========================================================================
// Implements a deck builder/editor to allow users to edit deck definitions
// without having to edit wikitext
//
// Version 1.0.0
// Author: Aspallar
//
// This is a beta release of a 'minimum viable product' version of the builder
// there are still features to add to make it complete and the code could do
// with having some structure added to it. Released early because there have
// been a significant number of deck submission fails recently because users
// are either scared of editing wikitext, or cannot be bothered with having to
// manually look up and type the card names, they expect a builder like they
// get on other sites.
//
// ** Please do not edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
(function ($) {
    'use strict';
    /*global mw, globalCardnames */ // globalCardnames is only for local testing
    /*jshint -W003*/ // used before defined (for onClickRemoveDeckEntry)

    if (document.getElementById('mdw-deck-builder') === null || $('#mdw-disabled-js').attr('data-builder-1-0-0'))
        return;

    var builtDeck = {};
    var builtSideboard = {};
    var activeBuilt = builtDeck;
    var isNewDeck = true;
    var deckPage;
    var cardNames;
    var throbber;

    var deckCards;
    // var sideboardCards;

    function CardList(container, countElement, badCheck) {
        var cards = {};
        var listElement = container.find('ul');

        function onClickRemoveDeckEntry() {
            console.log('onClickRemoveDeckEntry');
        }

        function onClickAddOne() {
            console.log('onClickAddOne');
        }

        function onClickRemoveOne() {
            console.log('onClickRemoveOne');
        }

        function renderCardEntry(amount, card) {
            var close = $('<span class="mdw-db-removeall" title="Remove all">&times;</span>')
                .click(onClickRemoveDeckEntry);
            var minus = $('<span class="mdw-db-minus" title="Remove one">&minus;</span>')
                .attr('data-card', card)
                .click(onClickRemoveOne);
            var plus = $('<span class="mdw-db-plus" title="Add one">&#43;</span>')
                .attr('data-card', card)
                .click(onClickAddOne);
            var entry = $('<li>')
                .html(amount + ' ' + card)
                .attr('data-card', card)
                .append(plus)
                .append(minus)
                .append(close);
            return entry;
        }

        function renderCardList() {
            var count = 0;
            var renderedList = $(document.createDocumentFragment());
            for (var card in cards) {
                if (cards.hasOwnProperty(card)) {
                    count += cards[card];
                    renderedList.append(renderCardEntry(cards[card], card));
                }
            }
            return { content: renderedList, count: count };
        }

        function drawAll() {
            var renderedList = renderCardList();
            listElement.html(renderedList.content);
            countElement.text(renderedList.count);
            if (badCheck(renderedList.count))
                countElement.addClass('mdw-db-bad');
            else
                countElement.removeClass('mdw-db-bad');
        }
       
        function addCards(name, amount) {
            if (cards[name] !== undefined)
                cards[name] += amount;
            else
                cards[name] = amount;
            drawAll();
        }

        return {
            addCards: addCards
        };

    } // end CardList

    function fatalError(message) {
        $('#mdw-deck-builder').hide();
        $('#mdw-db-errormessage').text(message);
        $('#mdw-db-fatal-error').show();
    }

    function makeThrobber() {
        var ajaxLoaderImgSrc = mw.config.get('stylepath') + '/common/images/ajax-loader.gif';
        return $('<div>', {
            css: {
                background: 'rgba(255, 255, 255, 0.5)',
                position: 'fixed',
                height: '100%',
                width: '100%',
                left: '0',
                top: '0',
                'z-index': '1000000000'
            },
            html: $('<img>', {src: ajaxLoaderImgSrc, class: 'mdw-centered'})
        });
    }

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

    function addOneToBuild(name) {
        ++activeBuilt[name];
    }

    function removeOneFromBuild(name) {
        --activeBuilt[name];
        if (activeBuilt[name] <= 0)
            removeFromBuild(name);
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
            var casedName = cardNames[match[2].toLowerCase()];
            var name = casedName !== undefined ? casedName : mw.html.escape(match[2]);
            return { amount: amount, name: name };
        } else {
            return null;
        }
    }

    function initCardNames(cards) {
        cardNames = {};
        cards.forEach(function (card) {
            cardNames[card.toLowerCase()] = card;
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
            for (card in builtSideboard) {
                if (builtSideboard.hasOwnProperty(card)) {
                    text += builtSideboard[card] + ' ' + card + '\n';
                }
            }
        }
        return text;
    }

    function extractDeckText(content) {
        var startPos = content.indexOf('|Deck=');
        if (startPos === -1)
            return null;
        var endPos = content.indexOf('}}', startPos);
        if (endPos === -1)
            return null;
        startPos += 6;
        if (startPos >= endPos)
            return null;
        var deckText = content.substring(startPos, endPos);
        return deckText;
    }


    function showError(message, targetId) {
        $('#' + targetId).text('* ' + message);
    }

    function resetErrors() {
        $('.mdw-error').html('');
    }

    function renderCardEntry(amount, card) {
        var close = $('<span class="mdw-db-removeall" title="Remove all">&times;</span>')
            .click(onClickRemoveDeckEntry);
        var minus = $('<span class="mdw-db-minus" title="Remove one">&minus;</span>')
            .attr('data-card', card)
            .click(onClickRemoveOne);
        var plus = $('<span class="mdw-db-plus" title="Add one">&#43;</span>')
            .attr('data-card', card)
            .click(onClickAddOne);
        var entry = $('<li>')
            .html(amount + ' ' + card)
            .attr('data-card', card)
            .append(plus)
            .append(minus)
            .append(close);
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

    function drawList(cardList, listElement, countElement, badCheck) {
        var renderedList = renderCardList(cardList);
        listElement.html(renderedList.content);
        countElement.text(renderedList.count);
        if (badCheck(renderedList.count))
            countElement.addClass('mdw-db-bad');
        else
            countElement.removeClass('mdw-db-bad');
    }

    function drawDeck() {
        drawList(builtDeck, $('#mdw-db-decklist'), $('#mdw-db-deckcount'), function (count) {
            return count < 60;
        });
        drawList(builtSideboard, $('#mdw-db-sidelist'), $('#mdw-db-sidecount'), function (count) {
            return count > 15;
        });
    }

    function getCard(element) {
        return $(element).parent().attr('data-card');
    }

    function onClickRemoveDeckEntry() {
        /*jshint -W040 */ // allow old school jquery this
        removeFromBuild(getCard(this));
        drawDeck();
        updateUi();
    }

    function onClickAddOne() {
        /*jshint -W040 */ // allow old school jquery this
        addOneToBuild(getCard(this));
        drawDeck();
        updateUi();
    }

    function onClickRemoveOne() {
        /*jshint -W040 */ // allow old school jquery this
        removeOneFromBuild(getCard(this));
        drawDeck();
        updateUi();
    }

    function wikiApiCall(data, method) {
        data.format = 'json';
        return $.ajax({
            data: data,
            dataType: 'json',
            url: mw.config.get('wgScriptPath') + '/api.php',
            type: method
        });
    }

    function fetchCardNames() {
        var deferred = $.Deferred();
        deferred.resolve(globalCardnames); // used for local testing
        // $.get(buildUrl('MediaWiki:Custom-Cards', {action: 'raw'})).done(function (data) {
        //     var cardnames = [];
        //     data.split('\n').forEach(function (cardname) {
        //         if (cardname.length > 0) cardnames.push(cardname);
        //     });
        //     cardnames.sort();
        //     deferred.resolve(cardnames);
        // }).fail(function () {
        //     fatalError('Unable to obtain card data.');
        // });
        return deferred;
    }

    function onClickAdd() {
        resetErrors();
        var card = $('#mdw-db-cardname').val();
        var amount = $('#mdw-db-amount').val();
        if (card.length !== 0) {
            var name = cardNames[card.toLowerCase()];
            if (name !== undefined) {
                amount = amount === '' ? 1 : parseInt(amount, 10);
                deckCards.addCards(name, amount);
                //addToBuild(amount, name);
                //drawDeck();
                //updateUi();
            } else {
                showError('Not a valid card name.', 'mdw-db-error');
            }
        }
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
        throbber.remove();
        var html = '<p>There has been an unexpected error while processing the request</p><p>' +
            message +
            '</p>';
        $('#mdw-db-error').html(html);
        window.scrollTo(0, 0);
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


    function handleCreateError(error) {
        throbber.remove();
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

    function handleUpdateError(error) {
        throbber.remove();
        unexpectedError(error.info);
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
            }).fail(function () {
                fatalError('The new deck template could not be loaded.');
            });
        });
    }

    function updateDeckPage(name, deckText) {
        var content = getContentsFromPage(deckPage);
        var startPos = content.indexOf('|Deck=');
        var endPos = content.indexOf('}}', startPos);
        var newContent = content.substring(0, startPos + 6) + deckText + content.substring(endPos);
        var title = 'Decks/' + name;
        wikiApiCall({
            action: 'edit',
            summary: 'Deck update via deck builder',
            title: title,
            basetimestamp: deckPage.revisions[0].timestamp,
            startimestamp: deckPage.starttimestamp,
            text: newContent,
            token: deckPage.edittoken
        },'POST').done(function (result) {
            if (result.error === undefined) {
                redirectToTitle(title);
            } else {
                handleUpdateError(result.error);
            }
        }).fail(function () {
            unexpectedError('Network error while updating deck.');
        });
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
            if (page.missing !== undefined) {
                fatalError('Unable to load requested deck, deck page not found.');
                return;
            }
            deferred.resolve(page);
        }).fail(function () {
            fatalError('Network error while loading deck.');
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
        drawDeck();
    }

    function onClickSave() {
        resetErrors();
        var name = $('#mdw-db-deckname').val();
        if (name.length > 0) {
            throbber.appendTo(document.body);
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
        throbber = makeThrobber();
        deckCards = new CardList($('#mdw-db-decktab'), $('#mdw-db-deckcount'), function(count) {
            return count < 60;
        });
        fetchCardNames().done(function (cardnames) {
            mw.loader.using('jquery.ui.autocomplete', function () {
                createForm();
                initCardNames(cardnames);
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
                        if (deckText !== null) {
                            initDeckFromDeckText(deckText);
                            $('#mdw-deck-builder').fadeIn(300);
                        } else {
                            fatalError('The deck definition cannot be read. Does the deck page contain a valid deck definition?');
                        }
                    });
                } else {
                    $('#mdw-deck-builder').fadeIn(300);
                }
            });
        });
    }

    $(document).ready(initialize);

}(jQuery));