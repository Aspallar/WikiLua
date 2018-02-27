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
        var oldCard = cardLines[k];
        var spacepos = oldCard.indexOf(' ');
        var ammount = oldCard.substring(0, spacepos);
        var oldCardWithoutAmount = oldCard.substring(spacepos + 1);
        cardLines[k] = ammount + ' ' + newCard;
        exportTextbox.value = cardLines.join('\n');
        return oldCardWithoutAmount;
    }

    function onSelectAlternative() 
    {
        /* jshint -W040 */ // allow old school jquery use of this
        var option = this.options[this.selectedIndex];
        var oldCard = replaceExportCard(option.text);
        option.text = oldCard;
        this.selectedIndex = 0;
    }

    function onClickCopy() {
        var copyText = document.getElementById('mdw-arena-export-contents');
        copyText.select();
        document.execCommand('copy');
    }

    function setupTextBox(container, contents) {
        var elements = $(
                '<input type="button" id="mdw-copy-export" value="Copy" />' +
                '<br />' +
                '<textarea id="mdw-arena-export-contents" cols="60" readonly>' +
                contents +
                '</textarea>'
        );
        $(container).append(elements);
        sizeTextareaToContents(document.getElementById('mdw-arena-export-contents'));
        $('#mdw-copy-export').click(onClickCopy);
    }

    function setupAlternativesDropdown(container) {
        var alternativesSrc = document.getElementById('mdw-arena-export-src-altenative');
        if (alternativesSrc === null)
            return;

        var altSelect = $('<select id="mdw-area-export-select"></select>');
        var altLines = alternativesSrc.innerHTML.split('\n');
        altSelect.append('<option disabled selected>Select alternative cards --</option>');
        altLines.sort();
        altLines.forEach(function (line) {
            if (line.length !== 0)
                $('<option>').html(line).appendTo(altSelect);
        });
        $(container).append(
            '<p>' +
            'This export contains reprints, you may select alternatives for these using the dropdown below.' +
            'The appropriate card above will be replaced with the selected alternative.' +
            '</p>'
        ).append(altSelect);
        altSelect.change(onSelectAlternative);
    }   

    function initialize () {
        var arenaExportSrc = document.getElementById('mdw-arena-export-src');
        if (arenaExportSrc === null)
            return;
        var arenaExportContainer = document.getElementById('mdw-arena-export-div');
        if (arenaExportContainer === null)
            return;

        setupTextBox(arenaExportContainer, arenaExportSrc.innerHTML);
        setupAlternativesDropdown(arenaExportContainer);
    }

    $(document).ready(initialize);

})(jQuery);
