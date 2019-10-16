console.log('QueryDeck B');
$(function () {
    'use strict';
    if ($('#wpTextbox1').length > 0) {
        console.log('wpTextbox1 found');
        $('#mw-editbutton-math').click(function (event) {
            event.stopPropagation();
            event.preventDefault();
            console.log('button clicked');
        });
    }
    else
        console.log('wpTextbox1 missing');
});
