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
local errors = {}

local function ParseCardEntry(entry)
    local pos, _ = string.find(entry, "%(")
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
    return intNumber, cardName
end

local function SortListIntoTypes(list)
    for _,t in pairs(list) do
        local num, name = ParseCardEntry(t)
        local card = cardService.GetByNameIgnoreCase(name)
        if card then
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
                table.insert(errors, {num, {Name=name} })
            end
        else
            table.insert(errors, {num, {Name=name} })
        end
    end
end

--luacheck: push
--luacheck: no unused
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

--luacheck: push
--luacheck: no unused
local function Write(s)
    buffer = buffer .. s
end
--luacheck: pop

local function WriteLine(s)
    buffer = buffer .. s .. "\n"
end

local function WriteCardsFromType(typeCards,typeName)
    if typeCards[1] and typeCards[1][2].cmc then
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
    WriteCardsFromType(Land, "Lands [[File:Icon land.png|23px|link=]]")
    WriteCardsFromType(Creature, "Creatures [[File:Icon creature.png|23px|link=]]")
    WriteCardsFromType(Artifact, "Artifacts [[File:Icon artifact.png|23px|link=]]")
    WriteCardsFromType(Enchantment, "Enchantments [[File:Icon enchantment.png|23px|link=]]")
    WriteCardsFromType(Instant, "Instants [[File:Icon instant.png|23px|link=]]")
    WriteCardsFromType(Sorcery, "Sorceries [[File:Icon sorcery.png|23px|link=]]")
    WriteCardsFromType(Planeswalker, "Planeswalkers [[File:Icon planeswalker.png|23px|link=]]")
    WriteOtherCards(errors)
end

local function GetAdditionalData(cardList)
    local arenaExport = ""
    local alternatives = ""
    local cardlist = {}
    for _,cardEntry  in pairs(cardList) do
        local number, name = ParseCardEntry(cardEntry)
        local card = cardService.GetByNameIgnoreCase(name)
        if card then
            local carddata = { num=number; colors=card.Colors; cmc=card.cmc; types=card.Types }
            table.insert(cardlist, carddata)

            arenaExport = arenaExport .. number .. " " ..
                card.Name .. " (" .. card.SetCode .. ") " ..
                string.match(card.CardNumber, "%d+") .. "\n"

            if card.Sets ~= nil and card.Rarity ~= "Basic Land" then
                for _,set in pairs(card.Sets) do
                    alternatives = alternatives .. card.Name ..
                    " (" .. set.Set .. ") " .. set.CardNumber .. "\n"
                end
            end

        end
    end
    local cardJson = json.encode(cardlist)
    return arenaExport, alternatives, cardJson
end

local function CardJsonDataSection(cardJson)
    return "\n<div id='mdw-chartdata' style='display:none' data-chart='" ..
    mw.text.encode(cardJson) ..
    "'></div>\n"
end

local function ArenaExportSection(exportText, id)
    if exportText == "" then
        return ""
    else
        return "<pre id='" .. id .. "' style='display:none'>\n" .. exportText .. "</pre>\n"
    end
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
    local arenaExport, altExport, cardJson = GetAdditionalData(list)
    return  DeckListSection(name, buffer) ..
        CardJsonDataSection(cardJson) ..
        ArenaExportSection(arenaExport, "mdw-arena-export-src") ..
        ArenaExportSection(altExport, "mdw-arena-export-src-altenative")
end

function p.TestGenerateDeckFromList(name,inputList)
    local list = mw.text.split( inputList, "\n" )
    return (GenerateDeckFromList(name,list))
end

function p.GenerateDeckFromList(frame)
    local args = utils.RecreateTable(frame:getParent().args)
    local list = mw.text.split( args.Deck, "\n" )
    return frame:preprocess(GenerateDeckFromList(args.Name,list))
end

return p

