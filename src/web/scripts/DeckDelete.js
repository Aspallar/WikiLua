(function ($) {
    /*global mw */
    'use strict';

    if (mw.config.get('wgAction') !== 'delete' || mw.config.get('wgTitle').substring(0, 6) !== 'Decks/')
        return;

    function submitClick() {
        /* jshint -W040 */ // allow old school jquery use of this
        var that = $(this);
        $('#wpReason').val(that.attr('data-other'));
        $('#wpDeleteReasonList').val(that.attr('data-reason'));
    }

    function deleteButton(text, reason, otherText) {
        var input = $('<input type="submit">')
            .val(text)
            .attr('data-reason', reason)
            .attr('data-other', otherText)
            .click(submitClick);
        return $('<tr><td></td></tr>').append($('<td class="mw-submit">').append(input));
    }

    function initialize() {
        $('#mw-deleteconfirm-table tbody')
            .append(deleteButton('Random deck name', 'Housekeeping', 'Please don\'t give decks a name consisting of nothing but random characters'))
            .append(deleteButton('Not an arena deck', 'Housekeeping', 'Not an arena deck'))
            .append(deleteButton('Test deck', 'Housekeeping', 'Someone\'s test import'))
            .append(deleteButton('Too few cards', 'Housekeeping', 'Invalid deck, not enough cards'))
            .append(deleteButton('Too many cards', 'Housekeeping', 'Invalid deck, too many cards'))
            .append(deleteButton('Outdated Meta', 'Housekeeping', 'Outdated meta'))
            .append(deleteButton('Invalid deck', 'Housekeeping', 'Invalid deck'))
            .append(deleteButton('Poor deck name', 'Housekeeping', 'Poor deck name'))
            .append(deleteButton('Bad deck contents (Valdalism)', 'Vandalism', 'Unacceptable deck contents'))
            .append(deleteButton('Unacceptable deck name (Valdalism)', 'Vandalism', 'Unacceptable deck name'));
        $('#wpWatch').prop('checked', false);
    }

    $(initialize);

}(jQuery));
