// <nowiki>
(function () {
    /*global mw */
    'use strict';

    function error(container, msg) {
        container.append($('<span>', {class: 'mdw-error', text: msg}).after('<br>'));
        return false;
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
                    error(status, templateName + ' (' + res.error.code + ')');
                else
                    status.append($('<span>').text(templateName + ' (' + res.edit.result + ')')).append('<br>');
                if (suffixes.length > 0)
                    setTimeout(create, 500);
            }).fail(function () {
                error(status, 'Network Error');
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
            status = $('#mdw-ctt-status'),
            setCode = $('#mdw-ctt-setcode').val().trim().toUpperCase(),
            iconSize = $('#mdw-ctt-iconsize').val().trim(),
            suffixes =  $.map($('#mdw-ctt-rarity input:checked'), function (e) {
                return $(e).val();
            });

        status.empty();
        if (setCode.length === 0)
            ok = error(status, 'Set must be supplied');

        if (iconSize.length === 0)
            ok = error(status, 'Size must be supplied');
        else if (!/^\d+$/.test(iconSize))
            ok = error(status, 'Size must be a number');
        
        if (suffixes.length === 0) 
            ok = error(status, 'Must check at least 1 rarity');
        
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
<td><input type="text" id="mdw-ctt-setcode" class="mdw-ctt-input"/></td>\
</tr>\
<tr>\
<td>Size</td>\
<td><input type="text" id="mdw-ctt-iconsize" class="mdw-ctt-input"/> px</td>\
</tr>\
<tr><td id="mdw-ctt-rarity" colspan="2"></td></tr>\
</table>\
<hr>\
<div id="mdw-ctt-status"></div>'), rarities = form.find('#mdw-ctt-rarity');
        event.preventDefault();
        ['B', 'C', 'U', 'R', 'M'].forEach(function (c) { rarities.append(rarityCheckbox(c)); } );
        $.showCustomModal('Set Templates', form, {
            id: 'mdw-ctt-dialog',
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
                        $('#mdw-ctt-dialog').closeModal();
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
