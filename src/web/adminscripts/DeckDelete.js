(function ($) {
    /*global mw */
    'use strict';
    
    if (mw.config.get('wgAction') !== 'delete' || mw.config.get('wgTitle').substring(0, 6) !== 'Decks/')
        return;

    function submitClick() {
        /* jshint -W040 */ // allow old school jquery use of this
        var btn = $(this);
        $('#wpReason').val(btn.attr('data-other'));
        $('#wpDeleteReasonList').val(btn.attr('data-reason'));
    }
    
    function deleteButton(text, reason, otherText) {
        var input = $('<input>', {
            type: 'submit',
            class: 'mdw-deckdelete-button',
            'data-reason': reason,
            'data-other': otherText,
            value: text,
            click: submitClick
        });

        return $('<tr><td></td></tr>').append($('<td class="mw-submit">').append(input));
    }
    
    function initialize() {
        $('#mw-deleteconfirm-table tbody')
            .append(deleteButton('Test Cleanup', 'Housekeeping', 'Cleanup after test'))
            .append(deleteButton('Not an Arena Deck', 'Housekeeping', 'Deck is not an Arena deck, contains cards not in the game.'))
            .append(deleteButton('Test Import', 'Housekeeping', 'Presumably this was a test and can be deleted.'))
            .append(deleteButton('Invalid deck', 'Housekeeping', 'Invalid deck'))
            .append(deleteButton('Bad deck contents (Vandalism)', 'Vandalism', 'Unacceptable deck contents'))
            .append(deleteButton('Unacceptable deck name (Vandalism)', 'Vandalism', 'Unacceptable deck name'));
        $('#wpWatch').prop('checked', false);
    }

    $(initialize);

}(jQuery));
