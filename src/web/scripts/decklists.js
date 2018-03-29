(function ($) {

    // just for "fun" 'cause I was bored
    
    var interval = null;
    var manaImages = [];

    function start() {
        animate();
        return setInterval(animate, 300);
    }

    function stop() {
        clearInterval(interval);
        return null;
    }

    function animate() {
        manaImages.forEach(function (images) {
            var firstSrc = images[0].getAttribute('src');
            for (var k = 0; k < images.length - 1; k++) {
                var nextSrc =  images[k + 1].getAttribute('src');
                images[k].setAttribute('src', nextSrc);
            }
            images[images.length - 1].setAttribute('src', firstSrc);
        });
    }

    function initialize() {
        $('.mdw-decklist td:nth-child(3)').each(function () {
            var images = $(this).find("img");
            if (images.length > 1)
                manaImages.push(images);
        });
        $('#animate').click(function () {
            interval = interval === null ? start() : stop();
        });
    }

    $(initialize)

}(jQuery));
