// <nowiki>
// Shows a warning dialog when an external link is clicked.
// Comments handling code was taken from https://dev.fandom.com/wiki/AjaxCommentDelete
// @author Aspallar, fngplg, OneTwoThreeFall
if (!window.ExternalLinkWarningLoaded) {

    window.ExternalLinkWarningLoaded = true;

    (function ($) {
        /*global mw*/
        /*jshint -W003 */ // used before definition

        'use strict';

        if (window.ExternalLinkWarningNamespaces) {
            if (!Array.isArray(window.ExternalLinkWarningNamespaces)) {
                console.error('ExternalLinkWarning.js => ExternalLinkWarningNamespaces is not an array.');
            } else if (window.ExternalLinkWarningNamespaces.indexOf(mw.config.get('wgCanonicalNamespace')) === -1) {
                return;
            }
        }

        if (window.ExternalLinkWarningPageRegex) {
            if (window.ExternalLinkWarningPageRegex instanceof RegExp) {
                if (!window.ExternalLinkWarningPageRegex.test(new mw.Uri(window.location.href).path))
                    return;
            } else {
                console.error('ExternalLinkWarning.js => ExternalLinkWarningPageRegex is not a RegExp');
            }
        }

        var titleText, messageTemplate, continueText, cancelText;

        function externalLinkClick (event) {
            /*jshint -W040 */ // allow old school jquery this
            var linkhref = $(this).attr('href');
            event.preventDefault();
            var message = $('<p>').html(messageTemplate.replace('$1', mw.html.escape(linkhref)));
            $.showCustomModal(titleText, message, {
                id: 'form-external-link-confirm',
                width: 350,
                buttons: [
                    {
                        message: continueText,
                        defaultButton: true,
                        handler: function () {
                            window.location = linkhref;
                        }
                    }, {
                        message: cancelText,
                        handler: function () {
                            $('#form-external-link-confirm').closeModal();
                        }
                    }
                ]
            });
        }

        function preload () {
            titleText = 'External Link';
            messageTemplate = 'You are following a link to $1, a site that is not part of Fandom. Are you sure you wish to do this?';
            continueText = 'Continue';
            cancelText = 'Cancel';
            mw.loader.using('mediawiki.api').then(function () {
                var api = new mw.Api();
                api.get({
                    action: 'query',
                    meta: 'allmessages',
                    ammessages: 'Custom-ExternalLinkWarning',
                }).done(function (data) {
                    if (data.error === undefined && data.query.allmessages[0].missing === undefined) {
                        var texts = data.query.allmessages[0]['*'].split('|');
                        if (texts.length >= 1 && texts[0].length > 0)
                            titleText = mw.html.escape(texts[0]);
                        if (texts.length >= 2 && texts[1].length > 0)
                            messageTemplate = mw.html.escape(texts[1]);
                        if (texts.length >= 3 && texts[2].length > 0)
                            continueText = mw.html.escape(texts[2]);
                        if (texts.length >= 4 && texts[3].length > 0)
                            cancelText = mw.html.escape(texts[3]);
                    }
                });
            });
        }

        preload();
        $('body').on('click', 'a.external', externalLinkClick);

    }(jQuery));
}
// </nowiki>

