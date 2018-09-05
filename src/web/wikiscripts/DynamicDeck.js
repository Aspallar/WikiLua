// Testing whether or not we can place a deck on a page dynamically
(function ($) {
    /*global mw, tooltips, magicArena */
    'use strict';

    console.log('Dynamic deck BbB');

    function wikiApiCall(data, method) {
        data.format = 'json';
        return $.ajax({
            data: data,
            dataType: 'json',
            url: mw.config.get('wgScriptPath') + '/api.php',
            type: method
        });
    }

    function parseDeckPage(deckdef) {
        var deferred = $.Deferred();
        wikiApiCall({
            action: 'parse',
            disablepp: 1,
            prop: 'text',
            text: deckdef
        }, 'POST').done(function (response) {
            var text = response.parse.text['*'];
            deferred.resolve(text);
        }).fail(function () {
            console.log('Network error while loading deck.');
        });
        return deferred.promise();
    }

    function test() {
        var deckdef = '{{Deck|Name=Test\n|Deck=\n' + $('#mdw-decktext').val() + '}}';
        console.log(deckdef);
        parseDeckPage(deckdef).done(function (deckHtml) {
            var deckTarget = document.getElementById('mdw-deck-target');
            deckTarget.innerHTML = deckHtml;
            tooltips.applyTooltips(deckTarget);
            magicArena.charts.refresh();
        });
    }

    function initialize() {
        $('#mdw-deckdef').html('<textarea cols="40" rows="7" id="mdw-decktext">4 Adorned Pouncer\n4 Ajani\'s Pridemate\n4 Opt\n</textarea>');
        $('#mdw-deck-button').html($('<input type="button" value="Parse Deck" disabled>').click(function () {
            test();
        }));
        mw.hook('magicarena.chartsready').add(function () {
            console.log('magicarena.chartsready fired');
            $('#mdw-deck-button input').prop('disabled', false);
        });
    }

    $(document).ready(initialize);

}(jQuery));

