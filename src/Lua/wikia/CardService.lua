local utils = require("Module:TemplateUtils")

local p = {}

local cards = utils.RecreateTable(mw.loadData("Module:Data/Cards"))
local otherCards = utils.RecreateTable(mw.loadData("Module:Data/OtherCards"))

local totalNumberOfCards = #cards
local totalNumberOfOtherCards = #otherCards

function p.GetByNameIgnoreCase(name)
    -- TODO: the card data is pre-sorted, use a binary chop
    name = string.lower(name)
    for i = 1, totalNumberOfCards do
       if string.lower(cards[i].Name) == name then
           local foundCard = utils.MakeTableWriteable(cards[i])
           foundCard.Playable = true
           return foundCard
       end
    end
    for i = 1, totalNumberOfOtherCards do
       if string.lower(otherCards[i].Name) == name then 
           local foundOtherCard = utils.MakeTableWriteable(otherCards[i]);
           foundOtherCard.Playable = false
           return foundOtherCard
       end
    end
end

return p
