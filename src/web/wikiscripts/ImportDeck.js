// ==========================================================================
// ImportDeck
//
// Version 1.1.0
// Author: Aspallar
//
// Provides a user friendly way to import a deck from Magic Arena
// without the user having to edit any wikitext.
//
// ** Please do not edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
(function ($) {
    /* global mw*/
    'use strict';

    if (document.getElementById('mdw-import-deck') === null || $('#mdw-disabled-js').attr('data-importdeck-1-1-0'))
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
        var safeBadEntries = [];
        badEntries.forEach(function (entry) {
            safeBadEntries.push(mw.html.escape(entry));
        });
        var content = safeBadEntries.join('<br />');
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

    function getNewDeckTemplate() {
        // var deferred = $.Deferred();
        // deferred.resolve('start/n$1/nend<includeonly>');
        // return deferred.promise();
        return $.get(buildUrl('Template:NewDeck', {action: 'raw'}));
    }

    function displayError(name, message) {
        $('#mdw-import-' + name + '-error').html('* ' + message);
        return false;
    }

    function unexpectedError(message) {
        displayError('unexpected', 'An unexpected error occurred: ' + message);
    }

    function validateDeckName() {
        var name = $('#mdw-import-deckname').val().trim();
        if (name.length === 0)
            return displayError('deckname', 'A deck name is required.');
        else if (invalidTitle(name))
            return displayError('deckname', 'Invalid deck name.');
        else
            return true;
    }

    function validateDeckDef() {
        var deckdef = $('#mdw-import-deckdef').val().trim();
        if (deckdef.length === 0)
            return displayError('deckdef', 'You must enter a deck definition');
        else
            return true;
    }

    function redirectToTitle(title) {
        var url = mw.config.get('wgArticlePath').replace('$1', title);
        window.location = url;
    }

    function handleCreateError(error) {
        enableButton();
        if (error.code === 'articleexists') {
            displayError('deckname', 'Deck name already in use.');
            $('#mdw-import-deckname').focus();
        } else if (error.code === 'invalidtitle') {
            displayError('deckname', 'Invalid deck name.');
            $('#mdw-import-deckname').focus();
        } else {
            unexpectedError(error.info);
        }
    }

    function replaceCurlyQuotesWithApostrophe(s) {
        return s.replace(/[\u2018\u2019]/g, '\'');
    }

    function getDeckText(deckEntries) {
        var fixedEntries = [];
        deckEntries.forEach(function (entry) {
            fixedEntries.push(replaceCurlyQuotesWithApostrophe(entry));
        });
        return fixedEntries.join('\n');
    }

    function createDeckPage(name, deckEntries) {
        disableButton();
        showWorking();
        mw.loader.using('mediawiki.api').then(function () {
            var content = newDeckTemplate.replace('$1', getDeckText(deckEntries));
            var title = 'Decks/' + name;
            new mw.Api().post({
                action: 'edit',
                title: title,
                summary: 'Imported deck',
                createonly: 'yes',
                text: content,
                token: mw.user.tokens.get('editToken')
            }).done(function(result) {
                hideWorking();
                if (result.error === undefined) {
                    redirectToTitle(title);
                } else {
                    handleCreateError(result.error);
                }
            }).fail(function(code, result) {
                unexpectedError(code + (code === 'http' ? ' ' + result.textStatus : ''));
            });
        });

    }

    function parseDeckDef(deckdef) {
        var result = { validEntries: [], badEntries: [], sideboardCount: 0 };
        deckdef.split('\n').forEach(function (entry) {
            entry = entry.trim();
            if (entry.length === 0) {
                ++result.sideboardCount;
                result.validEntries.push('--- sideboard ---');
            } else if (/^\d+\s+.*\S.*$/.test(entry)) {
                result.validEntries.push(entry);
            } else {
                result.badEntries.push(entry);
            }
        });
        return result;
    }

    function clickImport() {
        hideBadEntries();
        $('.mdw-error').html('');
        var nameValid = validateDeckName() ;
        var deckdefValid = validateDeckDef();
        if (deckdefValid) {
            var result = parseDeckDef($('#mdw-import-deckdef').val().trim());
            if (result.badEntries.length > 0)
                showBadEntries(result.badEntries);
            if (result.sideboardCount > 1) 
                displayError('deckdef', 'Import contains more than one sideboard.');
            if (nameValid && result.badEntries.length === 0 && result.sideboardCount <= 1)
                createDeckPage($('#mdw-import-deckname').val(), result.validEntries);
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