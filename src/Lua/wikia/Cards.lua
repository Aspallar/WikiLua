--<nowiki>
local cardService = require("Module:CardService")
local utils = require("Module:TemplateUtils")

local p = {}

local tinsert, sub, gsub = table.insert, string.sub, string.gsub

local cardRowTemplate= [[|-valign="top"
|%s
|%s
|%s
]]

local anyCardRowTemplate= [[|-valign="top"
|%s
|%s
]]

local cardPageRowTemplate = [[|-
!%s
| %s
]]

local rulingTemplate = [[|-
|%s
|%s
]]

local cardPageTemplate = [=[{| class="article-table mdw-cardinfo-table"
%s
|}
[[File:%s.png|265px|link=]]]=]

local numCardsPerPage = 100

local setNames = {
    ["KLD"]="Kaladesh";
    ["AER"]="Aether Revolt";
    ["W17"]="Welcome Deck 2017";
    ["AKH"]="Amonkhet";
    ["HOU"]="Hour of Devastation";
    ["XLN"]="Ixalan";
    ["RIX"]="Rivals of Ixalan";
    ["DOM"]="Dominaria";
    ["M19"]="Core Set 2019";
    ["G18"]="Gift Pack";
    ["ANA"]="Arena Only";
    ["GRN"]="Guilds of Ravnica";
    ["RNA"]="Ravnica Allegiance";
    ["WAR"]="War of the Spark";
    ["M20"]="Core Set 2020";
    ["ELD"]="Throne of Eldraine";
    ["HA1"]="Historic Anthology 1";
    ["GTC"]="Gatecrash";
    ["INV"]="Invasion";
    ["EMN"]="Eldritch Moon";
    ["DST"]="Darksteel";
    ["ORI"]="Magic Origins";
    ["SOK"]="Saviors of Kamigawa";
    ["M10"]="Magic 2010";
    ["LRW"]="Lorwyn";
    ["ROE"]="Rise of the Eldrazi";
    ["MOR"]="Morningtide";
    ["WTH"]="Weatherlight";
    ["8ED"]="Eighth Edition";
    ["M11"]="Magic 2011";
    ["WWK"]="Worldwake";
    ["MH1"]="Modern Horizons";
    ["SHM"]="Shadowmoor";
}

local function SetLinkName(setCode)
    if setCode == "HOU" then
        return "Hour of Devastation (set)"
    end
    if setCode == "WTH" then
        return "Weatherlight (set)"
    end
    return setNames[setCode]
end

local function SetLink(setCode)
    if setCode == "HOU" then
        return "[[Hour of Devastation (set)|Hour of Devastation]]"
    end
    if setCode == "WTH" then
        return "[[Weatherlight (set)|Weatherlight]]"
    end
    return "[[" .. setNames[setCode] .. "]]"
end


local function ConcatTables(target,source)
    if not source then return end
    for _,v in pairs(source) do
        tinsert(target,v)
    end
end

local function PT(card)
    if ((card.Power == nil) or (card.Toughness == nil)) then
        if card.Loyalty ~= nil then
            return "("..card.Loyalty..")"
        else
            return ""
        end
    else
        return "("..card.Power.."/"..card.Toughness..")"
    end
end

local function DescriptionBox(card, amount)
    amount = (amount and amount ~= "") and '<span class="mdw-card-amount">' .. amount .. '</span> x ' or ""
    return amount .. "[["..card.Name.."]] "..(card.Manacost or "").." ("..(card.cmc or 0)..")<br/>"..
    card.Type.." "..PT(card).."<br/>"..
    (card.Text or "")
end

local function ExpansionSymbol(card)
    return "{{"..card.SetCode..card.Rarity:sub(1,1).."}}"
end

local function GetRulings(card, isOtherCard)
    if card.Rulings == nil then return "" end
    local rulings = isOtherCard and mw.loadData("Module:Data/OtherRulings") or mw.loadData("Module:Data/Rulings")
    local rules = rulings[card.CardNumber]
    if rules == nil then return "" end
    local s = [=[{{clear}}
{| class="article-table mdw-cardrulings-table"
|+ Card rulings ([[Card rulings|?]])
]=]
    for _, rule in pairs(rules) do
        s = s .. string.format(rulingTemplate, rule.Date, utils.ExpandSymbols(rule.Text))
    end
    s = s .. "|}"
    return s
end

local function GenerateCardRow(card)
    return string.format(cardRowTemplate,
        "[[File:"..card.Name..".png|95px|link="..card.Name.."]]",
        DescriptionBox(card),
        ExpansionSymbol(card))
end

local function GenerateAnyCardRow(card, amount)
    return string.format(anyCardRowTemplate,
        '<span class="card-image-tooltip" data-parameter="' .. card.Name .. '">[[File:' .. card.Name .. '.png|95px|link=' .. card.Name .. ']]</span>',
        DescriptionBox(card, amount))
end

local function GetReprintsTable(card)
    local row = "{{ReprintRow|%s|%s|%s|<br />%s}}\n"
    local s = "\n\n----\n{|class=\"mdw-reprint-table\"\n|+ '''Other Sets'''\n"
    for _, set in pairs(card.Sets) do
        local setTemplate = "{{" .. set.Set .. sub(set.Rarity,1,1) .. "}}"
        local imageName = card.Name .. " " .. set.Set .. " " .. set.CardNumber
        local setlink = SetLinkName(set.Set)
        local setname = setNames[set.Set]
        local flavor = set.Flavor or ""
        local text = setTemplate ..  " " .. set.Rarity .. "<br />" .. flavor
        s = s .. string.format(row, imageName, setlink, setname, text)
    end
    return s .. "|}"
end

local function GetReprints(card)
    local reprints = ""
    if card.Sets then
        reprints = "{{Clear}}\n"
        if card.Rarity == "Basic Land" then
            reprints = reprints .. "{{LandReprint}}"
        else
            reprints = reprints .. GetReprintsTable(card)
        end
    end
    return reprints
end

local function BanText(banned)
    -- table.concat didn't work here, don't know why, so manualy concat
    local bantext = ""
    for _, bannedFormat in pairs(banned) do
        bantext = bantext .. bannedFormat .. '; '
    end
    return sub(bantext, 1, -3) .. "{{MoreBannedDetails}}"
end

local function GenerateCardInfo(card)
    local contents = {}
    tinsert(contents,{"Name",card.Name})

    if card.Manacost then tinsert(contents, {"Mana Cost", card.Manacost}) end
    tinsert(contents, {"Converted Mana Cost", card.cmc or 0})
    if card.Type then tinsert(contents, {"Types", card.Type}) end
    if card.Text then tinsert(contents, {"Text", card.Text}) end
    if card.Flavor then tinsert(contents, {"Flavor", gsub(card.Flavor, "&lt;/?i&gt;", "''")}) end
    if card.Loyalty then tinsert(contents, {"Loyalty", card.Loyalty}) end
    if card.Power then tinsert(contents, {"P/T", PT(card)}) end
    tinsert(contents, {"Expansion", ExpansionSymbol(card) .. " " .. SetLink(card.SetCode)})
    tinsert(contents, {"Rarity", card.Rarity})
    if card.Banned then tinsert(contents, {"Banned In", BanText(card.Banned)}) end

    local info = ""
    for i = 1, #contents do
         info = info .. string.format(cardPageRowTemplate, contents[i][1], contents[i][2])
    end
    return info

end

local function GenerateCardPage(card)
    local cardInfo = GenerateCardInfo(card)
    local reprints = GetReprints(card)
    return string.format(cardPageTemplate,
        cardInfo,
        card.Name) .. GetRulings(card) .. reprints .. p.GetCardCategories(card)
end

local function GenerateOtherCardPage(card)
    local cardInfo = GenerateCardInfo(card)
    return string.format(cardPageTemplate,
        cardInfo,
        card.Name) ..  GetRulings(card, true) .. p.GetCardCategories(card)
end

local function GetCardsTable(cards)
    local output = {""}
    local numresults = 0
    for card in cards do
        tinsert(output, GenerateCardRow(card))
        numresults = numresults + 1
    end
    output[1] = [=[! colspan="3" align="right"|]=] .. numresults .. " result" .. (numresults ~= 1 and "s\n" or "\n")
    return table.concat(output)
end

function p.GetCardsTable(frame)
    local criteria = utils.RecreateTable(frame:getParent().args)
    local result = GetCardsTable(cardService.GetByCriteria(criteria))
    return frame:preprocess(result)
end

function p.GetOtherCardsTable(frame)
    local criteria = utils.RecreateTable(frame:getParent().args)
    local result = GetCardsTable(cardService.GetOtherByCriteria(criteria))
    return frame:preprocess(result)
end

function p.TestGetCardsTable(criteria)
    return GetCardsTable(criteria)
end

local function cardResultPageNavigation(startCard,endCard,numresults,page,linkBase)
    return [[! colspan="3" align="right"|Showing results ]]..startCard.." to "..endCard.." out of "..numresults.." "..((page == 1 ) and "" or([=[[[]=]..linkBase.. page - 1 ..[=[|Previous page]]]=])).." "..((startCard+numCardsPerPage>numresults) and "" or ([=[[[]=]..linkBase.. page + 1 ..[=[|Next page]]]=])).."\n"
end

local function GetPagedCardsTable(criteria, title)
    local titleparts = mw.text.split(title, '/', true)
    local page
    if (#titleparts == 0) or (tonumber(titleparts[#titleparts]) == nil) then
        page = 1
    else
        page = tonumber(titleparts[#titleparts])
        table.remove(titleparts, #titleparts)
    end
    local linkBase = table.concat(titleparts, '/') .. '/'

    local s = ""
    local numresults = 0
    local validCards = {}

    for card in cardService.GetByCriteria(criteria) do
        tinsert(validCards, card)
        numresults = numresults + 1
    end

    local startCard = (page - 1) * numCardsPerPage + 1
    local endCard = math.min((page - 1) * numCardsPerPage + numCardsPerPage, numresults)

    for i = startCard, endCard do
        s = s .. GenerateCardRow(validCards[i])
    end

    s = cardResultPageNavigation(startCard, endCard, numresults, page, linkBase) ..
        s .. "\n|-\n" ..
        cardResultPageNavigation(startCard,endCard,numresults,page,linkBase)
    return s
end

function p.TestGetPagedCardsTable(criteria, title)
    return GetPagedCardsTable(criteria, title)
end

function p.GetPagedCardsTable(frame)
    local criteria = utils.RecreateTable(frame.args)
    local title = frame:getParent():getTitle()
    local s = GetPagedCardsTable(criteria, title)
    return frame:preprocess(s)
end

function p.GetAnyCardRow(frame)
    local name = frame.args[1]
    local amount = frame.args[2]
    local card = cardService.GetByNameIgnoreCase(name)
    return frame:preprocess(GenerateAnyCardRow(card, amount))
end

local function GetOtherCard(name)
    local s
    local card = cardService.GetOtherByName(name)
    if card then
        s = "{{NoticeCardUnavailable}}\n{{clear}}\n" .. GenerateOtherCardPage(card)
        if card.CardNumber and (string.find(card.CardNumber, "a")) then
            local card2 = cardService.GetOtherByNumber(gsub(card.CardNumber, "a", "b"))
            s = s .. "\n{{clear}}\n<big><big><big>" .. card2.Name .. "</big></big></big>\n" .. GenerateOtherCardPage(card2)
        end
    else
        s = "There was an error generating this page. We're aware of it and will fix it soon.{{PagesWithScriptErrors}}"
    end
    return s
end

local function GetCard(card)
    local s = cardService.IsStandard(card) and "" or "{{NoticeHistoricCard}}\n"
    s = s .. GenerateCardPage(card)
    if card.CardNumber and (string.find(card.CardNumber, "a")) then
        local card2 = cardService.GetByNumber(gsub(card.CardNumber, "a", "b"))
        s = s .. "\n{{clear}}\n<big><big><big>" .. card2.Name .. "</big></big></big>\n" .. GenerateCardPage(card2)
    end
    return s
end

local function GetCardPage(name)
    local card = cardService.GetByName(name)
    return card and GetCard(card) or GetOtherCard(name)
end

function p.GetCardPage(frame)
    local name = gsub( mw.uri.decode(frame:preprocess("{{PAGENAMEE}}")), "_", " ")
    return frame:preprocess(GetCardPage(name))
end

function p.GetCardCategories(card)
    local categories = {}
    tinsert(categories,"Cards")
    for _,setcode in pairs(card.Allsets) do
        tinsert(categories,setNames[setcode])
    end
    ConcatTables(categories,card.Colors)
    tinsert(categories,card.Rarity)
    ConcatTables(categories,card.SuperTypes)
    ConcatTables(categories,card.Types)
    ConcatTables(categories,card.SubTypes)
    if card.Watermark then tinsert(categories,card.Watermark) end
    if card.Sets then tinsert(categories,"Reprint") end
    if card.Banned then tinsert(categories,"Banned Card") end

    local s = ""
    for _,v in pairs(categories) do
         s = s .. "[[Category:"..v.."]]"
    end

    return s
end

return p
--</nowiki>
