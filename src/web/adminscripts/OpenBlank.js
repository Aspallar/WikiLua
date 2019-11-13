(function ($) {
    'use strict';
    function openBlank(event) {
        event.preventDefault();
        $('a').attr('target', '_blank');
    }
    function addMyToolsOption() {
        var link = $('<li>')
            .append($('<a>').attr({href: '#'}).text('Open Blank'))
            .click(openBlank);
         $('#my-tools-menu').prepend(link);
    }
    $(addMyToolsOption);
}(jQuery));
