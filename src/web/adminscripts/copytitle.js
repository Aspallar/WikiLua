// copy article title to clipboard when title clicked.
$(function (){
    'use strict';
    $('h1.page-header__title').css('cursor', 'pointer').click(function (event) {
        var that = $(this);
        var color = that.css('color');
        that.css('color', 'red');
        var copyText = that.text();
        if (!event.ctrlKey)
            copyText = 'Duplicate of [[' + copyText + ']]'
        navigator.clipboard.writeText(copyText).then(function () {
            setTimeout(function () {
                that.css('color', color);
            }, 200);
        });
    });
});
