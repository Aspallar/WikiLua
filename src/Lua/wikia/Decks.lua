local cardService = require("Module:CardService")
local utils = require("Module:TemplateUtils")
local deck = require("Module:Deck")
local json = require("Dev:Json")

local p = {}

local function ParseCardEntry(entry)
    local pos, _ = string.find(entry, "///")
    if pos == nil then
        pos, _ = string.find(entry, "%(")
    end
    if pos ~= nil and pos > 2 then
        entry = string.sub(entry, 1, pos - 2)
    end
    local intAmount, cardName
    pos, _ = string.find(entry, " ")
    if pos ~= nil and pos > 1 then
        local strAmount = string.sub(entry, 1, pos - 1)
        intAmount = tonumber(strAmount)
        if intAmount ~= nil then
            cardName = string.sub(entry, pos + 1)
        else
            intAmount = 0
            cardName = entry
        end
    else
        intAmount = 0
        cardName = entry
    end
    return intAmount, mw.text.trim(cardName)
end

local function SumAmounts(cards)
    local sum = 0
    for i = 1, #cards do
        sum = sum + cards[i][1]
    end
    return sum
end

local function CardList(cards)
    local s = ""
    for i = 1, #cards do
        if (cards[i][2].Playable) then
            s = s.. cards[i][1].." {{Card|"..cards[i][2].Name.."}}<br/>" .. "\n"
        else
            s = s .. cards[i][1].." {{CardTooltip|"..cards[i][2].Name.."}}<br/>" .. "\n"
        end
    end
    return s
end

local function CardTypeSection(cards, cardTypeName, sort)
    local s = ""
    if sort and cards[1] and cards[1][2].cmc then
        table.sort(cards,function(a,b) return (a[2].cmc < b[2].cmc) or ((a[2].cmc == b[2].cmc) and (a[2].Name < b[2].Name)) end)
    end
    local totalAmount = SumAmounts(cards)
    if #cards > 0 then
        s = s .. "<big><big>"..totalAmount.." "..cardTypeName.."</big></big><br/>" .. "\n"
        s = s .. CardList(cards)
    end
    return s
end

local function OtherCards(cards)
    local s = ""
    local totalAmount = SumAmounts(cards)
    if #cards > 0 then
        s = s .. "<big><big>"..totalAmount.." Others</big></big><br/>" .. "\n"
        for i = 1, #cards do
            s = s .. cards[i][1].." {{CardTooltip|"..cards[i][2].Name.."}}<br/>" .. "\n"
        end
    end
    return s
end

local function SideboardSection()
    if #deck.Sideboard == 0 then return "" end
    local totalAmount = SumAmounts(deck.Sideboard)
    local s = "{{Sideboard|" .. totalAmount .. "}}\n{{Div col}}\n" ..
        CardList(deck.Sideboard) ..
        "{{Div col end}}"
    return s
end

local function GetCardLists()
    local s = ""
    s = s .. CardTypeSection(deck.Land, "Lands [[File:Icon land.png|23px|link=]]", false)
    s = s .. CardTypeSection(deck.Creature, "Creatures [[File:Icon creature.png|23px|link=]]", true)
    s = s .. CardTypeSection(deck.Artifact, "Artifacts [[File:Icon artifact.png|23px|link=]]", true)
    s = s .. CardTypeSection(deck.Enchantment, "Enchantments [[File:Icon enchantment.png|23px|link=]]", true)
    s = s .. CardTypeSection(deck.Instant, "Instants [[File:Icon instant.png|23px|link=]]", true)
    s = s .. CardTypeSection(deck.Sorcery, "Sorceries [[File:Icon sorcery.png|23px|link=]]", true)
    s = s .. CardTypeSection(deck.Planeswalker, "Planeswalkers [[File:Icon planeswalker.png|23px|link=]]", true)
    s = s .. OtherCards(deck.errors)
    return s
end

local function ExportCardName(card)
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
    for i = 1, #deck.Sideboard do
        local amount = deck.Sideboard[i][1]
        local card = deck.Sideboard[i][2]
        local exportName = ExportCardName(card)

        local carddata = {
            name = exportName;
            num = amount;
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

    for cardEntry in deck.All() do
        local amount = cardEntry[1]
        local card = cardEntry[2]
        local exportName = ExportCardName(card)

        local carddata = {
            name=exportName;
            num=amount;
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

local function DeckListSection(name)
    local contents = GetCardLists();
    local decklistTemplate = [=[<center><big><big><big>%s</big></big></big></center><br/>
{{Div col}}
%s{{Div col end}}]=]
    return string.format(decklistTemplate, name, contents)
end

local function ParseDeck(list)
    local isSideboard = false;
    for _, cardEntry in pairs(list) do
        if string.sub(cardEntry, 1, 2) == "--" then
            isSideboard = true
        else
            local amount, name = ParseCardEntry(cardEntry)
            local card = cardService.GetByNameIgnoreCase(name)
            if card then
                if isSideboard then
                    deck.AddSideboard(amount, card)
                else
                    deck.AddCard(amount, card)
                end
            else
                deck.AddError(amount, name)
            end
        end
    end
end

local function GenerateDeckFromList(name, list)
    ParseDeck(list)
    local cardList, altCardList = GetAdditionalData()
    local sideboard = GetSideboardData(altCardList)
    return  DeckListSection(name) ..
        SideboardSection() ..
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

