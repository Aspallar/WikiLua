// ==========================================================================
// Start: Deck Export
// Adds the export text box to deck articles with copy to clipboard button.
// Version 1.0.0
// Author: Aspallar
//
// ** Please dont edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
//
$(document).ready(function () {
    'use strict';
    var arenaExportSrc = document.getElementById('mdw-arena-export-src');
    if (arenaExportSrc === null)
        return;
    var arenaExportDest = document.getElementById('mdw-arena-export-div');
    if (arenaExportDest === null)
        return;

    $(arenaExportDest).append('<input type="button" id="mdw-copy-export" value="Copy" />'
            + '<br />'
            + '<textarea id="mdw-arena-export-contents" cols="60" readonly>'
            + arenaExportSrc.innerHTML
            + '</textarea>'
    );

    // vertically size textbox to contents
    var exportTextbox = document.getElementById('mdw-arena-export-contents');
    exportTextbox.style.overflow = 'hidden';
    exportTextbox.style.height = 'auto';
    exportTextbox.style.height = exportTextbox.scrollHeight + 'px'; 

    $('#mdw-copy-export').click(function () {
        var copyText = document.getElementById('mdw-arena-export-contents');
        copyText.select();
        document.execCommand('copy');
    });
});
// End: Deck Export
// ==========================================================================
