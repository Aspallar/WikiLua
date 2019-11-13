$(function ($) {
    /*global mw */
    'use strict';
    mw.util.addCSS( '.wds-community-header #analytics-header-btn svg { height: 18px }' );
 
    $( '<a>', {
        href: mw.util.getUrl( 'Special:Analytics' ),
        class: 'wds-button wds-is-secondary',
        title: 'Bad News',
        id: 'analytics-header-btn',
        html: '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 24 24"><defs><path id="poll-a" d="M17 21h5V10h-5v11zm-7-6V3h5v18h-5v-6zm-7 6h5v-5H3v5zM23 8h-6V2a1 1 0 0 0-1-1H9a1 1 0 0 0-1 1v12H2a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h21a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1z"/></defs><use fill-rule="evenodd" xlink:href="#poll-a"/></svg>'
    } ).insertBefore( '.wds-community-header .wds-community-header__wiki-buttons .wds-dropdown' );
});