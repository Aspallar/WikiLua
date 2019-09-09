// ==========================================================================
// ImportDeck
//
// Version 1.7.0
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

    if (document.getElementById('mdw-import-deck') === null || $('#mdw-disabled-js').attr('data-importdeck-1-7-0'))
        return;

    var newDeckTemplate = '';
    var translation = null;
    var titleCaser;

    function TitleCaser(minorWords, acronyms) {

        function isColorString(str) {
            return str.length <= 5 && 
                ['rug', 'rub', 'bug', 'grub'].indexOf(str) === -1 &&
                /^(?:([ubwrg])(?!.*\1))*$/.test(str);
        }

        return {
            caseText: function(text) {
                text = text.trim().toLowerCase();
                return text.replace(/\w+/g, function(word, offset) {
                    if (word === 's' && offset > 1 && /['\u2019]/.test(text[offset - 1]))
                        return 's';
                    else if ((acronyms && acronyms.indexOf(word) !== -1) || isColorString(word))
                        return word.toUpperCase();
                    else if (minorWords && offset !== 0 && minorWords.indexOf(word) !== -1)
                        return word.toLowerCase();
                    else
                        return word.substring(0, 1).toUpperCase() + word.substring(1);
                });                
            }
        };
    }

    function removeIncludes(contents) {
        return contents.replace(/<[\/]?noinclude>|<[\/]?includeonly>/g, '');
    }

    function invalidTitle(title) {
        return /\/|#|\?/.test(title);
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
        var safeContent = badEntries.map(function (x) { return mw.html.escape(x); }).join('<br />');
        $('#mdw-import-badentries-content').html(safeContent);
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
        if (Array.isArray(message)) {
            message = message.reduce(function (a, v) { return a + '* ' + v + '<br />'; }, '');
            message = message.substring(0, message.length - 6);
        }
        else {
            message = '* ' + message;
        }
        $('#mdw-import-' + name + '-error').html(message);
        return false;
    }

    function unexpectedError(message) {
        displayError('unexpected', 'An unexpected error occurred: ' + message);
    }

    function validateDeckName() {
        var name = $('#mdw-import-deckname').val().trim();
        if (name.length === 0)
            return displayError('deckname', 'A deck name is required.');
        else if (/^\d+$/.test(name))
            return displayError('deckname', 'Deck name cannot just be a number.');
        else if (name.length < 3)
            return displayError('deckname', 'Deck name is too short.');
        else if (invalidTitle(name))
            return displayError('deckname', 'Deck name must not contain /, #, or ? ');
        else if (/(.)\1{2,}/i.test(name))
            return displayError('deckname', 'Too many repeating characters.');
        else if (/^[qwerty ]+$|^[asdf ]+$|^[zxcvb ]+$|^[ghjkl; ]+$/i.test(name))
            return displayError('deckname', 'Looks like gibberish, try another name.');
        else
            return true;
    }

    function redirectToTitle(title) {
        window.location = mw.util.getUrl(title);
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

    function correctCardName(name) {
        return replaceCurlyQuotesWithApostrophe(name)
            .replace(/\/+/g, ' // ')
            .replace(/\s\s+/g, ' ');
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
        return deckEntries.map(function (entry) {
            return translateCard(entry);
        }).join('\n');
    }

    function createDeckPage(name, deckEntries, originalText) {
        disableControls();
        showWorking();
        mw.loader.using('mediawiki.api').then(function () {
            var content = newDeckTemplate.replace('$1', getDeckText(deckEntries)) +
                '\n<!-- Original Deck Text\n' + mw.html.escape(originalText) + '-->\n';
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
                if (result.error === undefined)
                    redirectToTitle(title);
                else
                    handleCreateError(result.error);
            }).fail(function(code, result) {
                unexpectedError(code + (code === 'http' ? ' ' + result.textStatus : ''));
            });
        });
    }

    function disallowedRegex() {
        var disallowed = $('#mdw-import-deck').attr('data-disallow');
        return disallowed ? new RegExp('[' + disallowed.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + ']') : null;
    }

    function stripSetCode(cardEntry) {
        return cardEntry.replace(/\([A-Z][0-9A-Z][0-9A-Z]\)/, '');
    }

    function parseDeckDef(deckdef) {
        var match;
        var disallowed = disallowedRegex();
        var maxLength = $('#mdw-import-deck').attr('data-maxcardlength') || 40;
        var result = { validEntries: [], badEntries: [], sideboardCount: 0, cardCount: 0, sideCardCount: 0 };
        deckdef.split('\n').forEach(function (entry) {
            entry = entry.trim();
            if (entry.length === 0) {
                ++result.sideboardCount;
                result.validEntries.push('--- sideboard ---');
            } else if (entry.length > maxLength) {
                result.badEntries.push(entry.substring(0, maxLength) + '... (too long)');
            } else if (disallowed && disallowed.test(stripSetCode(entry))) {
                result.badEntries.push(entry);
            } else if ((match = /^(\d+)\s+.*\S.*$/.exec(entry))) {
                result.validEntries.push(correctCardName(entry));
                if (result.sideboardCount === 0)
                    result.cardCount += parseInt(match[1], 10);
                else
                    result.sideCardCount += parseInt(match[1], 10);
            } else {
                result.badEntries.push(entry);
            }
        });
        return result;
    }

    function clickImport() {
        hideBadEntries();
        $('.mdw-error').html('');
        var result;
        var nameValid = validateDeckName();
        var deckErrors = [];
        var text = $('#mdw-import-deckdef').val().trim();
        if (text.length === 0)
            deckErrors.push('You must enter a deck definition');
        else {
            result = parseDeckDef(text);
            if (result.badEntries.length > 0) {
                showBadEntries(result.badEntries);
                deckErrors.push('Import contains invalid entries (see below).');
            }
            if (result.sideboardCount > 1) 
                deckErrors.push('Import contains more than one sideboard.');
            if (result.cardCount < 60)
                deckErrors.push('Only ' + result.cardCount + ' cards. Deck must contain minimum of 60.');
            if (result.sideCardCount > 15)
                deckErrors.push('Sideboard has ' + result.sideCardCount + ' cards. Maximum of 15 cards.');
        }
        if (deckErrors.length > 0)
            displayError('deckdef', deckErrors);
        else if (nameValid)
            createDeckPage($('#mdw-import-deckname').val(), result.validEntries, text);
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

    function makeTitleCase() {
        /*jshint -W040 */ // allow old school jquery use of this 
        var that = $(this);
        that.val(titleCaser.caseText(that.val()));
    }

    function createForm() {
        /*jshint multistr:true*/
        $('#mdw-import-deckname-span').append(
            $('<input type="text" id="mdw-import-deckname" size="40" maxlength="100" placeholder="Deck name" />')
                .blur(makeTitleCase)
        );
        $('#mdw-import-deckdef-span')
            .append('<textarea id="mdw-import-deckdef" cols="60" rows="25"></textarea>');
        $('#mdw-import-button-span')
            .append('<input type="button" id="mdw-import-button" value="Import Deck" />')
            .click(clickImport);
        var languages = $('<label><input type="radio" name="mdw-import-lang" id="mdw-import-english" checked value="en"><span>English</span></label>\
            <label><input type="radio" name="mdw-import-lang" value="de"><span>Deutsch</span></label>\
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
            var importDef = $('#mdw-import-deck');
            titleCaser = new TitleCaser((importDef.attr('data-minorwords') || '').split('|'), (importDef.attr('data-acronyms') || '').split('|'));
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