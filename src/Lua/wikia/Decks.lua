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
    elseif card.IsHistoric then
        template = "{{CardHistoric|"
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
    if #deck.Sideboard == 0 then
        return ""
    end
    local totalAmount = SumAmounts(deck.Sideboard)
    local s = "{{Sideboard|" .. totalAmount .. "}}\n{{Div col}}\n" ..
        CardList(deck.Sideboard) ..
        "{{Div col end}}"
    return s
end

local function GetCardLists()
    local s = ""
    s = s .. CardTypeSection(deck.Commander, "[[File:Icon commander.svg|23px|link=|baseline]]", "Commander", false)
    s = s .. CardTypeSection(deck.Companion, "[[File:Icon companion.svg|23px|link=|baseline]]", "Companion", false)
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
        if card2 ~= nil then
            local setCode = card.Allsets[1]
            if setCode == "GRN" or setCode == "RNA" or (card2.Text ~= nil and string.find(card2.Text, "Aftermath") ~= nil) then
                return card.Name .. " // " .. card2.Name
            end
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
        set = ExportSetName(card.Allsets[1]);
        rarity = card.Rarities[1];
        isCmd = card.IsCommander;
        isCmp = card.IsCompanion;
    }
end

local function AddAltCards(name, card, altCardList)
    if card.Sets ~= nil and card.Rarities[1] ~= "Basic Land" then
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
    local isSideboard, isCommander, isCompanion = false, false, false
    for _, cardEntry in pairs(list) do
        cardEntry = string.lower(mw.text.trim(cardEntry))
        if cardEntry ~= "" and cardEntry ~= "deck" then
            if string.sub(cardEntry, 1, 2) == "--" then
                isSideboard = true
            elseif cardEntry == "commander" then
                isCommander = true
            elseif cardEntry == "companion" then
                isCompanion = true
            else
                local amount, name = ParseCardEntry(cardEntry)
                local card = cardService.GetByNameIgnoreCase(name)
                if card then
                    if isCommander then
                        isCommander = false
                        deck.AddCommander(card, not cardService.IsStandard(card))
                    elseif isCompanion then
                        isCompanion = false
                        deck.AddCompanion(card)
                    elseif isSideboard then
                        deck.AddSideboard(amount, card, not cardService.IsStandard(card))
                    else
                        deck.AddCard(amount, card, not cardService.IsStandard(card))
                    end
                else
                    deck.AddError(amount, name)
                    isCommander = false
                    isCompanion = false
                end
            end
        end
    end
end

local function AddCommander(name)
    if name ~= nil then
        local card = cardService.GetByNameIgnoreCase(name)
        if card then
            deck.AddCommander(card, not cardService.IsStandard(card))
        else
            deck.AddError(1, name)
        end
    end
end

local function OtherCategories(isStandard, isBrawl)
    local cats = #deck.errors > 0 and "[[Category: Decks with invalid cards]]" or ""
    if deck.HasMultiples() then
        cats = cats .. "[[Category: Multiple Card Entry]]"
    end
    if isBrawl then
        cats = cats .. "[[Category:Brawl Deck]]"
    elseif isStandard then
        cats = cats .. "[[Category:Standard Deck]]"
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
    if count == 0 then
        return ""
    end
    text = string.sub(text, 1 , -3)
    if count > 1 then
        text = string.sub(text, 1, lastStart - 2) .. " and " .. string.sub(text, lastStart + 1)
    end
    return "{{NoticeBanned|" .. text .. "}}<br />[[Category:Decks with banned cards]]\n"
end

local function PlayableOrHistoricSection()
    if not deck.Playable() then
        return "{{NoticeUnplayable}}<br />"
    end
    return deck.Historic() and "{{NoticeHistoric}}<br />" or ""
end

local function BackTo(backto)
    if backto == nil then
        if deck.Brawl() then
            return "back to [[Decklists/Brawl|Brawl Decks]]"
        elseif deck.Historic() then
            return "back to [[Decklists/Historic|Historic Decks]]"
        else
            return "back to [[Decklists|Standard Decks]]"
        end
    end
    if backto == "none" then
        return ""
    end
    local page, text = string.match(backto, "(.-)$(.*)")
    return string.format("back to [[%s|%s]]", page, text)
end

local function GenerateDeckFromList(name, commander, list, backto)
    ParseDeck(list)
    AddCommander(commander)
    local cardList, altCardList = GetAdditionalData()
    local sideboard = GetSideboardData(altCardList)
    local playableOrHistoric = PlayableOrHistoricSection()
    return string.format("<div class=\"mdw-deckbox\"><span class=\"mdw-deckbox-count\">%d Cards</span><div style=\"display:inline-block; float:right;\">%s</div><hr />%s{{Clear}}</div>",
        deck.CardTotal(),
        BackTo(backto),
        playableOrHistoric .. BannedSection() .. DeckListSection(name) ..
        SideboardSection() ..
        DataSection(json.encode(cardList), "mdw-chartdata-pre") ..
        DataSection(json.encode(altCardList), "mdw-alt-carddata") ..
        DataSection(json.encode(sideboard), "mdw-sideboard-data") ..
        OtherCategories(playableOrHistoric == "", deck.Brawl()))
end

function p.GenerateDeckFromList(frame)
    local args = utils.RecreateTable(frame:getParent().args)
    local list = mw.text.split(args.Deck, "\n")
    return frame:preprocess(GenerateDeckFromList(args.Name, args.Commander, list, args.BackTo))
end

return p

-- </nowiki>
