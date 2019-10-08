(function ($) {
    /*global mw*/
    'use strict';

    if (mw.config.get('wgPageName') !== 'Special:QueryDecks') {
        $(function () {
            $('#my-tools-menu').prepend(
                $('<li>')
                    .append($('<a>').attr({href: mw.util.getUrl('Special:QueryDecks')}).text('Queried Decks'))
            );
        });
        return;
    }

    var now = Date.now();

    function calcDays(deckQuery) {
        deckQuery.seconds = -1;
        deckQuery.days = -1;
        var match = /[A-Za-z]+\s+\d+,\s+\d+/.exec(deckQuery.dateText);
        if (match) {
            var seconds = now - Date.parse(match[0]);
            var days =  Math.floor(seconds / (1000 * 60 * 60 * 24));
            if (!isNaN(days)) {
                deckQuery.seconds = seconds;
                deckQuery.days = days;
            }
        }
        return deckQuery;
    }

    function fetchQueryDeckInfo() {
        var deferred = $.Deferred();

        var query = mw.config.get('wgScriptPath') + '/api.php?action=query&format=json&generator=categorymembers&gcmtitle=Category:Queried_Deck&gcmlimit=50&prop=revisions&rvprop=content';
        $.getJSON(query).done(function (data) {
            var result = [];
            if (data.query && data.query.pages) {
                Object.keys(data.query.pages).forEach(function (key) {
                    var re = /^\{\{QueryDeck\|(.+?)\|(.+?)[\|\{}]/gm; 
                    var page = data.query.pages[key];
                    var contents = page.revisions[0]['*'];
                    var queries = [];
                    var match;
                    while ((match = re.exec(contents)) !== null) {
                        queries.push(calcDays({text: match[1], dateText: match[2]}));
                    }
                    queries.sort(function (a, b) {
                        return b.seconds - a.seconds;    
                    });
                    result.push({ title: page.title, queries: queries });
                });
            }
            deferred.resolve(result);
        });

        return deferred.promise();
    }

    function typeEntry(text) {
        var max = 50;
        return (text.length <= max) ? text.substring(0, max) : text.substring(0, max) + '...';
    }

    function queryTypes(queries) {
        if (queries.length === 0)
            return '';
        var html = typeEntry(queries[0].text);
        for (var k = 1; k < queries.length; k++)
            html += '<br/>' + typeEntry(queries[k].text);
        return html;
    }

    function link(title) {
        return $('<a>', {target: '_blank', href: mw.util.getUrl(title), text: title});
    }

    function days(queries) {
        return (queries.length === 0 || queries[0].days === -1) ? 'Unknown' : queries[0].days;
    }

    function displayDecks(results) {
        console.dir(results);
        var table = $('<table class="article-table"><th>Deck</th><th>Days</th><th>Reason</th></table>');
        results.forEach(function (result) {
            var row = $('<tr>');
            row.append($('<td>').html(link(result.title)));
            row.append($('<td>').html(days(result.queries)));
            row.append($('<td>').html(queryTypes(result.queries)));
            table.append(row);
        });
        $('#mw-content-text').html(table);
    }

    $(function () {
        $('.page-header__title').text('Deck Queries');
        $('title').text('Deck Queries');
        $('#mw-content-text').html('<p>Fetching queries decks...</p>');
        fetchQueryDeckInfo().done(function (result) {
            result.sort(function (a, b) {
                var aval = a.queries.length > 0 ? a.queries[0].seconds : 0;
                var bval = b.queries.length > 0 ? b.queries[0].seconds : 0;
                return bval - aval;
            });
            displayDecks(result);
        });
    });

}(jQuery));

