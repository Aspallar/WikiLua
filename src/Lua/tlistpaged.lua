local wikienv = require("wikienv")
local cards = require("wikia\\cards")

local function PrintPage(pageNumber)
	print("PAGE " .. pageNumber)
	print("============================================================")
end

local result = cards.GetPagedCardsTable(wikienv.MakeUpstreamFrame(nil, {}, "Cards/1"))

PrintPage(1)
print(result)

result = cards.GetPagedCardsTable(wikienv.MakeUpstreamFrame(nil, {}, "Cards/2"))

PrintPage(2)
print(result)
