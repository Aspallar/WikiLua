(function($) {
    'use strict';
    /*global mw */

    console.log('Deck Edit F');

    var pageName = mw.config.get('wgTitle');

    if (pageName.substring(0, 6) !== 'Decks/')
        return;

    $('.UserProfileActionButton > .wikia-menu-button > ul, .page-header__contribution-buttons .wds-list').append(
        $('<li>').append(
            $('<a>', {
                href: mw.util.getUrl('User:Aspallar/Sandbox/Deck', { deck: pageName.substring(6) }),
                text: 'Deck Builder',
                title: 'Edit with the deck builder'
            })
        )
    );

}(jQuery));