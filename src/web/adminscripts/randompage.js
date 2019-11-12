(function () {
    /*global mw*/
    'use strict';

    if (['User', 'Special', 'MediaWiki'].indexOf(mw.config.get('wgCanonicalNamespace')) !== -1)
        return;

    var timeout;
    var key = 'random-page';

    function start() {
        var page = sessionStorage.getItem(key);
        if (page === null)
            return true;
        $('#mdw-random-page').text('Toggle Random (active)');
        $('span.wds-community-header__counter-value').css('color', 'red').html(++page);
        sessionStorage.setItem(key, page);
        timeout = setTimeout(function () {
            window.location = '/wiki/Special:RandomPage';
        }, 6000);
        return false;
    }

    function stop() {
        $('#mdw-random-page').text('Toggle Random (inactive)');
        clearTimeout(timeout);
    }

    function toggleActive(event) {
        event.preventDefault();
        if (sessionStorage.getItem(key) !== null) {
            sessionStorage.removeItem(key);
            stop();
        } else {
            sessionStorage.setItem(key, '-1');
            start();
        }
    }

    $(function () {
        $('#my-tools-menu').prepend(
            $('<li>').append($('<a>', {href: '#', id: 'mdw-random-page', click: toggleActive}))
        );
        if (start()) stop();
     });
}());
