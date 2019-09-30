// append elapsed days to the date in QueryDeck text/
$(function() {
    'use strict';
    $('.mdw-daysago').each(function () {
        var that = $(this);
        var match = /[A-Za-z]+\s+\d+,\s+\d+/.exec(that.text());
        if (match) {
            var days = Math.floor((Date.now() - Date.parse(match[0])) / (1000 * 60 * 60 * 24));
            if (!isNaN(days))
                that.append(' <b>[' + days + ' days]</b>');
        }
    });
});