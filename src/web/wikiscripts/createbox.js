(function ($) {
    /*global mw */
    'use strict';

    console.log('Build 103');

    if ($('.mdw-createbox').length === 0)
        return;

    function getBaseUrl() {
        // return 'http://magicarena.wikia.com/wiki/';
        return '/wiki/';
    }

    function removeIncludes(contents) {
        return contents
            .replace(/<[\/]?noinclude>|<[\/]?includeonly>/g, '');
    }

    function getControls(createbox) {
        var children = createbox.children();
        return {
            text: $(children[0]),
            error: $(children[3])
        };
    }

    function editPage(page, config) {
        console.log('editPage');
        var url = getBaseUrl() + page + '?action=edit';
        if (config.useeditor) url += '&useeditor=' + config.useeditor;
        if (config.editintro) url += '&editintro=' + config.editintro;
        window.location = url;
    }

    function createAndEdit(page, content, config) {
        console.log('createAndEdit');
        mw.loader.using('mediawiki.api').then(function () {
            console.log('creating page...');
            var api = new mw.Api();
            api.post({
                action: 'edit',
                title: page,
                summary: 'Created with createbox',
                text: content,
                createonly: 'yes',
                token: mw.user.tokens.get('editToken')
            } ).done( function() {
                console.log( 'Saved successfully' );
                editPage(page, config);
            } ).fail( function( code, result ) {
                if ( code === 'http' ) {
                    console.log( 'HTTP error: ' + result.textStatus ); // result.xhr contains the jqXHR object
                } else if ( code === 'ok-but-empty' ) {
                    console.log( 'Got an empty response from the server' );
                } else {
                    console.log( 'API error: ' + code );
                }
            } );
        });
    }

    function getConfig(createbox) {
        var config = createbox.data();
        config.prefix = config.prefix || '';
        config.buttontext = config.buttontext || 'Create';
        config.placeholder = config.placeholder || '';
        return config;
    }

    function buttonClick() {
        /*jshint -W040 */  // allow old school jquery use of this
        // debugger;
        var button = $(this);
        button.prop('disabled', true);
        var createbox = $(this).parent();
        var controls = getControls(createbox);
        var pagename = controls.text.val();
        if (pagename.length === 0) {
            controls.error.html('You must enter a deck name');
            button.prop('disabled', false);
            return;
        }

        var indicator = $('<img>', {
            src: mw.config.get('stylepath') + '/common/images/ajax.gif'
        });
        controls.error.html(indicator);

        var config = getConfig(createbox);

        $.get(getBaseUrl() + config.prefix + pagename + '?action=raw').done(function () {
            controls.error.html(config.existserror || 'Page already exists');
            button.prop('disabled', false);
        }).fail(function (xhr, status, error) {
            if (xhr.status !== 404) {
                controls.error.html('Error: ' + error);
                button.prop('disabled', false);
                return;
            }
            if (config.preload) {
                $.get(getBaseUrl() + config.preload + '?action=raw').done(function (preload) {
                    preload = removeIncludes(preload);
                    createAndEdit(config.prefix + pagename, preload, config);
                }).fail(function () {
                    controls.error.html('Preload failed.');
                    button.prop('disabled', false);
                });
            } else {
                editPage(config.prefix + pagename, config);
            }
        });
    }

    function initialize() {
        $('.mdw-createbox').each(function () {
            var createbox = $(this);
            var config = getConfig(createbox);
            var input = $('<input type="text">').attr('placeholder', config.placeholder);
            var button = $('<input>', {
                type: 'button',
                value: config.buttontext
            }).click(buttonClick);
            createbox.append(input)
                .append(button)
                .append('<br>')
                .append('<span class="mdw-createbox-error">');
        });
    }

    $(document).ready(initialize);

}(jQuery));