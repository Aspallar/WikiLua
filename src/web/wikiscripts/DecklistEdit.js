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

    // TODO: deal with redirected decks

    // return;

    console.log('DecklistEdit Build 3');

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

    function setAuthor() {
        var loggedUser = mw.config.get('wgUserName');
        if (loggedUser) {
            $('#mdw-dle-author').val('[[User:' + loggedUser + '|' + loggedUser + ']]');
        } else {
            $('#mdw-dle-author').val('Annon');
        }
    }

    function tickColors(colors) {
        $('#mdw-dle-colors>input').prop('checked', false);
        colors.forEach(function (color) {
            var id = '#mdw-dle-' + color.toLowerCase();
            $(id).prop('checked', true);
        });
    }

    function selectDeck() {
        /* jshint -W040 */ // allow old school jquery use of this
        $('#mdw-mainform').hide();
        var deck = this.options[this.selectedIndex].text;
        console.log(deck);
        showWorking();
        getDeckColors(deck).done(function (colors) {
            hideWorking();
            $('#mdw-dle-name').val(deck);
            setAuthor();
            tickColors(colors);
            $('#mdw-mainform').show(500);
        });
    }

    function createMainForm() {
        /*jshint -W043 */ // allow multiline string escaping
        $('#mdw-dle-name-span')
            .html('<input type="input" id="mdw-dle-name" size="40" placeholder="Deck name"/>');
        $('#mdw-dle-type-span')
            .html('<input type="input" id="mdw-dle-type" size="10" placeholder="Type"/>');
        $('#mdw-dle-author-span')
            .html('<input type="input" id="mdw-dle-author" size="20" placeholder="Author"/>');
        $('#mdw-dle-desc-span')
            .html('<input type="input" id="mdw-dle-desc" size="50" placeholder="Description"/>');
        $('#mdw-dle-colors')
            .html('<input type="checkbox" id="mdw-dle-white" value="{{W}}">\
                    <label for="mdw-dle-white">White</label>&nbsp;&nbsp;\
                    <input type="checkbox" id="mdw-dle-blue" value="{{U}}">\
                    <label for="mdw-dle-blue">Blue</label>&nbsp;&nbsp;\
                    <input type="checkbox" id="mdw-dle-black" value="{{B}}">\
                    <label for="mdw-dle-black">Black</label>&nbsp;&nbsp;\
                    <input type="checkbox" id="mdw-dle-red" value="{{R}}">\
                    <label for="mdw-dle-red">Red</label>&nbsp;&nbsp;\
                    <input type="checkbox" id="mdw-dle-green" value="{{G}}">\
                    <label for="mdw-dle-green">Green</label>&nbsp;&nbsp;\
                    <input type="checkbox" id="mdw-dle-colorless" value="{{C}}">\
                    <label for="mdw-dle-colorless">Colorless</label>&nbsp;&nbsp;');
    }

    function initialize() {
        $('#mdw-working').html($('<img>', {
            src: mw.config.get('stylepath') + '/common/images/ajax.gif'
        }));
        createMainForm();
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
