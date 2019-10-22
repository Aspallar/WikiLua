require("wikienv")
local decks = require("wikia\\decks")
local inputList = [=[
Commander
Nicol Bolas, Dragon-God

Deck
1 Consign /// Oblivion (HOU) 149
4 Rekindling Phoenix (RIX) 111
20 Mountain (RIX) 195
]=]

local result = decks.TestGenerateDeckFromList("Test Deck", inputList, nil, "")
print(result)
