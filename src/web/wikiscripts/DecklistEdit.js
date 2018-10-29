// ==========================================================================
// DecklistEdit
//
// Version 1.4.0
// Author: Aspallar
//
// Provides a user friendly way to add a deck to a deck list.
//
// ** Please do not edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
//
(function ($) {
    /*global mw */
    'use strict';

    if (document.getElementById('mdw-dle-editor') === null || $('#mdw-disabled-js').attr('data-decklistedit-1-4-0'))
        return;

    var config;
    var userLinksUrl = mw.config.get('wgScriptPath') + '/index.php?action=ajax&rs=getLinkSuggest&query=User%3A';

    function initConfig() {
        config = $('#mdw-dle-editor').data();
        if (!config.decklist)
            return 'The deck list to edit has not been specified (data-decklist).';
        if (!config.insertionMarker)
            return 'No insertion point marker specified (data-insertion-marker).';
        if (!config.allowInvalidChars) {
            config.allowInvalidChars = 'never';
        } else {
            if (!['always', 'never', 'trusted'].includes(config.allowInvalidChars))
                return '(data-allow-invalid-chars) must be one of always, never or trusted';
        }
        if (config.filter) {
            config.filter = new RegExp(decodeURIComponent(config.filter));
        }
        config.trustedEditors = [];
        return null;
    }

    function showWorking() {
        $('#mdw-working').show();
    }

    function hideWorking() {
        $('#mdw-working').hide();
    }

    function fatalError(additionalInfo) {
        if (additionalInfo) {
            $('#mdw-dle-additionalinfo').html(additionalInfo);
        }
        $('#mdw-dle-deckselect').prop('disabled', true) ;
        $('#mdw-dle-addtolist').prop('disabled', true) ;
        hideWorking();
        $('#mdw-dle-fatalerror').fadeIn(400);
    }

    function wikiApiCall(data, method) {
        data.format = 'json';
        return $.ajax({
            data: data,
            dataType: 'json',
            url: mw.config.get('wgScriptPath') + '/api.php',
            type: method,
            timeout: 10000 
        });
    }

    function hideUserPopup() {
        $('#mdw-dle-userpopup').css('visibility', 'hidden');
    }

    function showUserPopup() {
        $('#mdw-dle-userpopup').css('visibility', 'visible');
    }

    function getDeletionCandidateDecks() {
        var deferred = $.Deferred();

        wikiApiCall({
            action: 'query',
            list: 'categorymembers',
            cmlimit: 500,
            cmtitle: 'Category:Candidates for deletion'
        }, 'GET').done(function (data) {
            var deletedDecks = {};
            if (data.error === undefined) {
                data.query.categorymembers.forEach(function (member) {
                    if (/^Decks\//.test(member.title))
                        deletedDecks[member.title.substring(6)] = true;
                });
            } else {
                console.log('getDeletionCandidateDecks error');
                console.log(data.error);
            }
            deferred.resolve(deletedDecks);
        }).fail(function () {
            console.log('getDeletionCandidateDecks failed');
            deferred.resolve({});
        });

        return deferred.promise();
    }

    function addIgnoredDecks(ignored) {
        var ingnoredText = $('.mdw-ignore-decks').text();
        if (ingnoredText && ingnoredText.length > 0) {
            ingnoredText.split('\n').forEach(function(line) {
                ignored[line] = true;
            });
        }
    }

    function getTrustedEditors() {
        wikiApiCall({
            action: 'query',
            meta: 'allmessages',
            ammessages: 'Custom-TrustedEditors'
        },'GET').done(function (data) {
            var message = data.query.allmessages[0];
            if (message.missing === undefined) {
                var text = message['*'].trim();
                if (text.length > 0)
                    config.trustedEditors = text.split('|');
            }
        }).fail(function (xhr) {
            console.error('Failed to obtain Custom-TrustedEditors', xhr);
        });
    }

    function getUserLinks(event) {
        var userPrefix = event.target.value;
        if (!userPrefix) {
            hideUserPopup();
            return;
        }
        var includeAnonymous = 'anonymous'.substring(0, userPrefix.length) === userPrefix.toLowerCase();
        $.get(userLinksUrl + userPrefix).done(function (data) {
            if (data || includeAnonymous) {
                var userList = $(document.createDocumentFragment());
                if (includeAnonymous) userList.append($('<li>').text('Anonymous'));
                if (data) {
                    data.split('\n').forEach(function (user) {
                        if (user.indexOf('/') === -1)
                            userList.append($('<li>').text(user.substring(5)));
                    });
                }
                $('#mdw-dle-usermenu').html(userList);
                showUserPopup();
            } else {
                hideUserPopup();
            }
        });
    }

    function getUnlistedDecks(decklistDecks, filter, ignoredDecks) {

        var deferred = $.Deferred();
        var decks = [];

        function wantedDeck(title) {
            return !(filter && filter.test(title)) && 
                !decklistDecks.includes(title) &&
                ignoredDecks[title] === undefined;
        }

        function getDecks(apfrom) {
            wikiApiCall({
                action: 'query',
                list: 'allpages',
                apprefix: 'Decks/',
                aplimit: 100,
                apfrom: apfrom
            }, 'GET').done(function(data) {
                if (data.error) {
                    deferred.reject('getUnlistedDecks ' + data.error.info);
                    return;
                }
                data.query.allpages.forEach(function (deck) {
                    var title = deck.title.substring(6);
                    if (wantedDeck(title))
                        decks.push(title);
                });
                if (data['query-continue']) {
                    getDecks(data['query-continue'].allpages.apfrom);
                } else {
                    deferred.resolve(decks);
                }
            }).fail(function (xhr, status, statusText) {
                console.error(xhr);
                deferred.reject('getUnlistedDecks ' + statusText);
            });
        }

        getDecks(null);
        return deferred.promise();
    }   

    function getContent(page) {
        return page.revisions[0]['*'];
    }

    function getPage(data) {
        var pages = data.query.pages;
        for (var property in pages) {
            if (pages.hasOwnProperty(property))
                return pages[property];
        }
        return null;
    }

    function getDeckTitlesFromDecklists(content) {
        var decks = [];
        var matches = content.match(/^\|link=.*$/gm);
        if (matches) {
            matches.forEach(function(match) {
                decks.push(match.substring(6).replace(/_/g, ' '));
            });
        }
        return decks;
    }

    function getDecklistsDecks() {
        var deferred = $.Deferred();

        wikiApiCall({
            action: 'query',
            prop: 'info|revisions',
            intoken: 'edit',
            titles: config.decklist,
            rvprop: 'content|timestamp',
            rvlimit: '1'
        }, 'GET').done(function (data) {
            if (data.error) {
                deferred.reject('getDecklistsDecks ' + data.error.info);
                return;
            }
            var page = getPage(data);
            if (page.missing !== undefined) {
                deferred.reject('Page [' + config.decklist + '] not found.');
                return;
            }
            var content = getContent(page);
            var decks = getDeckTitlesFromDecklists(content);
            deferred.resolve(decks);
        }).fail(function (xhr, status, statusText) {
            console.error(xhr);
            deferred.reject('getDecklistsDecks ' + statusText);
        });

        return deferred.promise();
    }

    function linkAuthor(entry) {
        var link = '[[User:' + entry.author + '|' + entry.author + ']]';
        return wikiApiCall({
            action: 'parse',
            disablepp: 'true',
            prop: 'text',
            text: link
        }, 'GET').then(function (data) {
            if (data && data.parse && data.parse.text['*'].indexOf('class="new"') === -1) {
                entry.author = link;
            }
        });
    }

    function deckRow(entry) {
        // preferably just use the article title (sans Decks/) as link value but if it starts with one or more spaces we 
        // will have to replace them with underscores because the spaces will be stripped when passed to the template
        var link = entry.link[0] === ' ' ? entry.link.replace(/ /g, '_') : entry.link; 
        var text = '{{DeckRow\n';
        text += '|link=' + link + '\n';
        text += '|strategy=' + entry.type + '\n';
        text += '|colors=' + entry.colors + '\n';
        text += '|author=' + entry.author + '\n';
        text += '|desc=' + entry.desc + '\n';
        if (entry.sideboard)
            text += '|sb=1\n';
        text += '|name=' + entry.name + '}}\n\n';
        return text;
    }

    function editSummary(entry) {
        return 'Adding [[Decks/' + entry.link + ']] as ' +
            entry.name + ' to ' + '[[' + config.decklist + ']] ' +
            ' via [[' + mw.config.get('wgPageName') + '|' + mw.config.get('wgTitle') + ']]';
    }

    function addToDecklists(entry) {

        var deferred = $.Deferred();

        linkAuthor(entry).always(function () {
            wikiApiCall({
                action: 'query',
                prop: 'info|revisions',
                intoken: 'edit',
                titles: config.decklist,
                rvprop: 'content|timestamp',
                rvlimit: '1'
            }, 'GET').done(function (data) {
                var page = getPage(data);
                var content = getContent(page);
                var insertPos = content.indexOf(config.insertionMarker);
                if (insertPos === -1) {
                    deferred.reject('Unable to locate deck insertion marker.');
                    return;
                }
                content = content.substr(0, insertPos) + deckRow(entry) + content.substr(insertPos);
                wikiApiCall({
                    minor: 'yes',
                    summary: editSummary(entry),
                    action: 'edit',
                    title: config.decklist,
                    basetimestamp: page.revisions[0].timestamp,
                    startimestamp: page.starttimestamp,
                    token: page.edittoken,
                    watchlist: 'unwatch',
                    text: content,
                }, 'POST').then(function (data) {
                    if (data.error) {
                        deferred.reject(data.error.code === 'editconflict' ? 'editconflict' : data.error.info);
                    } else if (data.edit.result !== 'Success') {
                        deferred.reject(data.edit.result);
                    } else {
                        deferred.resolve();
                    }
                }).fail(function (xhr, status, statusText) {
                    console.error(xhr);
                    deferred.reject('addToDecklists ' + statusText);
                });
            }).fail(function (xhr, status, statusText) {
                console.error(xhr);
                deferred.reject('addToDecklists ' + statusText);
            });
        });

        return deferred.promise();
    }

    function extractDeckColors(colors, data) {
        data.forEach(function (card) {
            if (card.colors) {
                card.colors.forEach(function (color) {
                    if (!colors.includes(color))
                        colors.push(color);
                });
            }
        });
    }

    function extractJson(id, contents) {
        var invalidDeckException = 'Invalid deck';
        var start = '<pre id="$1"'.replace('$1', id);
        var startPos = contents.indexOf(start);
        if (startPos === -1) throw invalidDeckException;
        startPos = contents.indexOf('>', startPos + 1) + 1;
        if (startPos === -1) throw invalidDeckException;
        var endPos = contents.indexOf('</pre>', startPos);
        if (endPos === -1) throw invalidDeckException;
        return contents.substring(startPos, endPos);
    }

    function getDeckData(title) {
        var deferred = $.Deferred();

        $.get(mw.util.getUrl('Decks/' + title)).done(function (data) {
            if (data.indexOf('<div class="page-header__subtitle">Redirected from <a') !== -1) {
                deferred.reject('redirected');
            } else {
                try {
                    var deckJson = JSON.parse(extractJson('mdw-chartdata-pre', data));
                    var sideboardJson = JSON.parse(extractJson('mdw-sideboard-data', data));
                    var colors = [];
                    extractDeckColors(colors, deckJson);
                    extractDeckColors(colors, sideboardJson);
                    deferred.resolve({
                        colors: colors,
                        hasSideboard: sideboardJson.length > 0
                    });
                } catch (error) {
                    if (data.indexOf('class="redirectMsg"') !== -1)
                        deferred.reject('redirected');
                    else
                        deferred.reject('baddeck');
                }
            }
        }).fail(function (xhr, status, statusText) {
            console.error(xhr);
            deferred.reject('Failed to obtain deck colors from ' + title + '. Reason: ' + statusText);
        }) ;

        return deferred.promise();
    }

    function setAuthor() {
        var loggedUser = mw.config.get('wgUserName');
        if (loggedUser) {
            $('#mdw-dle-author').val(loggedUser);
        } else {
            $('#mdw-dle-author').val('Anonymous');
        }
    }

    function tickColors(colors) {
        $('#mdw-dle-colors>input').prop('checked', false);
        colors.forEach(function (color) {
            var id = '#mdw-dle-' + color.toLowerCase();
            $(id).prop('checked', true);
        });
    }

    function resetForm() {
        var form = $('#mdw-mainform');
        form.find('.mdw-error').html('');
        form.find('input[type="text"]').val('');
        document.getElementById('mdw-dle-typeselect').selectedIndex = 0;
        hideUserPopup();
    }

    function selectDeck() {
        /* jshint -W040 */ // allow old school jquery use of this
        $('#mdw-mainform').hide();
        $('.mdw-dle-errordiv').hide();
        resetForm();
        var deck = this.options[this.selectedIndex].innerText;
        showWorking();
        getDeckData(deck).done(function (deckData) {
            hideWorking();
            $('#mdw-dle-name').val(deck);
            setAuthor();
            tickColors(deckData.colors);
            $('#mdw-view-deck').html(
                $('<a target="_blank">View Deck</a>').attr('href', mw.util.getUrl('Decks/' + deck))
            );
            $('#mdw-dle-sideboard').prop('checked', deckData.hasSideboard);
            $('#mdw-mainform').fadeIn(400);
            $('#mdw-dle-name').focus();
        }).fail(function (reason) {
            hideWorking();
            if (reason === 'baddeck' || reason === 'redirected')
                $('#mdw-dle-' + reason).fadeIn(400);
            else
                fatalError(reason);
        });
    }

    function selectType() {
        /* jshint -W040 */ // allow old school jquery use of this
        $('#mdw-dle-type').val(this.options[this.selectedIndex].text);
    }

    function clickUser(event) {
        var text = $(event.target).text();
        $('#mdw-dle-author').val(text);
        $('#mdw-dle-userpopup').css('visibility', 'hidden');
    }

    function allowInvalidChars() {
        if (config.allowInvalidChars === 'never')
            return false;
        if (config.allowInvalidChars === 'always')
            return true;
        var user = mw.config.get('wgUserName');
        if (!user)
            return false;
        return config.trustedEditors.includes(user);
    }

    function validateTextField(name, value) {
        if (value === '') {
            $('#mdw-dle-error-' + name).html('* A value is required.');
            return false;
        }
        if (!allowInvalidChars() && /\{|\}|\|/.test(value)) {
            $('#mdw-dle-error-' + name).html('* Must not contain the characters {, } or |');
            return false;
        }
        return true;
    }

    function validate(values) {
        $('.mdw-error').html('');
        var name = validateTextField('name', values.name);
        var type = validateTextField('type', values.type);
        var author = validateTextField('author', values.author);
        var desc = validateTextField('desc', values.desc);
        return name && type && author && desc;
    }

    function getColors() {
        var colors = '';
        $('#mdw-dle-colors>input:checked').each(function () {
            colors += $(this).val();
        });
        return colors;
    }

    function getValues() {
        var values = {};
        values.link = $('#mdw-dle-deckselect>option:selected').text();
        values.name = $('#mdw-dle-name').val();
        values.type = $('#mdw-dle-type').val();
        values.author = $('#mdw-dle-author').val();
        values.desc = $('#mdw-dle-desc').val();
        values.colors = getColors();
        values.sideboard = $('#mdw-dle-sideboard').prop('checked');
        return values;
    }

    function redirectToDeckLists() {
        var url = mw.config.get('wgArticlePath').replace('$1', config.decklist);
        window.location = url;
    }

    function clickAddToDecklists() {
        /* jshint -W040 */ // allow old school jquery use of this
        $('.mdw-dle-errordiv').hide();
        var values = getValues();
        if (!validate(values)) {
            $('#mdw-dle-error').html('Please correct the errors above and try again');
            return;
        }
        var button = $(this);
        button.prop('disabled', true);
        showWorking();
        addToDecklists(values)
            .done(redirectToDeckLists)
            .fail(function (reason) {
                hideWorking();
                if (reason === 'editconflict') {
                    button.prop('disabled', false);
                    $('#mdw-dle-editconflict').fadeIn(400);
                } else {
                    fatalError(reason);
                }
            });
    }

    function createType() {
        var type = $('#mdw-dle-type-span');
        type.html('<input type="text" id="mdw-dle-type" size="10" placeholder="Type/Strategy" maxlength="20"/>');
        var commonTypes = type.attr('data-types');
        if (commonTypes) {
            var entries = commonTypes.split(';');
            if (entries.length > 0) {
                var select = $('<select id="mdw-dle-typeselect">')
                    .append($('<option disabled selected>Select type --</option>'))
                    .change(selectType)
                    .focus(hideUserPopup);
                entries.forEach(function (entry) {
                    select.append($('<option>').text(entry));
                });
                type.append('&nbsp;').append(select);
            }
        }
    }

    function createMainForm() {
        /*jshint -W043 */ // allow multiline string escaping
        $('#mdw-dle-name-span')
            .html('<input type="text" id="mdw-dle-name" size="40" placeholder="Deck name" maxlength="255"/>');
        var author = $('<input type="text" id="mdw-dle-author" size="20" placeholder="Author" maxlength="255"/>')
            .on('input', getUserLinks);
            // .focusout(hideUserPopup);
        $('#mdw-dle-author-span').html(author);
        $('#mdw-dle-usermenu').click(clickUser);
        $('#mdw-dle-desc-span')
            .html('<input type="text" id="mdw-dle-desc" size="50" placeholder="Description" maxlength="255"/>');
        $('#mdw-dle-colors')
            .html('<label><input type="checkbox" id="mdw-dle-white" value="{{W}}" />White</label>&nbsp;&nbsp;\
                   <label><input type="checkbox" id="mdw-dle-blue" value="{{U}}" />Blue</label>&nbsp;&nbsp;\
                   <label><input type="checkbox" id="mdw-dle-black" value="{{B}}" />Black</label>&nbsp;&nbsp;\
                   <label><input type="checkbox" id="mdw-dle-red" value="{{R}}" />Red</label>&nbsp;&nbsp;\
                   <label><input type="checkbox" id="mdw-dle-green" value="{{G}}" />Green</label>&nbsp;&nbsp;\
                   <label><input type="checkbox" id="mdw-dle-colorless" value="{{C}}" />Colorless</label>');
        createType();
        $('#mdw-dle-sideboard-span')
            .html('<label><input type="checkbox" id="mdw-dle-sideboard" />Deck has sideboard</label>');
        var button = $('<input type="button" id="mdw-dle-addtolist" value="Add to deck list" />')
            .click(clickAddToDecklists);
        $('#mdw-dle-update-span').html(button);
        $('#mdw-mainform input:not(#mdw-dle-author)').focus(hideUserPopup);
    }


    function initialize() {
        var configError = initConfig();
        if (configError) {
            $('#mdw-dle-editor').html('<span class="mdw-error">Configuration error:' + configError + '</span>');
            return;
        }
        $('#mdw-working').html($('<img>', {
            src: mw.config.get('stylepath') + '/common/images/ajax.gif'
        }));
        if (config.allowInvalidChars === 'trusted') {
            getTrustedEditors(); //deliberate fire and forget, no big deal if it fails
        }
        createMainForm();
        showWorking();
        getDecklistsDecks().done(function (decklistDecks) {
            getDeletionCandidateDecks().done(function (ignoredDecks) {
                addIgnoredDecks(ignoredDecks);
                getUnlistedDecks(decklistDecks, config.filter, ignoredDecks).done(function (unlistedDecks) {
                    unlistedDecks.sort(new Intl.Collator('en', { sensitivity: 'base' }).compare);
                    var select = $('<select id="mdw-dle-deckselect">')
                        .append($('<option disabled selected>Select deck to add --</option>'))
                        .change(selectDeck);
                    unlistedDecks.forEach(function (deck) {
                        select.append($('<option>').text(deck));
                    });
                    $('#mdw-deck-select').html(select);
                    $('#mdw-deck-select-div').fadeIn(500);
                    hideWorking();
                }).fail(fatalError);
            });
        }).fail(fatalError);
    }

    $(document).ready(initialize);

}(jQuery));
