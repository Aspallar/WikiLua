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

local totalNumberOfCards = 485
local totalNumberOfOtherCards = 1

local numCardsPerPage = 100

local setNames = {}
setNames["XLN"]="Ixalan"
setNames["RIX"]="Rivals of Ixalan"


function p.SingleCard(name)
    
	local cards = utils.RecreateTable(mw.loadData("Module:Data/Cards"))
	for i = 1, totalNumberOfCards do
    	if cards[i].Name == name then return cards[i] end
	end
end

function p.SingleCardByNumber(cardnumber)
    
	local cards = utils.RecreateTable(mw.loadData("Module:Data/Cards"))
	for i = 1, totalNumberOfCards do
    	if cards[i].CardNumber == cardnumber then return cards[i] end
	end
end
	
function p.SingleCardNonSensitive(name)
    name = string.lower(name)
	local cards = utils.RecreateTable(mw.loadData("Module:Data/Cards"))
	for i = 1, totalNumberOfCards do
    	if string.lower(cards[i].Name) == name then return cards[i] end
	end
	local otherCards = utils.RecreateTable(mw.loadData("Module:Data/OtherCards"))
	for i = 1, totalNumberOfOtherCards do
    	if string.lower(otherCards[i].Name) == name then return otherCards[i] end
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
    for _,ruling in pairs(card.Rulings) do
        s = s..string.format(rulingTemplate,ruling.Date,ruling.Text)
    end
    s = s.."|}"
    return s
end

local function TableContains(t,item)
    if(not t) or (not item) then return false end
    for _,v in pairs(t) do
        if v == item then
            return true
        end
    end
    return false
end

local function splitString(inputstr, sep)
        if sep == nil then
                sep = "$"
        end
        local t={} ; i=1
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                t[i] = str
                i = i + 1
        end
        return t
end

-- Any number of these criteria can be used as arguments for searches.
-- For each one of them, condition can be one of ( ∈ ) a pre-defined set of possibilities.
local criteriaList = {
    -- condition ∈ {White,Blue,Black,Red,Green}
    Color = function(card,condition) return TableContains(card.Colors,condition) end;
    -- condition ∈ {true,false}
    Colorless = function(card,condition) return (card.Colors == nil) == (condition=="true") end;
    Multicolor = function(card,condition) return ((card.Colors ~= nil) and (#utils.RecreateTable(card.Colors) >= 2)) == (condition=="true") end; 
    -- condition ∈ {Any Type, Subtype or Supertype} See their respective wiki pages for an exhaustive list
    Type = function(card,condition) return (TableContains(card.Types,condition) or TableContains(card.SubTypes,condition) or TableContains(card.SuperTypes,condition)) end;
    -- condition ∈ {D,ORI}
    Set = function(card,condition) return (card.SetCode == condition) or (setNames[card.SetCode] == condition) end;
    -- condition ∈ {Common,Uncommon,Rare,Mythic Rare}
    Rarity = function(card,condition) return card.Rarity == condition end;
    -- condition ∈ {Any text}
    Text = function(card,condition) return card.Text ~= nil and string.find(string.lower(card.Text),string.lower(condition)) end;
    NotText = function(card,condition) return card.Text == nil or not string.find(string.lower(card.Text),string.lower(condition)) end;
    -- condition ∈ {Any number}
    CMC = function(card,condition) return (card.cmc or 0) - condition == 0 end;
}


function p.CardMeetsCriteria(card,criteria)
    if criteria and (#criteria > 0) then
        for _,criterion in pairs(criteria) do
            local func,cond = unpack(splitString(criterion))
            if not criteriaList[func](card,cond) then return false end
        end
    end
    
    return true
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
    table.insert(contents,{"Expansion",ExpansionSymbol(card).." [["..setNames[card.SetCode].."]]"}) 
    table.insert(contents,{"Rarity",card.Rarity})
    
    local cardContents = ""
    for i = 1,#contents do 
         cardContents = cardContents .. string.format(cardPageRowTemplate,contents[i][1],contents[i][2])
    end
    
    return string.format(cardPageTemplate,
        cardContents,
        card.Name)..GetRulings(card)..p.GetCardCategories(card)
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

function p.GetCardsTable(frame)
    local criteria = utils.RecreateTable(frame:getParent().args)
    
	local cards = utils.RecreateTable(mw.loadData("Module:Data/Cards"))
	
	local s = ""
	local numresults = 0
	
	for i = 1, totalNumberOfCards do
	    local card = cards[i]
	    if p.CardMeetsCriteria(card,criteria) then
	        s = s..GenerateCardRow(card)
	        numresults = numresults + 1
	    end
    end
    s = [=[! colspan="3" align="right"|]=]..numresults.." result"..(numresults~=1 and "s\n" or "\n")..s
    
	return frame:preprocess(s)
end

local function cardResultPageNavigation(startCard,endCard,numresults,page,linkBase)
return [[! colspan="3" align="right"|Showing results ]]..startCard.." to "..endCard.." out of "..numresults.." "..((page == 1 ) and "" or([=[[[]=]..linkBase.. page - 1 ..[=[|Previous page]]]=])).." "..((startCard+numCardsPerPage>numresults) and "" or ([=[[[]=]..linkBase.. page + 1 ..[=[|Next page]]]=])).."\n"

end

function p.GetPagedCardsTable(frame)
    local criteria = utils.RecreateTable(frame.args)
    local title = frame:getParent():getTitle()
    local titleparts = mw.text.split( title, '/', true )
    local page
    if (#titleparts == 0) or (tonumber(titleparts[#titleparts]) == nil) then
        page = 1
    else
        page = tonumber(titleparts[#titleparts])
        table.remove(titleparts,#titleparts)
    end
    local linkBase = table.concat(titleparts,'/')..'/'
    
	local cards = utils.RecreateTable(mw.loadData("Module:Data/Cards"))
	
	local s = ""
	local numresults = 0
	local validCards = {}
	
	for i = 1, totalNumberOfCards do
	    local card = cards[i]
	    if p.CardMeetsCriteria(card,criteria) then
	        table.insert(validCards,card)
	        numresults = numresults + 1
	    end
end

	local startCard = (page-1)*numCardsPerPage+1
	local endCard = math.min((page-1)*numCardsPerPage+numCardsPerPage,numresults)
	
	
	for i = startCard, endCard do
	    local card = validCards[i]
	    if p.CardMeetsCriteria(card,criteria) then
	        s = s..GenerateCardRow(card)
	    end
    end
    s = cardResultPageNavigation(startCard,endCard,numresults,page,linkBase)..s.."\n|-\n"..cardResultPageNavigation(startCard,endCard,numresults,page,linkBase)
    
	return frame:preprocess(s)
end

function p.GetAnyCardRow(frame)
	local name = frame.args[1]
	local card = p.SingleCardNonSensitive(name)
    
	return frame:preprocess(GenerateAnyCardRow(card))
end

local function GetCardPage(name)
	local card = p.SingleCard(name)
    
    if not card then
    	local cards = utils.RecreateTable(mw.loadData("Module:Data/OtherCards"))
    	for i = 1, totalNumberOfOtherCards do
        	if cards[i].Name == name then card = cards[i] end
    	end
    	
        if not card then
            return "There was an error generating this page. We're aware of it and will fix it soon.{{PagesWithScriptErrors}}"
        else
            return GenerateOtherCardPage(card)
        end
    end
    
    if card.CardNumber and (string.find(card.CardNumber,"a")) then
        card2 = p.SingleCardByNumber(string.gsub(card.CardNumber,"a","b"))
	    return GenerateCardPage(card).."\n{{clear}}\n<big><big><big>"..card2.Name.."</big></big></big>\n"..GenerateCardPage(card2)
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

local function ConcatTables(target,source)
    if not source then return end
    for _,v in pairs(source) do
        table.insert(target,v)   
    end
end

function p.GetCardCategories(card)
    local categories = {}
    table.insert(categories,"Cards")
    table.insert(categories,setNames[card.SetCode])
    ConcatTables(categories,card.Colors)
    table.insert(categories,card.Rarity)
    ConcatTables(categories,card.SuperTypes)
    ConcatTables(categories,card.Types)
    ConcatTables(categories,card.SubTypes)
    if card.Watermark then table.insert(categories,card.Watermark) end
    
    local s = ""
    for _,v in pairs(categories) do
         s = s .. "[[Category:"..v.."]]"
    end
    
    return s
end


return p

