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
!%s:
| %s
]]

local rulingTemplate = [[|-
|%s
|%s
]]

local cardPageTemplate = [=[{| class="article-table CardPageTable" style="float:right; width: 60%%;"
%s
|}
<br/>
[[File:%s.png|link=]]]=]

local otherSetsTemplate = [=[{| class="mdw-reprint"
|-
| align="center" |[[File:Reprint icon.png|link=]] || This card is a '''Reprint''' from<br />%s, %s {{%s}}, Flavor Text: ''%s''
|}
]=]

local landOtherSetsTemplate = [=[{| class="mdw-reprint"
|-
| align="center" |[[File:Reprint icon.png|link=]] || This card is a '''Reprint''' from %s
|}
]=]

local numCardsPerPage = 100

local setNames = {}
setNames["AKH"]="Amonkhet"
setNames["HOU"]="Hour of Devastation"
setNames["XLN"]="Ixalan"
setNames["RIX"]="Rivals of Ixalan"

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
    if not card.Rulings then return "" end
    local s = [=[{{clear}}
{| class="article-table"
|+ Card rulings ([[Card rulings|?]])
]=]
    for _, ruling in pairs(card.Rulings) do
        s = s .. string.format(rulingTemplate,ruling.Date,ruling.Text)
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


local function GetReprints(card)
    local reprints = ""
    if card.Sets then
        reprints = "{{Clear}}\n"
        if card.Rarity == "Basic Land" then
            local setsList = ""
            for _, set in pairs(card.Sets) do
                setsList = setsList .. SetLink(set.Set)
            end
            reprints = reprints .. "\n\n" .. string.format(landOtherSetsTemplate, setsList)
        else
            for _, set in pairs(card.Sets) do
                local setTemplate = set.Set .. string.sub(set.Rarity,1,1)
                local flavor = set.Flavor or "None."
                local setEntry = string.format(otherSetsTemplate, SetLink(set.Set), set.Rarity, setTemplate, flavor);
                reprints = reprints .. setEntry
            end
        end
    end
    return reprints
end

local function GenerateCardPage(card)
    local contents = {}
    table.insert(contents,{"Card name",card.Name})

    if card.Manacost then table.insert(contents,{"Mana Cost",card.Manacost}) end
    table.insert(contents,{"Converted Mana Cost",card.cmc or 0})
    if card.Type then table.insert(contents,{"Types",card.Type}) end
    if card.Text then table.insert(contents,{"Card Text",card.Text}) end
    if card.Flavor then table.insert(contents,{"Flavor Text",card.Flavor}) end
    if card.Loyalty then table.insert(contents,{"Loyalty",card.Loyalty}) end
    if card.Power then table.insert(contents,{"P/T",PT(card)}) end
    table.insert(contents,{"Expansion",ExpansionSymbol(card) .. " " .. SetLink(card.SetCode)})
    table.insert(contents,{"Rarity",card.Rarity})

    local cardContents = ""
    for i = 1, #contents do
         cardContents = cardContents .. string.format(cardPageRowTemplate,contents[i][1],contents[i][2])
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
	local s = ""
	local numresults = 0
    for card in cardService.GetByCriteria(criteria) do
        s = s .. GenerateCardRow(card)
        numresults = numresults + 1
    end
    s = [=[! colspan="3" align="right"|]=]..numresults.." result"..(numresults~=1 and "s\n" or "\n")..s
	return s
end

function p.GetCardsTable(frame)
    local criteria = utils.RecreateTable(frame:getParent().args)
	local result = GetCardsTable(criteria)
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

-- TODO: (Aspallar) removal candidate, does not appear to be used in wiki
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

    local s = ""
    for _,v in pairs(categories) do
         s = s .. "[[Category:"..v.."]]"
    end

    return s
end

return p

