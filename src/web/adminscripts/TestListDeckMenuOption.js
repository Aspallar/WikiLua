(function($) {
    'use strict';
    /*global mw */
 
    var pageName = mw.config.get('wgTitle');
    if (pageName.substring(0, 6) !== 'Decks/')
        return;
 
    var author = $('#mw-content-text a[href^="/wiki/User:"');
    author = (author.length > 0) ? author.attr('href').substring(11) : 'Anonymous';
 
    $('.UserProfileActionButton > .wikia-menu-button > ul, .page-header__contribution-buttons .wds-list').append(
        $('<li>').append(
            $('<a>', {
                href: mw.util.getUrl('User:Aspallar/Sandbox/dle', { author: author, deck: pageName.substring(6) }),
                text: 'List Deck (Test)',
                title: 'List the deck using the Deck List Editor'
            })
        )
    );
 
}(jQuery));
