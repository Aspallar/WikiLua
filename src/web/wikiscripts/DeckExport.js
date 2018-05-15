// ==========================================================================
// Start: Deck Export
// Adds the export text box to deck articles with copy to clipboard button
// and a select to allow export cards to be replaced with reprint alternatives.
// Version 3.2.0
// Author: Aspallar
//
// ** Please dont edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
//
(function ($) {
    'use strict';

    // don't run if this version disabled on page
    if ($('#mdw-disabled-js').attr('data-deckexport-3-2-0'))
        return;

    var importData;
    var labelOption;

    function ImportData() {
        var importCards = [];
        var altImportCards = [];
        var sideboardCards = [];

        function baseDisplayName(card) {
            return card.name + ' (' + card.set + ') ' + card.cardNumber;
        }

        function importDisplayName(card) {
            return card.num + ' ' + baseDisplayName(card);
        }

        function rarityValue(rarity) {
            return { 'Common': 0, 'Uncommon': 1, 'Rare': 2, 'Mythic Rare': 3 }[rarity];
        }

        function findCardByName(name) {
            for (var k = 0, l = importCards.length; k < l; k++) {
                if (importCards[k].name === name)
                    return importCards[k];
            }
            for (k = 0, l = sideboardCards.length; k < l; k++) {
                if (sideboardCards[k].name === name)
                    return sideboardCards[k];
            }
            return null;
        }

        function findAllCardsByName(cards, name) {
            return cards.reduce(function (result, card) {
                if (card.name === name) result.push(card);
                return result;
            }, []);
        }

        function parseCardData(dataString) {
            if (dataString !== null && dataString.length > 0)
                importCards = JSON.parse(dataString);
        }

        function parseSideboardData(dataString) {
            if (dataString !== null && dataString.length > 0)
                sideboardCards = JSON.parse(dataString);
        }

        function parseAltCardData(dataString) {
            altImportCards = [];
            if (dataString !== null && dataString.length > 0) {
                var cards = JSON.parse(dataString);
                cards.forEach(function(card) {
                    if (!altImportCards.some(function (altCard) {
                        return card.name === altCard.name &&
                            card.set === altCard.set;
                    })) altImportCards.push(card);
                });
                altImportCards.sort(function (a, b) {
                    return a.name.localeCompare(b.name);
                });
            }
        }

        function getRarityTotals(cards) {
            var totals = { 'Common': 0, 'Uncommon': 0, 'Rare': 0, 'Mythic Rare': 0 };
            cards.forEach(function (card) {
                var rarity = card.rarity;
                if (rarity !== 'Basic Land')
                    totals[rarity] += card.num;
            });
            return totals;
        }

        function swapCards(altCardIndex) {
            var newCard = altImportCards[altCardIndex];
            var oldCard = findCardByName(newCard.name);
            var oldSet = oldCard.set;
            var oldCardNumber = oldCard.cardNumber;
            var oldCardRarity = oldCard.rarity;

            findAllCardsByName(importCards, newCard.name).forEach(function (card) {
                card.set = newCard.set;
                card.cardNumber = newCard.cardNumber;
                card.rarity = newCard.rarity;
            });
            findAllCardsByName(sideboardCards, newCard.name).forEach(function (card) {
                card.set = newCard.set;
                card.cardNumber = newCard.cardNumber;
                card.rarity = newCard.rarity;
            });

            newCard.set = oldSet;
            newCard.cardNumber = oldCardNumber;
            newCard.rarity = oldCardRarity;

            return baseDisplayName(newCard);
        }

        function adjustToCheapest() {
            for (var k = 0, l = altImportCards.length; k < l; k++) {
                var card = findCardByName(altImportCards[k].name);
                if (rarityValue(altImportCards[k].rarity) < rarityValue(card.rarity))
                    swapCards(k);
            }
        }

        return {
            swapCards: function (altCardIndex) {
                return swapCards(altCardIndex);
            },
            getDeckRarityTotals: function () {
                return getRarityTotals(importCards);
            },
            getSideboardRarityTotals: function () {
                return getRarityTotals(sideboardCards);
            },
            text: function () {
                var text = '';
                importCards.forEach(function(card) {
                    text += importDisplayName(card) + '\n';
                });
                if (sideboardCards.length > 0) {
                    text += '\n';
                    sideboardCards.forEach(function (card) {
                        text += importDisplayName(card) + '\n';
                    });
                }
                return text;
            },
            getAltOptions: function () {
                var options = document.createDocumentFragment();
                altImportCards.forEach(function (card) {
                    $('<option>').html(baseDisplayName(card)).appendTo(options);
                });
                return options;
            },
            hasAlternatives: function () {
                return altImportCards.length > 0;
            },
            hasSideboard: function () {
                return sideboardCards.length > 0;
            },
            initialize: function(deckData, sideboardData, altData) {
                parseCardData(deckData);
                parseSideboardData(sideboardData);
                parseAltCardData(altData);
                adjustToCheapest();
            }
        };
    } // End ImportData

    function sizeTextareaToContents(textarea) {
        textarea.style.overflow = 'hidden';
        textarea.style.height = 'auto';
        textarea.style.height = textarea.scrollHeight + 'px'; 
    }

    function setImportData() {
        importData.initialize(
            $('#mdw-chartdata-pre').text(),
            $('#mdw-sideboard-data').text(),
            $('#mdw-alt-carddata').text()
        );
    }

    function rarityEntry(label, value) {
        return '<span class="mdw-rarity-label">' + label +': </span><span class="mdw-rarity-value">' + value + '</span><br />';
    }

    function rarityContents(rarities) {
        var text = '';
        if (rarities.Common)
            text += rarityEntry('Common', rarities.Common);
        if (rarities.Uncommon)
            text += rarityEntry('Uncommon', rarities.Uncommon);
        if (rarities.Rare)
            text += rarityEntry('Rare', rarities.Rare);
        if (rarities['Mythic Rare'])
            text += rarityEntry('Mythic Rare', rarities['Mythic Rare']);
        if (text.length > 0)
            text = text.substring(0, text.length - '<br />'.length);
        return text;
    }

    function addRarities(a, b) {
        var result = {};
        result.Common = a.Common + b.Common;
        result.Uncommon = a.Uncommon + b.Uncommon;
        result.Rare = a.Rare + b.Rare;
        result['Mythic Rare'] = a['Mythic Rare'] + b['Mythic Rare'];
        return result;
    }

    function setRarityColumn(col, totals) {
        col.get(0).innerHTML = totals.Common;
        col.get(1).innerHTML = totals.Uncommon;
        col.get(2).innerHTML = totals.Rare;
        col.get(3).innerHTML = totals['Mythic Rare'];
    }

    function setRarityContents() {
        if (!importData.hasSideboard()) {
            $('#mdw-import-rarity').html(rarityContents(importData.getDeckRarityTotals())).show();
        } else {
            var table = $('#mdw-rarity-table');
            var deck = importData.getDeckRarityTotals();
            var sideboard = importData.getSideboardRarityTotals();
            setRarityColumn(table.find('td:nth-child(2)'), deck);
            setRarityColumn(table.find('td:nth-child(3)'), sideboard);
            setRarityColumn(table.find('td:nth-child(4)'), addRarities(deck, sideboard));
            table.show();
        }
    }

    function onClickCopy() {
        var importText = document.getElementById('mdw-arena-export-contents');
        importText.select();
        document.execCommand('copy');
        $('#mdw-copied-message').html(' copied to clipboard.');
        setTimeout(function () {
            $('#mdw-copied-message').html('');
        }, 1200);
    }

    function onClickReset() {
        setImportData();
        $('#mdw-import-reset')
            .prop('disabled', true);
        $('#mdw-import-select')
            .html('')
            .append(labelOption)
            .append(importData.getAltOptions());
        $('#mdw-arena-export-contents')
            .html(importData.text());
        setRarityContents();
    }

    function onSelectAlternative() {
        /* jshint -W040 */ // allow old school jquery use of this
        var text = importData.swapCards(this.selectedIndex - 1);
        this.options[this.selectedIndex].text = text;
        $('#mdw-arena-export-contents').html(importData.text());
        $('#mdw-import-reset').prop('disabled', false);
        setRarityContents();
        this.selectedIndex = 0;
    }

    function setupAlternativesUi(container) {
        if (container === null || !importData.hasAlternatives())
            return;

        labelOption =  $('<option disabled selected>Select alternative cards --</option>');

        var altSelect = $('<select id="mdw-import-select"></select>')
            .append(labelOption)
            .append(importData.getAltOptions())
            .change(onSelectAlternative);

        var resetButton = $('<input type="button" id="mdw-import-reset" value="Reset" disabled title="Reset import contents to original content." />')
            .click(onClickReset);

        $(container).append(altSelect).append(resetButton).css('display', 'block');
    }

    function setupImportUi(container) {
        var elements = $(
                '<input type="button" id="mdw-copy-export" value="Copy" />' +
                '<span id="mdw-copied-message" />' +
                '<br />' +
                '<textarea id="mdw-arena-export-contents" style="width:90%" readonly>' +
                importData.text() +
                '</textarea>'
        );
        $(container).append(elements);
        sizeTextareaToContents(document.getElementById('mdw-arena-export-contents'));
        setRarityContents();
        $('#mdw-copy-export').click(onClickCopy);
    }

    function initialize () {
        var arenaImportContainer = document.getElementById('mdw-arena-export-div');
        if (arenaImportContainer === null)
            return;

        importData = new ImportData();
        setImportData();
        setupImportUi(arenaImportContainer);
        setupAlternativesUi(document.getElementById('mdw-arena-export-alt-div'));
    }

    $(document).ready(initialize);

}(jQuery));
