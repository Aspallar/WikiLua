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

    var importCards = [];
    var altImportCards = [];

    function sizeTextareaToContents(textarea) {
        textarea.style.overflow = 'hidden';
        textarea.style.height = 'auto';
        textarea.style.height = textarea.scrollHeight + 'px'; 
    }

    function onClickCopy() {
        var exportText = document.getElementById('mdw-arena-export-contents');
        exportText.select();
        document.execCommand('copy');
    }

    function baseDisplayName(card) {
        return card.name + ' (' + card.set + ') ' + card.cardNumber;
    }

    function importDisplayName(card) {
        return card.num + ' ' + baseDisplayName(card);
    }

    function allImportText() {
        var text = '';
        importCards.forEach(function(card) {
            text += importDisplayName(card) + '\n';
        });
        return text;
    }

    function findImportCardByName(name) {
        for (var k = 0, l = importCards.length; k < l; k++) {
            if (importCards[k].name === name)
                return k;
        }
        return -1;
    }

    function getRarityTotals(cards) {
        var totals = {};
        cards.forEach(function (card) {
            var rarity = card.rarity;
            if (rarity !== "Basic Land")
                totals[rarity] = (totals[rarity] || 0) + card.num;
        });
        return totals;
    }

    function onSelectAlternative() {
        /* jshint -W040 */ // allow old school jquery use of this
        var newCardIndex = this.selectedIndex - 1;
        var newCard = altImportCards[newCardIndex];
        var oldCardIndex = findImportCardByName(newCard.name);
        var oldCard = importCards[oldCardIndex];

        newCard.num = oldCard.num;
        altImportCards[newCardIndex] = oldCard;
        importCards[oldCardIndex] = newCard;
        this.options[this.selectedIndex].text = baseDisplayName(oldCard);
        $('#mdw-arena-export-contents').html(allImportText());
        this.selectedIndex = 0;
    }

    function setupAlternativesSelect(container) {
        if (container === null || altImportCards.length === 0)
            return;

        var altSelect = $('<select id="mdw-area-export-select"></select>')
            .append('<option disabled selected>Select alternative cards --</option>')
            .change(onSelectAlternative);

        altImportCards.forEach(function (card) {
            $('<option>').html(baseDisplayName(card)).appendTo(altSelect);
        });

        $(container).append(altSelect).css('display', 'block');
    }

    function setupExportText(container) {
        var elements = $(
                '<input type="button" id="mdw-copy-export" value="Copy" />' +
                '<br />' +
                '<textarea id="mdw-arena-export-contents" style="width:90%" readonly>' +
                allImportText() +
                '</textarea>'
        );
        $(container).append(elements);
        sizeTextareaToContents(document.getElementById('mdw-arena-export-contents'));
        $('#mdw-copy-export').click(onClickCopy);
    }

    function initializeImportData()
    {
        var dataString = $('#mdw-chartdata-pre').text();
        if (dataString !== null && dataString.length > 0) {
            importCards = JSON.parse(dataString);
        }
        console.dir(getRarityTotals(importCards));
        dataString = $('#mdw-alt-carddata').text();
        if (dataString !== null && dataString.length > 0) {
            altImportCards = JSON.parse(dataString);
            altImportCards.sort(function (a, b) {
                return a.name.localeCompare(b.name);
            });
        }
    }

    function initialize () {
        var arenaExportContainer = document.getElementById('mdw-arena-export-div');
        if (arenaExportContainer === null)
            return;

        initializeImportData();
        setupExportText(arenaExportContainer);
        setupAlternativesSelect(document.getElementById('mdw-arena-export-alt-div'));
    }

    $(document).ready(initialize);

}(jQuery));
