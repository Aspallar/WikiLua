require("wikienv")
local cards = require("wikia\\cards")
-- local result1 = cards.TestGetCardsTable({"Set$XLN"})
-- local result2 = cards.TestGetCardsTable({"Set$RIX"})
-- local result1 = cards.TestGetCardsTable({"Rarity$Common"})
-- local result2 = cards.TestGetCardsTable({"Rarity$Rare"})
local result = cards.TestGetCardsTable({"Type$Land"})
print(result)
