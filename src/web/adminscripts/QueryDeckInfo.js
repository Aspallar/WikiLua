(function ($) {
    /*global mw*/
    'use strict';

    var pageName = mw.config.get('wgPageName');

    if (mw.config.get('wgAction') === 'delete' && pageName.substring(0,6) === 'Decks/') {
        $(function () {
            var reason = mw.util.getParamValue('reason');
            var days = mw.util.getParamValue('days');

            if (days === null && reason === null)
                return;

            var text;
            switch (reason) {
                case 'rnd': text = 'Random deck name.'; break;
                case 'poor': text = 'Poor deck name.'; break;
                case 'inv': text = 'Invalid cards in deck.'; break;
                case 'meta': text = 'Outdated meta.'; break;
                case 'gt60': text = 'More than 60 cards in deck.'; break;
                case 'lt60': text = 'Less than 60 cards in deck.'; break;
                case 'sbd': text = 'Short sideboard.'; break;
                case 'garbage': text = 'Unworkable deck'; break;
                case 'nocmd': text = 'No commander specified'; break;
                default: text = ''; break;
            }

            if (days !== null) {
                if (text.length > 0) text += ' ';
                text += 'No response from OP in ' + days + ' days';
            }

            $('#wpWatch').prop('checked', false);
            $('#wpReason').val(text);
            $('#wpDeleteReasonList').val('Housekeeping');            
        });
    }


    if (pageName !== 'Special:QueryDecks') {
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

        var query = mw.config.get('wgScriptPath') + '/api.php?action=query&format=json&generator=categorymembers&gcmtitle=Category:Queried_Deck&gcmlimit=500&prop=revisions&rvprop=content';
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
        var max = 60;
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

    function deckLink(title) {
        return $('<a>', {target: '_blank', href: mw.util.getUrl(title), text: title});
    }

    function deleteLink(entry) {
        var params = { action: 'delete' };
        if (entry.queries.length > 0) {
            var q = entry.queries[0];
            if (q.days >= 0)
                params.days = q.days;
            params.reason = q.text.substring(0, 10);
        }
        return $('<a>', {target: '_blank', href: mw.util.getUrl(entry.title, params), text: 'Delete'});
    }

    function days(queries) {
        return (queries.length === 0) ? -1 : queries[0].days;
    }

    function displayDecks(results) {
        var table = $('<table class="article-table"><th>Deck</th><th>Days</th><th>Reason</th><th>&nbsp;</th></table>');
        results.forEach(function (result) {
            var row = $('<tr>')
                .append($('<td>').html(deckLink(result.title)))
                .append($('<td>').html(days(result.queries)))
                .append($('<td>').html(queryTypes(result.queries)))
                .append($('<td>').html(deleteLink(result)));
            table.append(row);
        });
        $('#mw-content-text').html(table)
            .prepend($('<p>').text(results.length + ' Queried Decks').css('font-weight', 'bold'))
            .append($('<p>').text('A days value of -1 means that the query date is unknown').css('font-style', 'italic'));
        mw.loader.using('jquery.tablesorter', function () {
            table.tablesorter({cssHeader:''});
            table.find('th').css('cursor', 'pointer').find('div').remove();
        });
    }

    $(function () {
        $('.page-header__title').text('Deck Queries');
        $('title').text('Deck Queries');
        $('#mw-content-text').html('<p>Fetching queried decks...</p>');
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

