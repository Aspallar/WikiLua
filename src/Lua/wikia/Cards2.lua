--<nowiki>
local cardService = require("Module:CardService")
local utils = require("Module:TemplateUtils")

local p = {}

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
<br/>
[[File:%s.png|link=]]]=]

local numCardsPerPage = 100

local setNames = {}
setNames["KLD"]="Kaladesh"
setNames["AER"]="Aether Revolt"
setNames["W17"]="Welcome Deck 2017"
setNames["AKH"]="Amonkhet"
setNames["HOU"]="Hour of Devastation"
setNames["XLN"]="Ixalan"
setNames["RIX"]="Rivals of Ixalan"
setNames["DOM"]="Dominaria"
setNames["M19"]="Core Set 2019"
setNames["ANA"]="Arena Only"

local function SetLinkName(setCode)
    if setCode == "HOU" then
        return "Hour of Devastation (set)"
    end
    return setNames[setCode]
end

local function SetLink(setCode)
    if setCode == "HOU" then
        return "[[Hour of Devastation (set)|Hour of Devastation]]"
    end
    return "[[" .. setNames[setCode] .. "]]"
end


local function ConcatTables(target,source)
    if not source then return end
    for _,v in pairs(source) do
        table.insert(target,v)
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

local function DescriptionBox(card)
    return "[["..card.Name.."]] "..(card.Manacost or "").." ("..(card.cmc or 0)..")<br/>"..
    card.Type.." "..PT(card).."<br/>"..
    (card.Text or "")
end

local function ExpansionSymbol(card)
    return "{{"..card.SetCode..card.Rarity:sub(1,1).."}}"
end

local function GetRulings(card)
    if card.Rulings == nil then return "" end
    local rulings = mw.loadData("Module:Data/Rulings")
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

local function GenerateAnyCardRow(card)
    return string.format(anyCardRowTemplate,
        "[[File:"..card.Name..".png|95px|link="..card.Name.."]]",
        DescriptionBox(card))
end


local function GetReprintsTable(card)
    local row = "{{ReprintRow|%s|%s|%s|<br />%s}}\n"
    local s = "\n\n----\n{|class=\"mdw-reprint-table\"\n|+ '''Other Sets'''\n"
    for _, set in pairs(card.Sets) do
        local setTemplate = "{{" .. set.Set .. string.sub(set.Rarity,1,1) .. "}}"
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
    return string.sub(bantext, 1, -3) .. "{{MoreBannedDetails}}"
end

local function GenerateCardPage(card)
    local contents = {}
    table.insert(contents,{"Name",card.Name})

    if card.Manacost then table.insert(contents, {"Mana Cost", card.Manacost}) end
    table.insert(contents, {"Converted Mana Cost", card.cmc or 0})
    if card.Type then table.insert(contents, {"Types", card.Type}) end
    if card.Text then table.insert(contents, {"Text", card.Text}) end
    if card.Flavor then table.insert(contents, {"Flavor", card.Flavor}) end
    if card.Loyalty then table.insert(contents, {"Loyalty", card.Loyalty}) end
    if card.Power then table.insert(contents, {"P/T", PT(card)}) end
    table.insert(contents, {"Expansion", ExpansionSymbol(card) .. " " .. SetLink(card.SetCode)})
    table.insert(contents, {"Rarity", card.Rarity})
    if card.Banned then table.insert(contents, {"Banned In", BanText(card.Banned)}) end

    local cardContents = ""
    for i = 1, #contents do
         cardContents = cardContents .. string.format(cardPageRowTemplate, contents[i][1], contents[i][2])
    end

    local reprints = GetReprints(card)

    return string.format(cardPageTemplate,
        cardContents,
        card.Name) .. GetRulings(card) .. reprints .. p.GetCardCategories(card)
end

local function GenerateOtherCardPage(card)
    local contents = {}
    table.insert(contents,{"Card name",card.Name})
    if card.Manacost then table.insert(contents,{"Mana Cost",card.Manacost}) end
    table.insert(contents,{"Converted Mana Cost",card.cmc or 0})
    if card.Type then table.insert(contents,{"Types",card.Type}) end
    if card.Text then table.insert(contents,{"Card Text",card.Text}) end
    if card.Flavor then table.insert(contents,{"Flavor Text",card.Flavor}) end
    if card.Loyalty then table.insert(contents,{"Loyalty",card.Loyalty}) end
    if card.Power then table.insert(contents,{"P/T",PT(card)}) end
    table.insert(contents,{"Rarity",card.Rarity})

    local cardContents = ""
    for i = 1,#contents do
         cardContents = cardContents .. string.format(cardPageRowTemplate,contents[i][1],contents[i][2])
    end

    return "{{CardUnavailable}}\n{{clear}}\n"..string.format(cardPageTemplate,
        cardContents,
        card.Name)..GetRulings(card)..p.GetCardCategories(card)
end

local function GetCardsTable(criteria)
    local output = {""}
    local numresults = 0
    for card in cardService.GetByCriteria(criteria) do
        table.insert(output, GenerateCardRow(card))
        numresults = numresults + 1
    end
    output[1] = [=[! colspan="3" align="right"|]=] .. numresults .. " result" .. (numresults ~= 1 and "s\n" or "\n")
    return table.concat(output)
end

function p.GetCardsTable(frame)
    local criteria = utils.RecreateTable(frame:getParent().args)
    local result = GetCardsTable(criteria)
    return frame:preprocess(result)
end

function p.TestGetCardsTable(criteria)
    return GetCardsTable(criteria)
end

local function GetCardNames(criteria)
    local output = {}
    for card in cardService.GetByCriteria(criteria) do
        table.insert(output, card.Name .. "\n")
    end
    return table.concat(output)
end

function p.GetCardNames(frame)
    local criteria = utils.RecreateTable(frame:getParent().args)
    local result = GetCardNames(criteria)
    return frame:preprocess(result)
end

function p.TestGetCardNames(criteria)
    return GetCardNames(criteria)
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
        table.insert(validCards, card)
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
    local card = cardService.GetByNameIgnoreCase(name)
    return frame:preprocess(GenerateAnyCardRow(card))
end

local function GetCardPage(name)
    local card = cardService.GetByName(name)
    if not card then
        card = cardService.GetOtherByName(name)
        if not card then
            return "There was an error generating this page. We're aware of it and will fix it soon.{{PagesWithScriptErrors}}"
        else
            return GenerateOtherCardPage(card)
        end
    end
    if card.CardNumber and (string.find(card.CardNumber,"a")) then
        local card2 = cardService.GetByNumber(string.gsub(card.CardNumber,"a","b"))
        return GenerateCardPage(card) ..
            "\n{{clear}}\n<big><big><big>" .. card2.Name .. "</big></big></big>\n" ..
            GenerateCardPage(card2)
    else
        return GenerateCardPage(card)
    end
end

function p.GetCardPage(frame)
    local name = string.gsub( mw.uri.decode(frame:preprocess("{{PAGENAMEE}}")), "_", " ")
    return frame:preprocess(GetCardPage(name))
end

function p.TestGetCardPage(name)
    return GetCardPage(name)
end

function p.GetCardCategories(card)
    local categories = {}
    table.insert(categories,"Cards")
    for _,setcode in pairs(card.Allsets) do
        table.insert(categories,setNames[setcode])
    end
    ConcatTables(categories,card.Colors)
    table.insert(categories,card.Rarity)
    ConcatTables(categories,card.SuperTypes)
    ConcatTables(categories,card.Types)
    ConcatTables(categories,card.SubTypes)
    if card.Watermark then table.insert(categories,card.Watermark) end
    if card.Sets then table.insert(categories,"Reprint") end
    if card.Banned then table.insert(categories,"Banned Card") end

    local s = ""
    for _,v in pairs(categories) do
         s = s .. "[[Category:"..v.."]]"
    end

    return s
end

return p
--</nowiki>