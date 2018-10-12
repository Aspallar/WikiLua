-- <nowiki>
local cardService = require("Module:CardService")
local utils = require("Module:TemplateUtils")
local deck = require("Module:Deck")
local json = require("Dev:Json")

local p = {}

local function ParseCardEntry(entryLine)
    local pos = string.find(entryLine, "//")
    if pos == nil then
        pos = string.find(entryLine, "%(")
    end
    local entry = (pos ~= nil and pos > 2) and string.sub(entryLine, 1, pos - 2) or entryLine
    local amount, name = string.match(entry, "^(%d+)%s+(.+)%s*$")
    amount = tonumber(amount)
    if amount == nil then
        name = entryLine
        amount = 0
    end
    return amount, name
end

local function SumAmounts(cards)
    local sum = 0
    for i = 1, #cards do
        sum = sum + cards[i][1]
    end
    return sum
end

local function CardNumberNumericPart(cardNumber)
    return string.match(string.sub(cardNumber, 4), "%d+")
end

local function CardTemplate(card)
    local template
    if not card.Playable then
        template = "{{CardUnplayable|"
    elseif card.Banned then
        template = "{{CardWarning|"
    else
        template = "{{Card|"
    end
    return template .. card.Name .. "}}"
end

local function CardList(cards)
    local s = ""
    for i = 1, #cards do
        s = s .. string.format("%s %s<br />\n", cards[i][1], CardTemplate(cards[i][2]))
    end
    return s
end

local function CardTypeSection(cards, icon, typeName, sort)
    local s = ""
    if sort and cards[1] and cards[1][2].cmc then
        table.sort(cards,function(a,b) return (a[2].cmc < b[2].cmc) or ((a[2].cmc == b[2].cmc) and (a[2].Name < b[2].Name)) end)
    end
    local totalAmount = SumAmounts(cards)
    if #cards > 0 then
        s = s .. "<big><big>" .. icon .. " " .. totalAmount .. " " .. typeName .. "</big></big><br />" .. "\n"
        s = s .. CardList(cards)
    end
    return s
end

local function OtherCards(cards)
    local s = ""
    local totalAmount = SumAmounts(cards)
    if #cards > 0 then
        s = s .. "<big><big>"..totalAmount.." Others</big></big><br />" .. "\n"
        for i = 1, #cards do
            s = s .. cards[i][1].." {{CardError|"..cards[i][2].Name.."}}<br />" .. "\n"
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
    s = s .. CardTypeSection(deck.Land, "[[File:Icon land.png|23px|link=]]", "Lands", false)
    s = s .. CardTypeSection(deck.Creature, "[[File:Icon creature.png|23px|link=]]", "Creatures", true)
    s = s .. CardTypeSection(deck.Artifact, "[[File:Icon artifact.png|23px|link=]]", "Artifacts", true)
    s = s .. CardTypeSection(deck.Enchantment, "[[File:Icon enchantment.png|23px|link=]]", "Enchantments", true)
    s = s .. CardTypeSection(deck.Instant, "[[File:Icon instant.png|23px|link=]]", "Instants", true)
    s = s .. CardTypeSection(deck.Sorcery, "[[File:Icon sorcery.png|23px|link=]]", "Sorceries", true)
    s = s .. CardTypeSection(deck.Planeswalker, "[[File:Icon planeswalker.png|23px|link=]]", "Planeswalkers", true)
    s = s .. OtherCards(deck.errors)
    return s
end

local function ExportCardName(card)
    if card.CardNumber and string.find(card.CardNumber, "a") ~= nil then
        local card2
        local otherCardNumber = string.gsub(card.CardNumber, "a", "b")
        if card.Playable then
            card2 = cardService.GetByNumber(otherCardNumber)
        else
            card2 = cardService.GetOtherByNumber(otherCardNumber)
        end
        if card2 ~= nil and (card.SetCode == "GRN" or (card2.Text ~= nil and string.find(card2.Text, "Aftermath") ~= nil)) then
            return card.Name .. " // " .. card2.Name
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

local function LocalCardEntry(amount, exportName, card)
    return {
        name = exportName;
        num = amount;
        colors = card.Colors;
        cmc = card.cmc;
        types = card.Types;
        cardNumber = CardNumberNumericPart(card.CardNumber);
        set = ExportSetName(card.SetCode);
        rarity = card.Rarity;
    }
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
        table.insert(data, LocalCardEntry(amount, exportName, card))
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
        table.insert(cardlist, LocalCardEntry(amount, exportName, card))
        AddAltCards(exportName, card, altCardList)
    end
    return cardlist, altCardList
end

local function DataSection(jsonString, id)
    return "\n<pre id='" .. id .. "' style='display:none'>" .. jsonString .. "</pre>"
end

local function DeckListSection(name)
    local contents = GetCardLists();
    local decklistTemplate = [=[<center><big><big><big>%s</big></big></big></center><br />
{{Div col}}
%s{{Div col end}}]=]
    return string.format(decklistTemplate, name, contents)
end

local function ParseDeck(list)
    local isSideboard = false;
    for _, cardEntry in pairs(list) do
        cardEntry = mw.text.trim(cardEntry)
        if (cardEntry ~= "") then
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
end

local function OtherCategories()
    local cats = #deck.errors > 0 and "[[Category: Decks with invalid cards]]" or ""
    if deck.HasMultiples() then
        cats = cats .. "[[Category: Multiple Card Entry]]"
    end
    return cats
end

local function BannedSection()
    local text = ""
    local count = 0
    local lastStart = 0
    for bannedFormat, _ in pairs(deck.GetBanned()) do
        lastStart = string.len(text)
        text = text .. string.lower(bannedFormat) .. ", "
        count = count + 1
    end
    if count == 0 then return "" end
    text = string.sub(text, 1 , -3)
    if count > 1 then
        text = string.sub(text, 1, lastStart - 2) .. " and " .. string.sub(text, lastStart + 1)
    end
    return "{{Banned|" .. text .. "}}[[Category:Decks with banned cards]]\n"
end

local function PlayableSection()
    return deck.Playable() and "" or "{{UnplayableDeck}}"
end

local function GenerateDeckFromList(name, list)
    ParseDeck(list)
    local cardList, altCardList = GetAdditionalData()
    local sideboard = GetSideboardData(altCardList)
    return PlayableSection() .. BannedSection() .. DeckListSection(name) ..
        SideboardSection() ..
        DataSection(json.encode(cardList), "mdw-chartdata-pre") ..
        DataSection(json.encode(altCardList), "mdw-alt-carddata") ..
        DataSection(json.encode(sideboard), "mdw-sideboard-data") ..
        OtherCategories()
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

-- </nowiki>
