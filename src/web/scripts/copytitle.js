// copy article title to clipboard when title clicked.
$(function (){
    'use strict';
    $('h1.page-header__title').css('cursor', 'pointer').click(function () {
        var that = $(this);
        var color = that.css('color');
        that.css('color','red');
        navigator.clipboard.writeText(that.text()).then(function () {
            setTimeout(function () {
                that.css('color', color);
            }, 200);
        });
    });
});
