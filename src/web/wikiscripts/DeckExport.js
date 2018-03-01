// ==========================================================================
// Start: Deck Export
// Adds the export text box to deck articles with copy to clipboard button
// and a select to allow export cards to be replaced with reprint alternatives.
// Version 2.0.0
// Author: Aspallar
//
// ** Please dont edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
//
(function ($) {
    'use strict';

    function sizeTextareaToContents(textarea) {
        textarea.style.overflow = 'hidden';
        textarea.style.height = 'auto';
        textarea.style.height = textarea.scrollHeight + 'px'; 
    }

    function replaceExportCard(newCard) {
        var exportTextbox = document.getElementById('mdw-arena-export-contents');
        var cardLines = exportTextbox.value.split('\n');
        var name = newCard.substring(0, newCard.indexOf('(') - 1);    
        for (var k = 0; k < cardLines.length; k++) {
            if (cardLines[k].indexOf(name) !== -1)
                break; // for k
        }
        var replacedCard = cardLines[k];
        var spacepos = replacedCard.indexOf(' ');
        var ammount = replacedCard.substring(0, spacepos);
        var replacedWithoutAmount = replacedCard.substring(spacepos + 1);
        cardLines[k] = ammount + ' ' + newCard;
        exportTextbox.value = cardLines.join('\n');
        return replacedWithoutAmount;
    }

    function onSelectAlternative() {
        /* jshint -W040 */ // allow old school jquery use of this
        var option = this.options[this.selectedIndex];
        var replacedCard = replaceExportCard(option.text);
        option.text = replacedCard;
        this.selectedIndex = 0;
    }

    function onClickCopy() {
        var exportText = document.getElementById('mdw-arena-export-contents');
        exportText.select();
        document.execCommand('copy');
    }

    function setupExportText(container, contents) {
        var elements = $(
                '<input type="button" id="mdw-copy-export" value="Copy" />' +
                '<br />' +
                '<textarea id="mdw-arena-export-contents" style="width:90%" readonly>' +
                contents +
                '</textarea>'
        );
        $(container).append(elements);
        sizeTextareaToContents(document.getElementById('mdw-arena-export-contents'));
        $('#mdw-copy-export').click(onClickCopy);
    }

    function setupAlternativesSelect(container) {
        if (container === null)
            return;

        var alternativesSrc = document.getElementById('mdw-arena-export-src-altenative');
        if (alternativesSrc === null)
            return;

        var altSelect = $('<select id="mdw-area-export-select"></select>')
            .append('<option disabled selected>Select alternative cards --</option>')
            .change(onSelectAlternative);

        var altCardExportLines = alternativesSrc.innerHTML.split('\n');
        altCardExportLines.sort();
        altCardExportLines.forEach(function (exportCardLine) {
            if (exportCardLine.length !== 0)
                $('<option>').html(exportCardLine).appendTo(altSelect);
        });

        $(container).append(altSelect).css('display', 'block');
    }   

    function initialize () {
        var arenaExportSrc = document.getElementById('mdw-arena-export-src');
        if (arenaExportSrc === null)
            return;
        var arenaExportContainer = document.getElementById('mdw-arena-export-div');
        if (arenaExportContainer === null)
            return;

        setupExportText(arenaExportContainer, arenaExportSrc.innerHTML);
        setupAlternativesSelect(document.getElementById('mdw-arena-export-alt-div'));
    }

    $(document).ready(initialize);

}(jQuery));
