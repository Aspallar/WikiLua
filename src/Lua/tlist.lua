local wikienv = require("wikienv")
local cards = require("wikia\\cards")
local result = cards.GetCardsTable(wikienv.MakeUpstreamFrame({"TextMatches$^Companion"}))
print(result)
