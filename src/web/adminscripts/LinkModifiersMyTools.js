(function ($) {
    'use strict';
    function highlight(element) {
        $(element).css('font-weight', 'bold');
    }
    function openBlank(event) {
        /*jshint -W040 */
        event.preventDefault();
        highlight(this);
        $('#WikiaArticle a').attr('target', '_blank');
    }
    function openAction(action) {
        var actionRe = /[\?&]action=/;
        $('#WikiaArticle a').each(function () {
            var that = $(this);
            var href = that.attr('href');
            if (href !== '#' && !actionRe.test(href)) {
                that.attr('href', href + (href.includes('?') ? '&' : '?') + 'action=' + action);
            }
        });
    }
    function openRaw(event) {
        /*jshint -W040 */
        event.preventDefault();
        highlight(this);
        openAction('raw');
    }
    function openEdit() {
        /*jshint -W040 */
        event.preventDefault();
        highlight(this);
        openAction('edit');
    }
    function menuLink(text, handler) {
        return $('<li>')
            .append($('<a>').attr({href: '#'}).text(text))
            .click(handler);
    }
    $(function () {
        $('#my-tools-menu').prepend(
            menuLink('Open Blank', openBlank),
            menuLink('Open Raw', openRaw),
            menuLink('Open Edit',openEdit)
        );
    });
}(jQuery));
