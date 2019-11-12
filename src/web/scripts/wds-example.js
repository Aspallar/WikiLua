$('<div>', {
    class: 'wds-dialog__curtain'
}).append(
    $('<div>', {
        class: 'wds-dialog__wrapper'
    }).append(
        $('<div>', {
        class: 'wds-dialog__title',
                text: 'Dialog title'
        }),
        $('<div>', {
            class: 'wds-dialog__content',
            text: 'Dialog content'
        }),
        $('<div>', {
            class: 'wds-dialog__actions'
        }).append(
            $('<button>', {
                class: 'wds-button wds-is-text wds-dialog__actions-button',
                text: 'Cancel',
                     click: function() {
                    console.info('Cancel button has been clicked.');
                    $('.wds-dialog__curtain').remove();
                }
            }),
            $('<button>', {
                class: 'wds-button wds-is-text wds-dialog__actions-button',
                text: 'OK',
                click: function() {
                    console.info('OK button has been clicked.');
                    $('.wds-dialog__curtain').remove();
                }
            })
        )
    )
).appendTo('#WikiaPage');
