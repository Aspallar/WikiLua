mw.hook('wikipage.content').add(function($content) {
    console.log('one');
    if ($content.selector === '#mw-content-text') {
        console.log('two');
        var openInNewTab = $content.find('.mdw-newtab');
        if (openInNewTab.length > 0)
            openInNewTab.find('a').attr('target', '_blank');
    }
});
