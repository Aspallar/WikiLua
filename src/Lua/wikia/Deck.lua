local p = {}

local banned = {}
local hasMultiples = false
local numCardsInDeck = 0
local deckIsHistoric = false

p.Land = {}
p. Creature = {}
p.Artifact = {}
p.Enchantment = {}
p.Instant = {}
p.Sorcery = {}
p.Planeswalker = {}
p.Sideboard = {}
p.errors = {}

--luacheck: push no unused
local function LogTypes()
    mw.log("Land : "..#p.Land)
    mw.log("Creature : "..#p.Creature)
    mw.log("Artifact : "..#p.Artifact)
    mw.log("Enchantment : "..#p.Enchantment)
    mw.log("Instant : "..#p.Instant)
    mw.log("Sorcery : "..#p.Sorcery)
    mw.log("Planeswalker : "..#p.Planeswalker)
    mw.log("errors : "..#p.errors)
end
--luacheck: pop

local function TableContains(tbl, item)
    if (not tbl) or (not item) then return false end
    for _, v in pairs(tbl) do
        if v == item then return true end
    end
    return false
end

local function Add(cardTable, amount, card)
    local name = card.Name
    for i = 1, #cardTable do
        if cardTable[i][2].Name == name then
            cardTable[i][1] = cardTable[i][1] + amount
            hasMultiples = true
            return
        end
    end
    table.insert(cardTable, {amount, card})
end

local function UpdateBanned(card)
    if card.Banned then
        for _, bannedFormat in pairs(card.Banned) do
            banned[bannedFormat] = true;
        end
    end
end

local function UpdateHistoric(card, isHistoric)
    if isHistoric then
        card.IsHistoric = true
        deckIsHistoric = true
    end
end

function p.All()
    local cardlists = {p.Land, p.Creature, p.Artifact, p.Enchantment, p.Instant, p.Sorcery, p.Planeswalker}
    local entryIndex = 1
    local cardlistIndex = 1
    return function ()
        while (cardlistIndex <= #cardlists) do
            local cardlist = cardlists[cardlistIndex]
            if entryIndex <= #cardlist then
                local entry = cardlist[entryIndex]
                entryIndex = entryIndex + 1
                return entry
            end
            cardlistIndex = cardlistIndex + 1
            entryIndex = 1
        end
    end
end

function p.AddCard(amount, card, isHistoric)
    UpdateBanned(card)
    UpdateHistoric(card, isHistoric)
    numCardsInDeck = numCardsInDeck + amount
    if TableContains(card.Types,"Land") then
        Add(p.Land, amount, card)
    elseif TableContains(card.Types,"Creature") then
        Add(p.Creature, amount, card)
    elseif TableContains(card.Types,"Artifact") then
        Add(p.Artifact, amount, card)
    elseif TableContains(card.Types,"Enchantment") then
        Add(p.Enchantment, amount, card)
    elseif TableContains(card.Types,"Instant") then
        Add(p.Instant, amount, card)
    elseif TableContains(card.Types,"Sorcery") then
        Add(p.Sorcery, amount, card)
    elseif TableContains(card.Types,"Planeswalker") then
        Add(p.Planeswalker, amount, card)
    else
        table.insert(p.errors, {amount, {Name=card.Name} })
    end
end

function p.AddSideboard(amount, card, isHistoric)
    UpdateBanned(card)
    UpdateHistoric(card, isHistoric)
    Add(p.Sideboard, amount, card)
end

function p.AddError(amount, name)
    table.insert(p.errors, {amount, {Name=name} })
end

function p.GetBanned()
    return banned
end

function p.HasMultiples()
    return hasMultiples
end

function p.CardTotal()
    return numCardsInDeck
end

function p.Playable()
    for entry in p.All() do
        if not entry[2].Playable then return false end
    end
    for _, entry in pairs(p.Sideboard) do
        if not entry[2].Playable then return false end
    end
    return true
end

function p.Historic()
    return deckIsHistoric
end

return p
