// ==========================================================================
// Start: Deck Export
// Adds the export text box to deck articles with copy to clipboard button
// and a select to allow export cards to be replaced with reprint alternatives.
// Version 3.0.0
// Author: Aspallar
//
// ** Please dont edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
//
(function ($) {
    'use strict';

    var importData;

    function ImportData() {
        var importCards = [];
        var altImportCards = [];

        function baseDisplayName(card) {
            return card.name + ' (' + card.set + ') ' + card.cardNumber;
        }

        function importDisplayName(card) {
            return card.num + ' ' + baseDisplayName(card);
        }

        function rarityValue(rarity) {
            return { 'Common': 0, 'Uncommon': 1, 'Rare': 2, 'Mythic Rare': 3, 'Legendary': 5}[rarity];
        }

        function findImportCardByName(name) {
            for (var k = 0, l = importCards.length; k < l; k++) {
                if (importCards[k].name === name)
                    return k;
            }
            return -1;
        }

        return {
            parseCardData: function (dataString) {
                 if (dataString !== null && dataString.length > 0)
                    importCards = JSON.parse(dataString);
            },
            parseAltCardData: function (dataString) {
                if (dataString !== null && dataString.length > 0) {
                    altImportCards = JSON.parse(dataString);
                    altImportCards.sort(function (a, b) {
                        return a.name.localeCompare(b.name);
                    });
                }
            },
            swapCards: function (altCardIndex) {
                var newCard = altImportCards[altCardIndex];
                var oldCardIndex = findImportCardByName(newCard.name);
                var oldCard = importCards[oldCardIndex];

                newCard.num = oldCard.num;
                altImportCards[altCardIndex] = oldCard;
                importCards[oldCardIndex] = newCard;
                return baseDisplayName(oldCard);
            },
            adjustToCheapest: function () {
                for (var k = 0, l = altImportCards.length; k < l; k++) {
                    var cardIndex = findImportCardByName(altImportCards[k].name);
                    if (rarityValue(altImportCards[k].rarity) < rarityValue(importCards[cardIndex].rarity))
                        this.swapCards(k);
                }
            },
            getRarityTotals: function getRarityTotals() {
                var totals = {};
                importCards.forEach(function (card) {
                    var rarity = card.rarity;
                    if (rarity !== 'Basic Land')
                        totals[rarity] = (totals[rarity] || 0) + card.num;
                });
                return totals;
            },
            text: function () {
                var text = '';
                importCards.forEach(function(card) {
                    text += importDisplayName(card) + '\n';
                });
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
            }
        };
    } // End ImportData

    function sizeTextareaToContents(textarea) {
        textarea.style.overflow = 'hidden';
        textarea.style.height = 'auto';
        textarea.style.height = textarea.scrollHeight + 'px'; 
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

    function onSelectAlternative() {
        /* jshint -W040 */ // allow old school jquery use of this
        var text = importData.swapCards(this.selectedIndex - 1);
        this.options[this.selectedIndex].text = text;
        $('#mdw-arena-export-contents').html(importData.text());
        this.selectedIndex = 0;
        console.dir(importData.getRarityTotals());
    }

    function setupAlternativesUi(container) {
        if (container === null || !importData.hasAlternatives())
            return;

        var altSelect = $('<select id="mdw-area-export-select"></select>')
            .append('<option disabled selected>Select alternative cards --</option>')
            .append(importData.getAltOptions())
            .change(onSelectAlternative);

        $(container).append(altSelect).css('display', 'block');
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
        $('#mdw-copy-export').click(onClickCopy);
    }

    function initializeImportData()
    {
        importData = new ImportData();
        importData.parseCardData($('#mdw-chartdata-pre').text());
        importData.parseAltCardData($('#mdw-alt-carddata').text());
        importData.adjustToCheapest();
        console.dir(importData.getRarityTotals());
    }

    function initialize () {
        var arenaImportContainer = document.getElementById('mdw-arena-export-div');
        if (arenaImportContainer === null)
            return;

        initializeImportData();
        setupImportUi(arenaImportContainer);
        setupAlternativesUi(document.getElementById('mdw-arena-export-alt-div'));
    }

    $(document).ready(initialize);

}(jQuery));
