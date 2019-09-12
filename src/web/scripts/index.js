(function () {
    'use strict';

    var links = $('a');
    var current = -1;

    function go(event, amount) {
        event.preventDefault();
        if (current >= 0)
            $(links[current]).removeClass('link-highlight');
        current += amount;
        if (current >= links.length)
            current -= links.length;
        $(links[current]).addClass('link-highlight');
    }

    function returnPressed(event) {
        event.preventDefault();
        window.open($(links[current]).attr('href'));
    }

    $(window).keydown(function(event) {
        switch (event.keyCode) {
            case 38: // up arrow key
                go(event, -1);
                break;
            case 40: // up arrow key
                go(event, 1);
                break;
            case 13:
                returnPressed(event);
                break;
        }
    });
}());