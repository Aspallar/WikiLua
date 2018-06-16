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

    if ($('#mdw-disabled-js').attr('decklistedit-1-0-0'))
        return;

    var working = $('<img>', {
        src: mw.config.get('stylepath') + '/common/images/ajax.gif'
    });

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

    function getDeckData(title) {
        $.get(title).then(function (data) {
            var deckJson = JSON.parse(extractJson('mdw-chartdata-pre', data));
            var sideboardJson = JSON.parse(extractJson('mdw-sideboard-data', data));
            var colors = [];
            extractDeckColors(colors, deckJson);
            extractDeckColors(colors, sideboardJson);
            // getAllDecks().done(function (data) {
            //     data = data;
            //     console.log('all done');
            //     getDecklistsDecks();
            // });
        }).fail(function () {
            alert('fail');
        });
    }

    function test() {
        // getDeckData('/wiki/Decks/Dimir Gift');
        getDecklistsDecks().done(function (decklistDecks) {
            getUnlistedDecks(decklistDecks).done(function (unlistedDecks) {
                var select = $('<select>');
                unlistedDecks.forEach(function (deck) {
                    select.append($('<option>').text(deck));
                });
                working.remove();
                $('#mdw-editor').prepend(select);
            });
        });
    }

    function initialize() {
        // $('#testbutton').click(test);
        $('#mdw-editor').append(working);
        getDecklistsDecks().done(function (decklistDecks) {
            getUnlistedDecks(decklistDecks).done(function (unlistedDecks) {
                var select = $('<select>');
                unlistedDecks.forEach(function (deck) {
                    select.append($('<option>').text(deck));
                });
                $('#mdw-editor').append(select);
                working.remove();
            });
        });
    }

    $(document).ready(initialize);

}(jQuery));
