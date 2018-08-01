// ==========================================================================
// Implements a link on card pages that displays links to the decks which
// contain that card.
//
// Version 1.0.0
// Author: Aspallar
//
// ** Please do not edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
(function ($) {
    'use strict';
    /*global mw */

    if (document.getElementById('mdw-deck-links') === null || $('#mdw-disabled-js').attr('data-linkeddecks-1-0-0'))
        return;

    function wikiApiCall(data, method) {
        data.format = 'json';
        return $.ajax({
            data: data,
            dataType: 'json',
            url: mw.config.get('wgScriptPath') + '/api.php',
            type: method
        });
    }

    function fetchDecks() {
        var deferred = $.Deferred();
        var decks = [];

        function getDecks(blcontinue) {
            wikiApiCall({
                action: 'query',
                list: 'backlinks',
                bltitle: mw.config.get('wgTitle'),
                bllimit: 100,
                blfilterredir: 'nonredirects',
                blcontinue: blcontinue
            }, 'GET').done(function (data) {
                if (data.query.backlinks) {
                    data.query.backlinks.forEach(function (deck) {
                        if (deck.title.substring(0, 6) === 'Decks/')
                            decks.push(deck.title);
                    });
                }
                if (data['query-continue']) {
                    getDecks(data['query-continue'].backlinks.blcontinue);
                } else {
                    deferred.resolve(decks);
                }
            });
        }

        getDecks(undefined);
        return deferred.promise();
    }

    function showDecks(event) {
        event.preventDefault();
        var container = $('#mdw-deck-links');
        container.empty();
        fetchDecks().done(function (decks) {
            if (decks.length === 0)
                container.html('There are no decks that contain this card.');
            else {
                var decklinks = $(document.createDocumentFragment());
                decks.sort();
                decks.forEach(function (deck) {
                    decklinks.append(
                        $('<a>')
                            .attr('href', mw.util.getUrl(deck))
                            .attr('target', '_blank')
                            .html(deck.substring(6))
                    );
                    decklinks.append('<br>');
                });
                container.append(decklinks);
            }
        });
    }

    $(document).ready(function () {
        $('#mdw-deck-links').append(
            $('<a>').attr('href', '#').html('Show decks that contain this card.').click(showDecks)
        );
    });

}(jQuery));