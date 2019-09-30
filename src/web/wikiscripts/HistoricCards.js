// ==========================================================================
// Adds a "Hightlight historic cards" link to historic decks which hightlights
// the cards that ca only be played in historic formats.
//
// Version 1.0.0
// Author: Aspallar
//
// ** Please do not edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
(function ($) {
    'use strict';

    if (document.getElementById('mdw-show-historic') === null || $('#mdw-disabled-js').attr('data-historiccards-1-0-0'))
        return;

    var highlighted = false;
    var highlightText = 'Highlight historic cards';

    function toggleHighlight(event) {
        event.preventDefault();
        highlighted = !highlighted;
        if (highlighted) {
            $('.card-historiccard').addClass('card-historic');
            $('#mdw-historic-highlight').text('Remove historic card highlighting');
        } else {
            $('.card-historiccard').removeClass('card-historic');
            $('#mdw-historic-highlight').text(highlightText);
        }
    }

    function initialize() {
        $('#mdw-show-historic').html(
            $('<br>').after($('<a>', { id: 'mdw-historic-highlight', href: '#', text: highlightText}).click(toggleHighlight))
        );
    }

    $(initialize);

}(jQuery));
