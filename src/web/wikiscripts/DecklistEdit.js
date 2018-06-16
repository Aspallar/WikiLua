// ==========================================================================
// DecklistEdit
//
// Version 1.0.0
// Author: Aspallar
//
// ** Please do not edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
(function ($) {
    /*global mw */
    'use strict';

    console.log('DecklistEdit Build 1');

    if (document.getElementById('mdw-editor') === null || $('#mdw-disabled-js').attr('decklistedit-1-0-0'))
        return;

    function showWorking() {
        $('#mdw-working').show();
    }

    function hideWorking() {
        $('#mdw-working').hide();
    }

    function extractJson(id, contents) {
        var start = '<pre id="$1"'.replace('$1', id);
        var startPos = contents.indexOf(start);
        startPos = contents.indexOf('>', startPos + 1) + 1;
        var endPos = contents.indexOf('</pre>', startPos);
        return contents.substring(startPos, endPos);
    }

    function wikiApiCall(data, method) {
        data.format = 'json';
        return $.ajax({
            data: data,
            dataType: 'json',
            url: mw.config.get('wgScriptPath') + '/api.php',
            type: method,
            timeout: 10000 
        });
    }

    function getUnlistedDecks(decklistDecks) {

        var deferred = $.Deferred();
        var decks = [];

        function getDecks(apfrom) {
            wikiApiCall({
                action: 'query',
                list: 'allpages',
                apprefix: 'Decks/',
                aplimit: 100,
                apfrom: apfrom
            }, 'GET').done(function(data) {
                data.query.allpages.forEach(function (deck) {
                    var title = deck.title.substring(6);
                    if (!decklistDecks.includes(title))
                        decks.push(title);
                });
                if (data['query-continue']) {
                    getDecks(data['query-continue'].allpages.apfrom);
                } else {
                    deferred.resolve(decks);
                }
            });
        }

        getDecks(null);
        return deferred.promise();
    }   

    function getContents(data) {
        var pages = data.query.pages;
        for (var property in pages) {
            if (pages.hasOwnProperty(property))
                return pages[property].revisions[0]['*'];
        }
        return null;
    }

    function getDeckTitlesFromDecklists(content) {
        var decks = [];
        var matches = content.match(/\|link=.*/g);
        matches.forEach(function(match) {
            decks.push(match.substring(6).replace(/_/g, ' '));
        });
        return decks;
    }

    function getDecklistsDecks() {
        var deferred = $.Deferred();

        wikiApiCall({
            action: 'query',
            prop: 'info|revisions',
            intoken: 'edit',
            titles: 'Decklists',
            rvprop: 'content|timestamp',
            rvlimit: '1'
        }, 'GET').done(function (data) {
            var content = getContents(data);
            var decks = getDeckTitlesFromDecklists(content);
            deferred.resolve(decks);
        });

        return deferred.promise();
    }

    function extractDeckColors(colors, data) {
        data.forEach(function (card) {
            if (card.colors) {
                card.colors.forEach(function (color) {
                    if (!colors.some(function (c) { return c === color; }))
                        colors.push(color);
                });
            }
        });
    }

    function getDeckColors(title) {
        var deferred = $.Deferred();

        $.get('/wiki/Decks/' + title).done(function (data) {
            var deckJson = JSON.parse(extractJson('mdw-chartdata-pre', data));
            var sideboardJson = JSON.parse(extractJson('mdw-sideboard-data', data));
            var colors = [];
            extractDeckColors(colors, deckJson);
            extractDeckColors(colors, sideboardJson);
            deferred.resolve(colors);
        });

        return deferred.promise();
    }

    function selectDeck() {
        /* jshint -W040 */ // allow old school jquery use of this
        $('#mdw-mainform').hide();
        var deck = this.options[this.selectedIndex].text;
        console.log(deck);
        showWorking();
        getDeckColors(deck).done(function (colors) {
            var text = '';
            hideWorking();
            colors.forEach(function (color) {
                text += color + ' ';
            });
            $('#mdw-colors').text(text);
            $('#mdw-mainform').show(500);
        });
    }

    function initialize() {
        $('#mdw-working').html($('<img>', {
            src: mw.config.get('stylepath') + '/common/images/ajax.gif'
        }));
        showWorking();
        getDecklistsDecks().done(function (decklistDecks) {
            getUnlistedDecks(decklistDecks).done(function (unlistedDecks) {
                var select = $('<select>')
                    .append($('<option disabled selected>Select deck to add --</option>'))
                    .change(selectDeck);
                unlistedDecks.forEach(function (deck) {
                    select.append($('<option>').text(deck));
                });
                $('#mdw-deck-select').html(select);
                $('#mdw-deck-select-div').show(500);
                hideWorking();
            });
        });
    }

    $(document).ready(initialize);

}(jQuery));
