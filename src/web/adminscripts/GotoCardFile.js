(function ($) {
    'use strict';
    /*global mw */

    if (document.getElementById('mdw-deck-links') === null)
        return;

    function clickImage() {
        /*jshint -W040*/
        var imageName = $(this).attr('data-image-name');
        if (imageName)
            window.location = mw.util.getUrl('File:' + imageName);
    }

    $(function () {
        $('#WikiaArticle img').css('cursor', 'pointer').click(clickImage);
    });

}(jQuery));