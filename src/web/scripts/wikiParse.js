/* jshint -W098 */ // disable wikiParse is defined but never used
function wikiParse(contents) {
    'use strict';

    function replaceClearTemplates(contents) {
        return contents.replace(/{{Clear}}/g, '<div style="clear:both;"></div>');
    }

    function resolveLinks(contents) {
        return contents.replace(/\[\[(.*)\|(.*)\]\]/g, function (match, url, text) {
            return '<a href="http://magicarena.wikia.com/wiki/' + url + '">' + text + '</a>';
        });
    }

    function removeNoInclude(contents) {
        return contents.replace(/<noinclude>.*<\/noinclude>/g, '');
    }

    function replaceTitles(contents) {
        return contents.replace(/==(.*)==/g, function(match, titleText) {
            return '<h2>' + titleText + '</h2>';
        });
    }

    function removeVariables(contents) {
        contents = contents.replace(/__NOEDITSECTION__|__NOTOC__/g, '');
        return contents;
    }

    function replaceImages(contents) {
        return contents.replace(/\[\[File:(.*)\]\]/g, function(match, file) {
            return '<img src="images/' + file + '" />';
        });
    }

    contents = removeNoInclude(contents);
    contents = replaceClearTemplates(contents);
    contents = resolveLinks(contents);
    contents = replaceTitles(contents);
    contents = removeVariables(contents);
    contents = replaceImages(contents);

    return contents;
}
/* jshint +W098 */ //