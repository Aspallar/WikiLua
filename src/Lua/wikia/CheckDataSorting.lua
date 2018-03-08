-- module to check whether or not the card data is sorted
-- alphabetically on name in the wiki environment.

-- ATM: they are **not**. Different colllation order used.
--      The sorting is done by a c= app running on windows

-- Means that a binary chop can't be used in Module:CardSrvice
-- until this problem is sorted (no pun intended).

-- This is meant to be run in the wiki debuger
-- Type -p.Run() in the console window.

local utils = require("Module:TemplateUtils")

local p = {}

local cards = utils.RecreateTable(mw.loadData("Module:Data/Cards"))
local otherCards = utils.RecreateTable(mw.loadData("Module:Data/OtherCards"))

local function CheckOrder(data)
	for i = 1, #data - 1 do
		if cards[i].Name > cards[i + 1].Name then
			mw.log("Failed on|" .. cards[i].Name .. "|" .. cards[i+1].Name)
		end
	end
end

function p.Run()
    mw.log("Data|Other Cards`")
    CheckOrder(otherCards)
    mw.log("Data|Cards")
    CheckOrder(cards)
end

return p

