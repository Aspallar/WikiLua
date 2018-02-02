require("wikienv")
local cards = require("cards")
local result = cards.TestGetCardsTable({"Type$Planeswalker", "Multicolor$false"})
print(result)
