(function ($) {

    // just for "fun" 'cause I was bored
    
    var interval = null;

    $('#animate').click(function () {
        interval = interval === null ? start() : stop();
    });

    function start() {
        animate();
        return setInterval(animate, 700);
    }

    function stop() {
        clearInterval(interval);
        return null;
    }

    function animate() {
        $('.mdw-decklist td:nth-child(3)').each(function () {
            var images = $(this).find('img');
            if (images.length < 2) {
                return;
            }
            var firstSrc = $(images[0]).attr('src');
            for (var k = 0; k < images.length - 1; k++) {
                var nextSrc =  images[k+1].getAttribute('src');
                images[k].setAttribute('src', nextSrc);
            }
            images[images.length-1].setAttribute('src', firstSrc);
        });
    }

}(jQuery));
