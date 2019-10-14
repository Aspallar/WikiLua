// ==========================================================================
// Displays a detailed card list of all cards in a deck.
//
// Version 1.0.0
// Author: Aspallar
//
// ** Please do not edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
// This code was inspired by the rating system used on http://de.sonic.wikia.com
//
//<nowiki>
(function ($) {
    /*global mw*/
    /*jshint -W003*/
    'use strict';

    if(document.getElementById('mdw-view-card-list') === null || $('#mdw-disabled-js').attr('data-deckcardlist-1-0-0'))
        return;

    var parsed = false;

    function adjustName(name) {
        var pos = name.indexOf('//');
        return pos === -1 ? name : name.substring(0, pos - 1);
    }

    function setButtonText() {
        var link = $('#mdw-view-card-list > button');
        if ($('#mdw-deck-card-list').is(':visible'))
            link.text('Hide detailed card list');
        else
            link.text('View detailed card list');
    }

    function showButton() {
        $('#mdw-view-card-list').html($('<button>').click(clickViewList));
        setButtonText();
    }

    function showWorking() {
        $('#mdw-view-card-list').html($('<img>', {
            src: mw.config.get('stylepath') + '/common/images/ajax.gif',
        }));
    }

    function cardData(selector) {
        var cards;
        try { cards = JSON.parse($(selector).text()); } catch(e) { }
        return cards || [];
    }

    function cardTabel(cards) {
        var text = '';
        if (cards.length > 0) {
            text = '{| class="CardRow article-table"\n';
            cards.forEach(function (card) {
                text += '{{CardRow|' + adjustName(card.name) + '|' + card.num + '}}\n';
            });
            text += '|}\n';
        }
        return text;
    }

    function cardListText() {
        var mainText = cardTabel(cardData('#mdw-chartdata-pre'));
        var sideText = cardTabel(cardData('#mdw-sideboard-data'));
        var text = '';
        if (mainText.length !== 0)
            text += '===Main===\n' + mainText;
        if (sideText.length !== 0) {
            if (mainText.length !== 0)
                text += '<hr/>\n';
            text += '===Sideboard===\n' + sideText;
        }
        return text + '__NOEDITSECTION__\n';
    }

    function parseError() {
        $('#mdw-deck-card-list')
            .html('<p class="mdw-error">Unable to obtain detailed card list.</p>')
            .show();
        showButton();
    }

    function parse(text) {
        showWorking();
        mw.loader.using('mediawiki.api', function () {
            new mw.Api().post({
                action: 'parse',
                disablepp: '1',
                prop: 'text',
                text: text
            }).done(function (data) {
                parsed = true;
                if (data.parse && data.parse.text) {
                    $('#mdw-deck-card-list').html(data.parse.text['*']).show(400);
                    showButton();
                } else {
                    parseError();
                }
            }).fail(function () {
                parseError();
            });
        });
    }

    function clickViewList() {
        if (parsed) {
            $('#mdw-deck-card-list').toggle(400, function() {
                setButtonText();
            });
        } else {
            parse(cardListText());
        }
    }

    $(showButton);

}(jQuery));

// #8ccbe6 cae1e2