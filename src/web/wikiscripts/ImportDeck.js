(function ($) {
    /* global mw*/
    'use strict';

    console.log('Import deck build 1');

    if (document.getElementById('mdw-import-deck') === null || $('#mdw-disabled-js').attr('importdeck-1-0-0'))
        return;

    var newDeckTemplate = '';

    function getBaseUrl() {
        return mw.config.get('wgArticlePath').replace('$1', '');
    }

    function buildUrl(page, query) {
        return getBaseUrl() + page + (query ? '?' + $.param(query) : '');
    }

    function removeIncludes(contents) {
        return contents.replace(/<[\/]?noinclude>|<[\/]?includeonly>/g, '');
    }

    function invalidTitle(title) {
        return /#|\?/g.test(title);
    }

    function showWorking() {
        $('#mdw-working').show();
    }

    function hideWorking() {
        $('#mdw-working').hide();
    }

    function showForm() {
        $('#mdw-import-deck').fadeIn(400);
    }

    function showBadEntries(badEntries) {
        var content = badEntries.join('<br />');
        $('#mdw-import-badentries-content').html(content);
        $('#mdw-import-badentries').fadeIn(400);
    }

    function hideBadEntries() {
        $('#mdw-import-badentries').hide();
    }

    function disableButton() {
        $('#mdw-import-button').prop('disabled', true);
    }

    function enableButton() {
        $('#mdw-import-button').prop('disabled', false);
    }

    function fatalError(error) {
        console.log('fatalError');
        console.log(error);
    }

    function getNewDeckTemplate() {
        // var deferred = $.Deferred();
        // deferred.resolve('$1<includeonly>');
        // return deferred.promise();
        return $.get(buildUrl('Template:NewDeck', {action: 'raw'}));
    }

    function validate() {
        var errors = false;
        $('.mdw-error').html('');
        var name = $('#mdw-import-deckname').val().trim();
        if (name.length === 0) {
            $('#mdw-import-deckname-error').html('* A deck name is required');
            errors = true;
        }
        else if (invalidTitle(name)) {
            $('#mdw-import-deckname-error').html('* Invalid deck name');
            errors = true;
        }
        var deckdef = $('#mdw-import-deckdef').val().trim();
        if (deckdef.length === 0) {
            $('#mdw-import-deckdef-error').html('You must enter a deck definition');
            errors = true;
        }
        return !errors;
    }

    function redirectToTitle(title) {
        var url = mw.config.get('wgArticlePath').replace('$1', title);
        window.location = url;
    }

    function createDeckPage(deckEntries) {
        disableButton();
        showWorking();
        var content = newDeckTemplate.replace('$1', deckEntries.join('\n'));
        var title = 'Decks/' + $('#mdw-import-deckname').val();

        mw.loader.using('mediawiki.api').then(function () {
            var api = new mw.Api();
            api.post({
                action: 'edit',
                title: title,
                summary: 'Imported deck',
                text: content,
                createonly: 'yes',
                token: mw.user.tokens.get('editToken')
            }).done(function(result) {
                hideWorking();
                if (result.error) {
                    if (result.error.code === 'articleexists') {
                        $('#mdw-import-deckname-error').html('* Deck name already used.');
                        $('#mdw-import-deckname').focus();
                        enableButton();
                    } else if (result.error.code === 'invalidtitle') {
                        $('#mdw-import-deckname-error').html('* Invalid deck name');
                        $('#mdw-import-deckname').focus();
                        enableButton();
                    } else {
                        fatalError(result.error.info);
                    }
                } else {
                    redirectToTitle(title);
                }
            }).fail(function(code, result) {
                fatalError('Error ' + code + (code === 'http' ? ' ' + result.textStatus : ''));
            });
        });

    }

    function clickImport() {
        hideBadEntries();
        if (!validate())
            return;
        var decktext = $('#mdw-import-deckdef').val().trim();
        var blankLineCount = 0;
        var deckEntries = [];
        var badEntries = [];
        decktext.split('\n').forEach(function (entry) {
            entry = entry.trim();
            if (entry.length === 0) {
                ++blankLineCount;
                deckEntries.push('--- sideboard ---');
            } else if (/^\d+\s+.*\S.*$/.test(entry)) {
                deckEntries.push(entry);
            } else {
                badEntries.push(entry);
            }
        });
        if (badEntries.length > 0) {
            showBadEntries(badEntries);
        } else if (blankLineCount > 1) {
            $('#mdw-import-deckdef-error').html('Import contains more than one sideboard.');
        } else {
            createDeckPage(deckEntries);
        }
    }

    function createForm() {
        $('#mdw-import-deckname-span')
            .append('<input type="text" id="mdw-import-deckname" size="40" maxlength="100" placeholder="Deck name" />');
        $('#mdw-import-deckdef-span')
            .append('<textarea id="mdw-import-deckdef" cols="40" rows="25"></textarea>');
        $('#mdw-import-button-span')
            .append('<input type="button" id="mdw-import-button" value="Import Deck" />')
            .click(clickImport);
    }

    function initialize() {
        $('#mdw-working').html($('<img>', {
            src: mw.config.get('stylepath') + '/common/images/ajax.gif'
        }));
        showWorking();
        getNewDeckTemplate().done(function (template) {
            newDeckTemplate = removeIncludes(template);
            createForm();
            hideWorking();
            showForm();
            $('#mdw-import-deckname').focus();
        }).fail(function () {
            hideWorking();
            $('#mdw-import-deck').html('<p>Failed to load new deck template.</p>');
            showForm();
        });
    }

    $(document).ready(initialize);

}(jQuery));