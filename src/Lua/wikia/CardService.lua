local utils = require("Module:TemplateUtils")

local p = {}

local cards = utils.RecreateTable(mw.loadData("Module:Data/Cards"))
local otherCards = utils.RecreateTable(mw.loadData("Module:Data/OtherCards"))

local totalNumberOfCards = #cards
local totalNumberOfOtherCards = #otherCards

local function TableContains(t,item)
    if(not t) or (not item) then return false end
    for _,v in pairs(t) do
        if v == item then
            return true
        end
    end
    return false
end

local criteriaList = {
    -- condition ∈ {White,Blue,Black,Red,Green}
    Color = function(card,condition) return TableContains(card.Colors,condition) end;
    -- condition ∈ {true,false}
    Colorless = function(card,condition) return (card.Colors == nil) == (condition=="true") end;
    Multicolor = function(card,condition) return ((card.Colors ~= nil) and (#utils.RecreateTable(card.Colors) >= 2)) == (condition=="true") end;
    -- condition ∈ {Any Type, Subtype or Supertype} See their respective wiki pages for an exhaustive list
    Type = function(card,condition) return (TableContains(card.Types,condition) or TableContains(card.SubTypes,condition) or TableContains(card.SuperTypes,condition)) end;
    -- condition ∈ {D,ORI}
    -- Set = function(card,condition) return (card.SetCode == condition) or (setNames[card.SetCode] == condition) end;
    Set = function(card,condition) return (card.SetCode == condition) or (TableContains(card.Allsets, condition)) end;
    -- condition ∈ {Common,Uncommon,Rare,Mythic Rare}
    -- Rarity = function(card,condition) return card.Rarity == condition end;
    Rarity = function(card,condition) return (card.Rarity == condition) or (TableContains(card.Rarities, condition)) end;
    -- condition ∈ {Any text}
    Text = function(card,condition) return card.Text ~= nil and string.find(string.lower(card.Text),string.lower(condition)) end;
    NotText = function(card,condition) return card.Text == nil or not string.find(string.lower(card.Text),string.lower(condition)) end;
    -- condition ∈ {Any number}
    CMC = function(card,condition) return (card.cmc or 0) - condition == 0 end;
    -- condition ∈ {Any number}
    MinCMC =  function(card,condition) return (card.cmc or 0) - condition >= 0 end;
    -- condition ∈ {Type}
    NotType = function(card,condition) return not TableContains(card.Types,condition) end;
    Energy = function(card) return card.Text ~= nil and string.find(card.Text, "{{E}}") end;
}

local function MeetsCriteria(card, criteria)
    if criteria and (#criteria > 0) then
        for _, criterion in pairs(criteria) do
            local func, cond = unpack(mw.text.split(criterion, "$", true))
            if not criteriaList[func](card, cond) then return false end
        end
    end
    return true
end

-- TODO: the card data is pre-sorted, use a binary chop for searches

function p.GetByNameIgnoreCase(name)
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

function p.GetByName(name)
    for i = 1, totalNumberOfCards do
        if cards[i].Name == name then return cards[i] end
    end
end

function p.GetOtherByName(name)
    for i = 1, totalNumberOfOtherCards do
        if otherCards[i].Name == name then return otherCards[i] end
    end
end

function p.GetByNumber(cardnumber)
    for i = 1, totalNumberOfCards do
        if cards[i].CardNumber == cardnumber then return cards[i] end
    end
end

function p.GetByCriteria(criteria)
    local current = 1
    return function()
        while current <= totalNumberOfCards do
            local card = cards[current]
            current = current + 1
            if (MeetsCriteria(card, criteria)) then return card end
        end
    end
end

return p
