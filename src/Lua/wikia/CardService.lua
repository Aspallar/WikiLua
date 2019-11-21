local utils = require("Module:TemplateUtils")

local p = {}

local cards = utils.RecreateTable(mw.loadData("Module:Data/Cards"))
local totalCards = #cards

local gsub, match, find, lower, upper = string.gsub, string.match, string.find, string.lower, string.upper

local function CaseInsensitivePattern(s)
    s = gsub(s, "%-", "%%-")
    s = gsub(s, "%a", function (c) return string.format("[%s%s]", lower(c), upper(c)) end)
    return s
end

local GetOtherCards
do
    local otherCards = nil
    GetOtherCards = function()
        if otherCards == nil then
            otherCards = utils.RecreateTable(mw.loadData("Module:Data/OtherCards"))
        end
        return otherCards
    end
end

local function Contains(t, item)
    if not t or not item then return false end
    for _, v in pairs(t) do
        if v == item then return true end
    end
    return false
end

local criteriaList = {
    -- condition ∈ {White,Blue,Black,Red,Green}
    Color = function(card,condition)
        return Contains(card.Colors, condition)
    end;
    -- condition ∈ {true,false}
    Colorless = function(card, condition)
        return (card.Colors == nil) == condition
    end;
    -- condition ∈ {true,false}
    Multicolor = function(card, condition)
        return (card.Colors ~= nil and #utils.RecreateTable(card.Colors) >= 2) == condition
    end;
    -- condition ∈ {Any Type, Subtype or Supertype} See their respective wiki pages for an exhaustive list
    Type = function(card, condition)
        return Contains(card.Types, condition) or
            Contains(card.SubTypes, condition) or
            Contains(card.SuperTypes, condition)
    end;
    -- condition ∈ {Any set code}
    Set = function(card, condition)
        return (card.SetCode == condition) or (Contains(card.Allsets, condition))
    end;
    -- condition ∈ {Common,Uncommon,Rare,Mythic Rare}
    Rarity = function(card, condition)
        return (card.Rarity == condition) or (Contains(card.Rarities, condition))
    end;
    -- condition ∈ {Any text}
    Text = function(card, condition)
        return card.Text ~= nil and find(lower(card.Text), condition)
    end;
    NotText = function(card, condition)
        return card.Text == nil or not find(lower(card.Text), condition)
    end;
    -- condition ∈ {Any number}
    CMC = function(card, condition) return
        (card.cmc or 0) - condition == 0
    end;
    -- condition ∈ {Any number}
    MinCMC =  function(card, condition)
        return (card.cmc or 0) - condition >= 0
    end;
    -- condition ∈ {Type}
    NotType = function(card, condition)
        return not Contains(card.Types, condition)
    end;
    Energy = function(card)
        return card.Text ~= nil and find(card.Text, "{{E}}")
    end;
    -- condition ∈ {Lua Pattern}
    NameMatches = function(card, condition)
        return match(card.Name, condition)
    end;
    -- condition ∈ {true,false}
    Standard = function(card, condition)
        return p.IsStandard(card) == condition
    end;
}

local function PrepareCriteria(criteria)
    local prepared = {}
    if criteria then
        for i = 1, #criteria do
            local func, cond = string.match(criteria[i], "(.-)$(.+)")
            assert(func and criteriaList[func] and cond, "Invalid card criteria. " .. criteria[i])
            if func == "Text" or func == "NotText" then
                cond = lower(cond)
            elseif func == "Colorless" or func == "Multicolor" or func == "Standard" then
                cond = cond == "true"
            end
            table.insert(prepared, {test = criteriaList[func], condition = cond})
        end
    end
    return #prepared > 0 and prepared or nil
end

local function MeetsCriteria(card, criteria)
    if criteria then
        for _, criterion in ipairs(criteria) do
            if not criterion.test(card, criterion.condition) then return false end
        end
    end
    return true
end

-- TODO: the card data is pre-sorted, use a binary chop for searches
-- Note unfortunately the pre-sorted order is not the same as the lua sort order

function p.GetByNameIgnoreCase(name)
    name = "^" .. CaseInsensitivePattern(name) .. "$"
    for i = 1, totalCards do
       if match(cards[i].Name, name) then
           local foundCard = utils.MakeTableWriteable(cards[i])
           foundCard.Playable = true
           return foundCard
       end
    end
    local otherCards = GetOtherCards()
    for i = 1, #otherCards do
       if match(otherCards[i].Name, name) then
           local foundOtherCard = utils.MakeTableWriteable(otherCards[i]);
           foundOtherCard.Playable = false
           return foundOtherCard
       end
    end
end

function p.GetByName(name)
    for i = 1, totalCards do
        if cards[i].Name == name then return cards[i] end
    end
end

function p.GetOtherByName(name)
    local otherCards = GetOtherCards()
    for i = 1, #otherCards do
        if otherCards[i].Name == name then return otherCards[i] end
    end
end

function p.GetByNumber(cardnumber)
    for i = 1, totalCards do
        if cards[i].CardNumber == cardnumber then return cards[i] end
    end
end

function p.GetOtherByNumber(cardnumber)
    local otherCards = GetOtherCards()
    for i = 1, #otherCards do
        if otherCards[i].CardNumber == cardnumber then return otherCards[i] end
    end
end

function p.GetByCriteria(criteria)
    local current = 1
    criteria = PrepareCriteria(criteria)
    return function()
        while current <= totalCards do
            local card = cards[current]
            current = current + 1
            if MeetsCriteria(card, criteria) then return card end
        end
    end
end

function p.GetOtherByCriteria(criteria)
    local current = 1
    local otherCards = GetOtherCards()
    local total = #otherCards
    criteria = PrepareCriteria(criteria)
    return function()
        while current <= total do
            local card = otherCards[current]
            current = current + 1
            if MeetsCriteria(card, criteria) then return card end
        end
    end
end

function p.IsStandard(card)
    local set = card.SetCode
    return set == "GRN" or set == "RNA" or set == "WAR"
        or set == "M20" or set == "ELD" or set == "ANA"
end

return p
