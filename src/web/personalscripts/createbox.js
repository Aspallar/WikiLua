// This failed. Useeditor parameter not suppted here, it does nothing
(function ($) {
    'use strict';
    console.log('Adding useeditor to createboxForm');
    var form = $('.createboxForm');
    console.dir(form);
    form.append('<input type="hidden" name="useeditor" value="source" />');
}(jQuery));