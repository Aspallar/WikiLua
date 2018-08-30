require("wikienv")
local cards = require("wikia\\cards")
-- local result = cards.TestGetCardsTable({"Set$XLN"})
-- local result = cards.TestGetCardsTable({"Set$RIX"})
-- local result = cards.TestGetCardsTable({"Rarity$Common"})
-- local result = cards.TestGetCardsTable({"Rarity$Rare"})
-- local result = cards.TestGetCardsTable({"Type$Land", "NameMatches$^F"})
-- local result = cards.TestGetCardsTable({"NameMatches$Guide$"})
-- local result = cards.TestGetCardsTable({"NameMatches$"})
-- local result = cards.TestGetCardsTable({})
local result = cards.TestGetCardsTable({"Text$energy"})

print(result)


