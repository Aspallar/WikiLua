require("wikienv")
local cards = require("wikia\\cards")
-- local result1 = cards.TestGetCardsTable({"Set$XLN"})
-- local result2 = cards.TestGetCardsTable({"Set$RIX"})
local result = -- cards.TestGetPagedCardsTable(nil, "Cards/1") ..
	cards.TestGetPagedCardsTable(nil, "Cards/4")
print(result)
