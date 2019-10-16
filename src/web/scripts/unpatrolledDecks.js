(function ($) {
    /*global mw*/
    'use strict';

    //api.php?action=query&list=recentchanges&rcprop=title|ids|sizes|flags|user&rclimit=3

    //api.php?action=query&generator=recentchanges&grcshow=!patrolled&prop=info
    function fetchDecks() {
        var api = new mw.Api();
        api.get({
            action: 'query',
            list: 'recentchanges',
            format: 'json',
            // rcshow: '!patrolled', 
            rcprop: 'title|patrolled',
            rclimit: '50'
        }).done(function (data) {
            console.dir(data);
        }).fail(function (error) {
            console.error('Unpatrolled decks fetch error ');
            console.dir(error);
        });
    }

    function initialize() {
        fetchDecks();
    }

    $(initialize);

}(jQuery));
