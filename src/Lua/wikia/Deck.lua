local p = {}

local banned = {}

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

local function UpdateBanned(card)
    if card.Banned then
        for _, bannedFormat in pairs(card.Banned) do
            banned[bannedFormat] = true;
        end
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

function p.AddCard(amount, card)
    UpdateBanned(card)
    if TableContains(card.Types,"Land") then
        table.insert(p.Land, {amount, card})
    elseif TableContains(card.Types,"Creature") then
        table.insert(p.Creature, {amount, card})
    elseif TableContains(card.Types,"Artifact") then
        table.insert(p.Artifact, {amount, card})
    elseif TableContains(card.Types,"Enchantment") then
         table.insert(p.Enchantment, {amount, card})
    elseif TableContains(card.Types,"Instant") then
         table.insert(p.Instant, {amount, card})
    elseif TableContains(card.Types,"Sorcery") then
         table.insert(p.Sorcery, {amount, card})
    elseif TableContains(card.Types,"Planeswalker") then
        table.insert(p.Planeswalker, {amount, card})
    else
        table.insert(p.errors, {amount, {Name=card.Name} })
    end
end

function p.AddSideboard(amount, card)
    UpdateBanned(card)
    table.insert(p.Sideboard, {amount, card})
end

function p.AddError(amount, name)
    table.insert(p.errors, {amount, {Name=name} })
end

function p.GetBanned()
    return banned
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

return p
