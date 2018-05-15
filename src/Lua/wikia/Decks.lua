local cardService = require("Module:CardService")
local utils = require("Module:TemplateUtils")
local json = require("Dev:Json")

local p = {}

local function TableContains(t,item)
    if(not t) or (not item) then return false end
    for _,v in pairs(t) do
        if v == item then
            return true
        end
    end
    return false
end

local Land = {}
local Creature = {}
local Artifact = {}
local Enchantment = {}
local Instant = {}
local Sorcery = {}
local Planeswalker = {}
local Sideboard = {}
local errors = {}


local function AllTypelistEntries()
    local typelists = {Land, Creature, Artifact, Enchantment, Instant, Sorcery, Planeswalker}
    local entryIndex = 1
    local typelistIndex = 1
    return function ()
        while (typelistIndex <= #typelists) do
            local typelist = typelists[typelistIndex]
            if entryIndex <= #typelist then
                local entry = typelist[entryIndex]
                entryIndex = entryIndex + 1
                return entry
            end
            typelistIndex = typelistIndex + 1
            entryIndex = 1
        end
    end
end

local function ParseCardEntry(entry)
    local pos, _ = string.find(entry, "///")
    if pos == nil then
        pos, _ = string.find(entry, "%(")
    end
    if pos ~= nil and pos > 2 then
        entry = string.sub(entry, 1, pos - 2)
    end
    local intNumber, cardName
    pos, _ = string.find(entry, " ")
    if pos ~= nil and pos > 1 then
        local strNumber = string.sub(entry, 1, pos - 1)
        intNumber = tonumber(strNumber)
        if intNumber ~= nil then
            cardName = string.sub(entry, pos + 1)
        else
            intNumber = 0
            cardName = entry
        end
    else
        intNumber = 0
        cardName = entry
    end
    return intNumber, mw.text.trim(cardName)
end

local function InsertDeckEntry(num, card)
    if TableContains(card.Types,"Land") then
        table.insert(Land, {num, card})
    elseif TableContains(card.Types,"Creature") then
        table.insert(Creature, {num, card})
    elseif TableContains(card.Types,"Artifact") then
        table.insert(Artifact, {num, card})
    elseif TableContains(card.Types,"Enchantment") then
         table.insert(Enchantment, {num, card})
    elseif TableContains(card.Types,"Instant") then
         table.insert(Instant, {num, card})
    elseif TableContains(card.Types,"Sorcery") then
         table.insert(Sorcery, {num, card})
    elseif TableContains(card.Types,"Planeswalker") then
        table.insert(Planeswalker, {num, card})
    else
        table.insert(errors, {num, {Name=card.Name} })
    end
end

local function SortListIntoTypes(list)
    local sideboardMarker = "sideboard"
    local isSideboard = false;
    for _, cardEntry in pairs(list) do
        if mw.text.trim(cardEntry) == sideboardMarker then
            isSideboard = true
        else
            local num, name = ParseCardEntry(cardEntry)
            local card = cardService.GetByNameIgnoreCase(name)
            if card then
                if isSideboard then
                    table.insert(Sideboard, {num, card})
                else
                    InsertDeckEntry(num, card)
                end
            else
                table.insert(errors, {num, {Name=name} })
            end
        end
    end
end

--luacheck: push no unused
local function LogTypes()
    mw.log("Land : "..#Land)
    mw.log("Creature : "..#Creature)
    mw.log("Artifact : "..#Artifact)
    mw.log("Enchantment : "..#Enchantment)
    mw.log("Instant : "..#Instant)
    mw.log("Sorcery : "..#Sorcery)
    mw.log("Planeswalker : "..#Planeswalker)
    mw.log("errors : "..#errors)
end
--luacheck: pop

local buffer = ""

--luacheck: push no unused
local function Write(s)
    buffer = buffer .. s
end
--luacheck: pop

local function WriteLine(s)
    buffer = buffer .. s .. "\n"
end

local function WriteCardsFromType(typeCards, typeName, sort)
    if sort and typeCards[1] and typeCards[1][2].cmc then
        table.sort(typeCards,function(a,b) return (a[2].cmc < b[2].cmc) or ((a[2].cmc == b[2].cmc) and (a[2].Name < b[2].Name)) end)
    end
    local numType = 0
    for i = 1, #typeCards do
        numType = numType + typeCards[i][1]
    end
    if #typeCards > 0 then
        WriteLine("<big><big>"..numType.." "..typeName.."</big></big><br/>")
        for i = 1, #typeCards do
            if (typeCards[i][2].Playable) then
                WriteLine(typeCards[i][1].." {{Card|"..typeCards[i][2].Name.."}}<br/>")
            else
                WriteLine(typeCards[i][1].." {{CardTooltip|"..typeCards[i][2].Name.."}}<br/>")
            end
        end
    end
end

local function WriteOtherCards(typeCards)
    local numType = 0
    for i = 1, #typeCards do
        numType = numType + typeCards[i][1]
    end
    if #typeCards > 0 then
        WriteLine("<big><big>"..numType.." Others</big></big><br/>")
        for i = 1, #typeCards do
            WriteLine(typeCards[i][1].." {{CardTooltip|"..typeCards[i][2].Name.."}}<br/>")
        end
    end
end

local function WriteTypeLists()
    WriteCardsFromType(Land, "Lands [[File:Icon land.png|23px|link=]]", false)
    WriteCardsFromType(Creature, "Creatures [[File:Icon creature.png|23px|link=]]", true)
    WriteCardsFromType(Artifact, "Artifacts [[File:Icon artifact.png|23px|link=]]", true)
    WriteCardsFromType(Enchantment, "Enchantments [[File:Icon enchantment.png|23px|link=]]", true)
    WriteCardsFromType(Instant, "Instants [[File:Icon instant.png|23px|link=]]", true)
    WriteCardsFromType(Sorcery, "Sorceries [[File:Icon sorcery.png|23px|link=]]", true)
    WriteCardsFromType(Planeswalker, "Planeswalkers [[File:Icon planeswalker.png|23px|link=]]", true)
    WriteCardsFromType(Sideboard, "Sideboard [[File:Icon sideboard.png|23px|link=]]", false)
    WriteOtherCards(errors)
end

local function exportCardName(card)
    if card.CardNumber and string.find(card.CardNumber, "a") ~= nil then
        local card2 = cardService.GetByNumber(string.gsub(card.CardNumber, "a", "b"))
        if card2 ~= nil and card2.Text ~= nil and string.find(card2.Text, "Aftermath") ~= nil then
            return card.Name .. " /// " .. card2.Name
        end
    end
    return card.Name
end

local function ExportSetName(setCode)
    if setCode == "DOM" then
        return "DAR"
    end
    return setCode
end

local function AddAltCards(name, card, altCardList)
    if card.Sets ~= nil and card.Rarity ~= "Basic Land" then
        for _, set in pairs(card.Sets) do
            local carddata = {
                name = name;
                set = ExportSetName(set.Set);
                cardNumber = set.CardNumber;
                rarity = set.Rarity;
            }
            table.insert(altCardList, carddata)
        end
    end
end

local function GetSideboardData(altCardList)
    local data = {}
    for i = 1, #Sideboard do
        local num = Sideboard[i][1]
        local card = Sideboard[i][2]
        local exportName = exportCardName(card)

        local carddata = {
            name = exportName;
            num = num;
            set = ExportSetName(card.SetCode);
            cardNumber = string.match(card.CardNumber, "%d+");
            rarity = card.Rarity;
        }
        table.insert(data, carddata)
        AddAltCards(exportName, card, altCardList)
    end
    return data
end

local function GetAdditionalData()
    local cardlist = {}
    local altCardList = {}

    for cardEntry in AllTypelistEntries() do
        local number = cardEntry[1]
        local card = cardEntry[2]
        local exportName = exportCardName(card)

        local carddata = {
            name=exportName;
            num=number;
            colors=card.Colors;
            cmc=card.cmc;
            types=card.Types;
            cardNumber=string.match(card.CardNumber, "%d+");
            set=ExportSetName(card.SetCode);
            rarity=card.Rarity;
        }
        table.insert(cardlist, carddata)
        AddAltCards(exportName, card, altCardList)
    end
    return cardlist, altCardList
end

local function DataSection(jsonString, id)
    return "\n<pre id='" .. id .. "' style='display:none'>" .. jsonString .. "</pre>"
end

local function DeckListSection( name, contents )
    local decklistTemplate = [=[<center><big><big><big>%s</big></big></big></center><br/>
{{Div col}}
%s{{Div col end}}]=]
    return string.format(decklistTemplate, name, contents)
end

local function GenerateDeckFromList(name,list)
    SortListIntoTypes(list)
    WriteTypeLists()
    local cardList, altCardList = GetAdditionalData()
    local sideboard = GetSideboardData(altCardList)
    return  DeckListSection(name, buffer) ..
        DataSection(json.encode(cardList), "mdw-chartdata-pre") ..
        DataSection(json.encode(altCardList), "mdw-alt-carddata") ..
        DataSection(json.encode(sideboard), "mdw-sideboard-data")
end

function p.TestGenerateDeckFromList(name,inputList)
    local list = mw.text.split(inputList, "\n" )
    return GenerateDeckFromList(name, list)
end

function p.GenerateDeckFromList(frame)
    local args = utils.RecreateTable(frame:getParent().args)
    local list = mw.text.split(args.Deck, "\n")
    return frame:preprocess(GenerateDeckFromList(args.Name,list))
end

return p

