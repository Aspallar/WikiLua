// ==========================================================================
// Start: Sample Hand
// Implements sample hand generation for deck articles
// Version 1.2.0
// Author: Aspallar
//
// ** Please dont edit this code directly in the wikia.
// ** Instead use the git repository https://github.com/Aspallar/WikiLua
// ** this file is the sampleHand.js file in the src\Web\wikiscripts folder.
//
(function ($) {
    'use strict';

    // do nothing on articles with no random hand
    if (document.getElementById('mdw-random-hand') === null) {
        return;
    }

    function cardArticle(cardName) {
        var article = encodeURIComponent(cardName.replace(' ', '_'));
        return '/wiki/' + article;
    }

    function adjustName(name) {
        var pos = name.indexOf('///');
        return pos === -1 ? name : name.substring(0, pos-1);
    }

    function DeckEntry(name) {
        this.name = name;
        this.available = true;
    }

    function Deck() {
        this.cards = []; // array of DeckEntry
        this.cardsLeft = 0;
    }

    Deck.prototype = {
        constructor: Deck,
        shuffle: function () {
            this.cards.forEach(function (card) {
                card.available = true;
            });
            this.cardsLeft = this.cards.length;
            return this;
        },
        drawCard: function () {
            var randomAvailable = Math.floor(Math.random() * this.cardsLeft);
            var availableCount = 0;
            for (var k = 0, l = this.cards.length; k < l; k++) {
                var card = this.cards[k];
                if (card.available) {
                    if (availableCount === randomAvailable) {
                        --this.cardsLeft;
                        card.available = false;
                        return card;
                    }
                    ++availableCount;
                }
            }
        },
        drawCards: function (numCards) {
            var cards = [];
            for (var k = 0; k < numCards; k++)
                cards.push(this.drawCard());
            return cards;
        },
        initialize: function (dataString) {
            var deck = [];
            try {
                var data = JSON.parse(dataString);
                data.forEach(function (entry) {
                    var adjustedName = adjustName(entry.name);
                    for (var k = 0; k < entry.num; k++)
                        deck.push(new DeckEntry(adjustedName));
                });
            } catch (error) {
                console.log('sampleHand.js Deck:init() error parsing deck data\n' + error);
            }
            this.cards = deck;
            this.cardsLeft = deck.length;
            return this;
        }
    }; // End Deck

    function ImageSource() {
        var sourceCache = {};

        function apiParseCommandUrl(cardName) {
            var url = '/api.php?format=json&action=parse&disablepp=true&prop=text&text=%5B%5BFile%3A[[cardname]].png%7Csize%3D160px%7Clink%3D%5D%5D';
            url = url.replace('[[cardname]]', encodeURIComponent(cardName));
            return url;
        }

        return {
            setCardImageSource: function (img, cardName) {
                var imageSource = sourceCache[cardName];
                if (imageSource !== undefined) {
                    img.attr('src', imageSource);
                    return;
                }
                var parseUrl = apiParseCommandUrl(cardName);
                $.getJSON(parseUrl, function (data) {
                    var text = data.parse.text['*'];
                    var sourceMatch = /src\s*=\s*"([^"]+)"/.exec(text);
                    sourceCache[cardName] = sourceMatch[1];
                    img.attr('src', sourceMatch[1]);
                });
            }
        };
    } // End ImageSource

    function CardPanel(container, tooltip, imageSource) {
        var cardSize = {
            small: true,
            fullWidth: 223,
            fullHeight: 311,
            width: Math.floor(223 * 0.5),
            height: Math.floor(311 * 0.5),
            scale: function (percent) {
                var factor = percent / 100;
                this.width = Math.floor(this.fullWidth * factor);
                this.height = Math.floor(this.fullHeight * factor);
            }
        };

        function setTooltip(img) {
            if (cardSize.small) {
                img.mousemove(function (event) {
                    var spaceOnRight = window.innerWidth - event.pageX;
                    var xdelta = spaceOnRight > cardSize.fullWidth + 5 ? 20 : -cardSize.fullWidth - 20;
                    var left = event.pageX + xdelta;
                    var top = event.pageY - 240;
                    tooltip.css({ top: top, left: left }).show();
                }).mouseout(function () {
                    tooltip.hide();
                }).mouseenter(function () {
                    tooltip.attr('src', $(this).attr('src'));
                });
            } else {
                img.off('mousemove mouseout mouseenter');
            }
        }

        function createCard(cardName) {
            var link = $('<a href="' + cardArticle(cardName) + '" target="_blank"><img /></a>');
            var img = link.find('img').attr('width', cardSize.width).attr('height', cardSize.height);
            setTooltip(img);
            imageSource.setCardImageSource(img, cardName);
            return link;
        }

        function update() {
            var images = container.find('img');
            images.each(function () {
                var $this = $(this);
                $this.attr('width', cardSize.width).attr('height', cardSize.height);
                setTooltip($this);
            });
        }

        return {
            add: function (card) {
                container.prepend(createCard(card.name));
            },
            addAll: function (cards) {
                var cardElements = document.createDocumentFragment();
                cards.forEach(function (card) {
                    var img = createCard(card.name);
                    cardElements.appendChild(img.get(0));
                });
                container.html(cardElements);
            },
            clear: function () {
                container.html('');
                container.addClass('mdw-hidden');
            },
            small: function () {
                return cardSize.small;
            },
            toggleSize: function () {
                cardSize.small = !cardSize.small;
                cardSize.scale(cardSize.small ? 50 : 100);
                update();
            },
            show : function () {
                container.removeClass('mdw-hidden');
            }
        };
    } // End CardPanel

    function Controller(cardPanel, deck) {
        var randomHandButton = $('#mdw-random-hand-button');
        var imageSizeButton = $('#mdw-random-hand-image-size');
        var drawCardButton = $('#mdw-random-hand-draw-card');
        var clearButton = $('#mdw-random-hand-clear');
        var handOnlyButtons = $(imageSizeButton).add(drawCardButton).add(clearButton);

        function showMessage(msg) {
            $('#mdw-random-hand-message').text(msg);
        }

        function setRandomHandButtonText(haveHand) {
            var text = haveHand ? 'New Hand' : 'Draw Sample Hand';
            randomHandButton.attr('value', text);
        }

        function setImageSizeButtonText() {
            var text = cardPanel.small() ? 'Large Images' : 'Small Images';
            imageSizeButton.attr('value', text);
        }

        function updateUi() {
            if (deck.cards.length < 7) {
                showMessage('There must be at least 7 cards in a deck for a sample hand.');
                randomHandButton.prop('disabled', true);
                return;
            }
            if (deck.cardsLeft === 0) {
                showMessage('The library is empty.');
                drawCardButton.prop('disabled', true);
                return;
            }
            showMessage('');
            drawCardButton.prop('disabled', false);
        }

        function showHandOnlyButtons(show) {
            if (show)
                handOnlyButtons.removeClass('mdw-hidden');
            else
                handOnlyButtons.addClass('mdw-hidden');
        }

        function imageSizeButtonClick() {
            cardPanel.toggleSize();
            setImageSizeButtonText();
        }

        function drawCardClick() {
            cardPanel.add(deck.drawCard());
            updateUi();
        }

        function clearClick() {
            cardPanel.clear();
            deck.shuffle();
            showHandOnlyButtons(false);
            setRandomHandButtonText(false);
            updateUi();
        }

        function randomHandClick() {
            var hand = deck.shuffle().drawCards(7);
            cardPanel.addAll(hand);
            cardPanel.show();
            setRandomHandButtonText(true);
            setImageSizeButtonText();
            showHandOnlyButtons(true);
            updateUi();
        }

        function wireButtonEvents() {
            randomHandButton.click(randomHandClick);
            imageSizeButton.click(imageSizeButtonClick);
            drawCardButton.click(drawCardClick);
            clearButton.click(clearClick);
        }

        return {
            start: function () {
                setRandomHandButtonText(false);
                wireButtonEvents();
                updateUi();
                return this;
            }
        };
    } // End: Controller
    
    function tooltipElement() {
        return $('<img id="mdw-card-hover" class="mdw-card-hover" />').prependTo('body');
    }

    function cardSection() {
        var sampleHandDiv = $('<div id="mdw-random-hand" class="mdw-hidden"></div>');
        var sampleHandContents = $(document.createDocumentFragment())
            .append('<input type="button" id="mdw-random-hand-button" value="Sample Hand" />&nbsp;')
            .append('<input type="button" id="mdw-random-hand-image-size" class="mdw-hidden" value="Large Images" />&nbsp;')
            .append('<input type="button" id="mdw-random-hand-draw-card" class="mdw-hidden" value="Draw Card" />&nbsp;')
            .append('<input type="button" id="mdw-random-hand-clear" class="mdw-hidden" value="Clear" />&nbsp;')
            .append('<span id="mdw-random-hand-message"></span>')
            .append(sampleHandDiv);
        $('#mdw-random-hand-section').html(sampleHandContents); 
        return sampleHandDiv;
    }

    var controller;
    $(document).ready(function () {
        var deck = new Deck().initialize($('#mdw-chartdata-pre').text());
        var cardPanel = new CardPanel(cardSection(), tooltipElement(), new ImageSource());
        controller = new Controller(cardPanel, deck).start();
    });
})(jQuery);
// End: Sample Hand
// ==========================================================================
