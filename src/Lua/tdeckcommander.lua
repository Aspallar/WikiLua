require("wikienv")
local decks = require("wikia\\decks")
local inputList = [=[
1 Consign /// Oblivion (HOU) 149
4 Rekindling Phoenix (RIX) 111
20 Mountain (RIX) 195
]=]

local result = decks.TestGenerateDeckFromList("Test Deck", inputList, nil, "Nicol Bolas, Dragon-God")
print(result)

