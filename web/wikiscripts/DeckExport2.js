(function ($) {
    'use strict';

    function replaceExportCard(newCard) {
        var exportTextbox = document.getElementById('mdw-arena-export-contents');
        var cardLines = exportTextbox.value.split('\n');
        var name = newCard.substring(0, newCard.indexOf('(') - 1);    
        for (var k = 0; k < cardLines.length; k++) {
            if (cardLines[k].indexOf(name) !== -1)
                break; // for k
        }
        var spacepos = cardLines[k].indexOf(' ');
        var num = cardLines[k].substring(0, spacepos);
        var oldCard = cardLines[k].substring(spacepos + 1);
        cardLines[k] = num + " " + newCard;
        exportTextbox.value = cardLines.join('\n');
        return oldCard;
    }

    function onSelectAlernative() 
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
        var copyButton = $(
                '<input type="button" id="mdw-copy-export" value="Copy" />' +
                '<br />' +
                '<textarea id="mdw-arena-export-contents" cols="60" readonly>' +
                contents +
                '</textarea>'
        );
        $(container).append(copyButton);

        // vertically size textbox to contents
        var exportTextbox = document.getElementById('mdw-arena-export-contents');
        exportTextbox.style.overflow = 'hidden';
        exportTextbox.style.height = 'auto';
        exportTextbox.style.height = exportTextbox.scrollHeight + 'px'; 

        $('#mdw-copy-export').click(onClickCopy);
    }

    function setupAlternativesDropdown(container) {
        var alternativesSrc = document.getElementById('mdw-arena-export-src-altenative');
        if (alternativesSrc === null)
            return;

        var altSelect = $('<select id="mdw-area-export-select"></select>');
        var altLines = alternativesSrc.innerHTML.split('\n');
        altSelect.append('<option disabled selected>Select alternative card</option>');
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
        );
        $(container).append(altSelect);
        altSelect.change(onSelectAlernative);
    }

    $(document).ready(function () {
        var arenaExportSrc = document.getElementById('mdw-arena-export-src');
        if (arenaExportSrc === null)
            return;
        var arenaExportContainer = document.getElementById('mdw-arena-export-div');
        if (arenaExportContainer === null)
            return;

        setupTextBox(arenaExportContainer, arenaExportSrc.innerHTML);
        setupAlternativesDropdown(arenaExportContainer);
    });

})(jQuery);


