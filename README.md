# WikiLua

Code for [Magic Arena Wiki](http://magicarena.wikia.com)

- Lua modules (src\lua\wikia)
- Client javascript (src\web\wikiscipts)
- Wikitext Templates (src\web\wikitemplates)
- Styles (src\web\wikicss)

Files outside these folders are support for running locally and are not deployed to the wiki.

## Deployment

#### Lua Modules

| File | Deploy to |
| ---- | ---- |
| Cards.lua | http://magicarena.wikia.com/wiki/Module:Cards |
| CardService.lua | http://magicarena.wikia.com/wiki/Module:CardService |
| Decks.lua | http://magicarena.wikia.com/wiki/Module:Decks |
| TemplateUtils.lua | http://magicarena.wikia.com/wiki/Module:TemplateUtils |

#### Wikitext Templates

**N.B.** The wikitext templates should be html minified before deployment as leading
whitespace is significant in wikitext.

| File | Deploy to |
| ---- | ---- |
| ArenaImport.html | http://magicarena.wikia.com/wiki/Template:ArenaImport |
| Deck.html | http://magicarena.wikia.com/wiki/Template:Deck |
| DeckCharts.html | http://magicarena.wikia.com/wiki/Template:DeckCharts |

#### Client javascript

| File | Deploy to |
| ---- | ---- |
| DeckExport.js | http://magicarena.wikia.com/wiki/MediaWiki:DeckExport.js |

#### Styles

| File | Deploy to |
| ---- | ---- |
| common.css | http://magicarena.wikia.com/wiki/MediaWiki:Common.css |

