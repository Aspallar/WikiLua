// ==========================================================================
// ImportDeck
//
// Version 1.3.0
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

    if (document.getElementById('mdw-import-deck') === null || $('#mdw-disabled-js').attr('data-importdeck-1-3-0'))
        return;

    var newDeckTemplate = '';
    var translation = null;

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

    function controlsDisabled(disabled) {
        $('#mdw-import-button').prop('disabled', disabled);
        $('input[name="mdw-import-lang"').prop('disabled', disabled);
    }

    function disableControls() {
        controlsDisabled(true);
    }

    function enableControls() {
        controlsDisabled(false);
    }

    function fetchNewDeckTemplate() {
        // var deferred = $.Deferred();
        // deferred.resolve('start/n$1/nend<includeonly>');
        // return deferred.promise();
        return $.get(mw.util.getUrl('Template:NewDeck', {action: 'raw'}));
    }

    function fetchTranslation(langCode) {
        return $.get(mw.util.getUrl('MediaWiki:Custom-Cards-' + langCode, {action: 'raw'}));
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
        enableControls();
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

    function translateCard(entry) {
        if (translation === null)
            return entry;
        var match = /(\d+)\s+(.*?)(?=\s+\/\/|\s+\(|$)/.exec(entry);
        if (!match)
            return entry;
        var translatedName = translation[match[2].toLowerCase().trim()];
        if (translatedName === undefined)
            return entry;
        return match[1] + ' ' + translatedName;
    }

    function getDeckText(deckEntries) {
        var fixedEntries = [];
        deckEntries.forEach(function (entry) {
            var translatedEntry = translateCard(replaceCurlyQuotesWithApostrophe(entry));
            fixedEntries.push(translatedEntry);
        });
        return fixedEntries.join('\n');
    }

    function createDeckPage(name, deckEntries) {
        disableControls();
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
        var maxLength = $('#mdw-import-deck').attr('data-maxcardlength') || 40;
        var result = { validEntries: [], badEntries: [], sideboardCount: 0 };
        deckdef.split('\n').forEach(function (entry) {
            entry = entry.trim();
            if (entry.length === 0) {
                ++result.sideboardCount;
                result.validEntries.push('--- sideboard ---');
            } else if (entry.length > maxLength) {
                result.badEntries.push(entry.substring(0, maxLength) + '... (too long)');
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

    function showTranslationLoadFail(langCode) {
        $.showCustomModal(
            'Load Error',
            '<p>Failed to load translation data (' + langCode + '). Defaulting back to English.</p>', {
            id: 'mdw-loadfail-dialog',
            width: 350,
            buttons: [{
                id: 'mdw-loadfail-dialog-ok',
                message: 'OK',
                defaultButton: true,
                handler: function () {
                    $('#mdw-loadfail-dialog').closeModal();
                }
            }]
        });
    }

    function parseTranslation(data) {
        var trans = {};
        data.split('\n').forEach(function (entry) {
            var match = /^(.*)?\|(.*)$/.exec(entry);
            if (match)
                trans[match[1].toLowerCase()] = match[2];
        });
        return trans;
    }

    function changeLanguage() {
        /*jshint -W040 */ // allow old school jquery use of this 
        var langCode = $(this).val();
        if (langCode === 'en') {
            translation = null;
        } else {
            disableControls();
            fetchTranslation(langCode).done(function (data) {
                translation = parseTranslation(data);
                enableControls();
            }).fail(function () {
                showTranslationLoadFail(langCode);
                $('#mdw-import-english').prop('checked', true);
                translation = null;
                enableControls();
            });
        }
    }

    function createForm() {
        /*jshint multistr:true*/
        $('#mdw-import-deckname-span')
            .append('<input type="text" id="mdw-import-deckname" size="40" maxlength="100" placeholder="Deck name" />');
        $('#mdw-import-deckdef-span')
            .append('<textarea id="mdw-import-deckdef" cols="60" rows="25"></textarea>');
        $('#mdw-import-button-span')
            .append('<input type="button" id="mdw-import-button" value="Import Deck" />')
            .click(clickImport);
        var languages = $('<label><input type="radio" name="mdw-import-lang" id="mdw-import-english" checked value="en"><span>English</span></label>\
            <label><input type="radio" name="mdw-import-lang" value="de"><span>Deutsche</span></label>\
            <label><input type="radio" name="mdw-import-lang" value="es"><span>Español</span></label>\
            <label><input type="radio" name="mdw-import-lang" value="fr"><span>Français</span></label>\
            <label><input type="radio" name="mdw-import-lang" value="it"><span>Italiano</span></label>\
            <label><input type="radio" name="mdw-import-lang" value="pt-br"><span>Português</span></label>');
        languages.find('input[name="mdw-import-lang"]').change(changeLanguage);
        $('#mdw-lang-span').replaceWith(languages);
    }

    function initialize() {
        $('#mdw-working').html($('<img>', {
            src: mw.config.get('stylepath') + '/common/images/ajax.gif'
        }));
        showWorking();
        fetchNewDeckTemplate().done(function (template) {
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