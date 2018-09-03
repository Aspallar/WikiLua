require("wikienv")
local start, finish
local clock = os.clock
local cards = require("wikia\\cards2")
-- local result = cards.TestGetCardsTable({"Set$XLN"})
-- local result = cards.TestGetCardsTable({"Set$RIX"})
-- local result = cards.TestGetCardsTable({"Rarity$Common"})
-- local result = cards.TestGetCardsTable({"Rarity$Rare"})
-- local result = cards.TestGetCardsTable({"Type$Land", "NameMatches$^F"})
-- local result = cards.TestGetCardsTable({"NameMatches$Guide$"})
-- local result = cards.TestGetCardsTable({"NameMatches$"})
start = clock()
local result = cards.TestGetCardsTable(nil)
finish = clock()
-- local result = cards.TestGetCardsTable({"Text$energy"})

-- print(result)
print (finish - start)
