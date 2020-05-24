// <nowiki>
(function () {
    /*global mw */
    'use strict';

    function error(msg) {
        return $('<span>', {class: 'mdw-error', text: msg}).after('<br>');
    }

    function createTemplates(setCode, iconSize, status, suffixes) {
        var api, editToken,
            template = '[[File:{1}.png|{2}px|link=]]<noinclude>[[Category:Icon templates]] [[Category:Set Icons]]</noinclude>',
            summary = 'Set icon template for ' + setCode;

        function create() {
            var templateName, title, imageName, content, suffix = suffixes.shift();

            templateName = setCode + suffix;
            title = 'Template:' + templateName;
            imageName = setCode + (suffix === 'B' ? 'C' : suffix);
            content = template.replace('{1}', imageName).replace('{2}', iconSize);
            api.post({
                action: 'edit',
                summary: summary,
                title: title,
                text: content,
                token: editToken
            }).done(function (res) {
                if (res.error)
                    status.append(error(templateName + ' (' + res.error.code + ')'));
                else
                    status.append($('<span>').text(templateName + ' (' + res.edit.result + ')')).append('<br>');
                if (suffixes.length > 0)
                    setTimeout(create, 500);
            }).fail(function () {
                status.append(error('Network Error'));
            });
        }

        mw.loader.using('mediawiki.api', function () {
            api = new mw.Api();
            editToken = mw.user.tokens.get('editToken');
            setTimeout(create, 50);
        });
    }

    function createTemplateClick() {
        var ok = true,
            status = $('#mdw-askset-status'),
            setCode = $('#mdw-askset-setcode').val().trim().toUpperCase(),
            iconSize = $('#mdw-askset-iconsize').val().trim(),
            suffixes =  $.map($('#mdw-askset-rarity input:checked'), function (e) {
                return $(e).val();
            });

        status.empty();
        if (setCode.length === 0) {
            status.append(error('Set must be supplied'));
            ok = false;
        }

        if (iconSize.length === 0) {
            status.append(error('Size must be supplied'));
            ok = false;
        } else if (!/^\d+$/.test(iconSize)) {
            status.append(error('Size must be a number'));
            ok = false;
        }
        
        if (suffixes.length === 0) {
            status.append(error('Must check at least 1 rarity'));
            ok = false;
        }
        
        if (ok) 
            createTemplates(setCode, iconSize, status, suffixes);
    }

    function rarityCheckbox(code) {
        return $('<label>').append(
            $('<input>', {type: 'checkbox', value: code, checked: true})
        ).append(code).after(' &nbsp;&nbsp;');
    }

    function setTemplates(event) {
        /*jshint -W043 */
        var form = $('<table>\
<tr>\
<td>Set</td>\
<td><input type="text" id="mdw-askset-setcode" class="mdw-askset-input"/></td>\
</tr>\
<tr>\
<td>Size</td>\
<td><input type="text" id="mdw-askset-iconsize" class="mdw-askset-input"/> px</td>\
</tr>\
<tr><td id="mdw-askset-rarity" colspan="2"></td></tr>\
</table>\
<hr>\
<div id="mdw-askset-status"></div>'), rarities = form.find('#mdw-askset-rarity');
        event.preventDefault();
        ['B', 'C', 'U', 'R', 'M'].forEach(function (c) { rarities.append(rarityCheckbox(c)); } );
        $.showCustomModal('Set Templates', form, {
            id: 'mdw-askset-dialog',
            width: 350,
            buttons: [
                {
                    message: 'Create',
                    defaultButton: true,
                    handler: createTemplateClick
                },
                {
                    message: 'Close',
                    defaultButton: true,
                    handler: function () {
                        $('#mdw-askset-dialog').closeModal();
                    }
                }
            ]
        });
    }

    $(function () {
        $('#my-tools-menu').prepend(
            $('<li>').append($('<a href="#">Set Templates</a>').click(setTemplates))
        );
    });

}());
