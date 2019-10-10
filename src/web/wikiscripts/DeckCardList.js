(function ($) {
    /*global mw*/
    /*jshint -W003*/
    'use strict';

    if(document.getElementById('mdw-view-card-list') === null)
        return;

    var parsed = false;

    function setLinkText() {
        var link = $('#mdw-view-card-list');
        if ($('#mdw-deck-card-list').is(':visible'))
            link.text('Hide detailed card list');
        else
            link.text('View detailed card list');
    }

    function setLink() {
        $('#mdw-view-card-list').replaceWith($('<a>', {href: '#', id: 'mdw-view-card-list'}).click(clickViewList));
        setLinkText();
    }

    function showWorking() {
        $('#mdw-view-card-list').replaceWith($('<img>', {
            src: mw.config.get('stylepath') + '/common/images/ajax.gif',
            id: 'mdw-view-card-list'
        }));
    }


    function makeCardTable() {
        var cards = JSON.parse($('#mdw-chartdata-pre').text());
        var text = '{| class="CardRow article-table"\n';
        cards.forEach(function (card) {
            text += '{{CardRow|' + card.name + '}}\n';
        });
        text += '|}';
        return text;
    }

    function parse(text) {
        showWorking();
        mw.loader.using('mediawiki.api', function () {
            new mw.Api().get({
                action: 'parse',
                disablepp: '1',
                prop: 'text',
                text: text
            }).done(function (data) {
                console.log(data);
                $('#mdw-deck-card-list').html(data.parse.text['*']).show(400);
                setLink();
                parsed = true;
            }).fail(function () {
                console.log('parse failed');
            });
        });
    }

    function clickViewList(event) {
        event.preventDefault();
        if (!parsed) {
            parse(makeCardTable());
        } else {
            $('#mdw-deck-card-list').toggle(400, function() {
                setLinkText();
            });
        }
    }

    function initialize() {
        setLink();
    }

    $(initialize);

}(jQuery));
