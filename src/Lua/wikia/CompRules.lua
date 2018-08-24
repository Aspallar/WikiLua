--<nowiki>
-- Obtained and Distributed under CC BY-NC-SA 2.5 license (https://creativecommons.org/licenses/by-nc-sa/2.5/)
-- Attribution: original source - https://mtg.gamepedia.com/index.php?title=Module:CR&oldid=297404
-- Modified by Aspallar for use on the Magic Arena Wiki

local utils = require("Module:TemplateUtils")
local p = {}

local rulesText, rulesDate, rulesStart
do
    local rulesData = mw.loadData("Module:CompRulesText")
    rulesText = rulesData.Text
    rulesDate = rulesData.LastUpdate
    rulesStart = rulesData.RulesStart
end

-- locals for performance
local format, find, match, gsub, rep = string.format, string.find, string.match, string.gsub, string.rep
local tonumber, tostring, type, assert, ipairs = tonumber, tostring, type, assert, ipairs
local tinsert = table.insert

local LAST_UPDATED_FORMAT = "<p class=\"mdw-cr-title\">''Comprehensive Rules'' (%s)</p>"
local LAST_UPDATED_GLOSSARY_FORMAT = "<p class=\"mdw-cr-title-glossary\">''Comprehensive Rules Glossary'' (%s)</p>"

-- Escape magic characters in a string.
local Sanitize
do
    local matches =
    {
    ["^"] = "%^";
    ["$"] = "%$";
    ["("] = "%(";
    [")"] = "%)";
    ["%"] = "%%";
    ["."] = "%.";
    ["["] = "%[";
    ["]"] = "%]";
    ["*"] = "%*";
    ["+"] = "%+";
    ["-"] = "%-";
    ["?"] = "%?";
    }
    Sanitize = function(s)
        return (gsub(s, ".", matches))
    end
end

local function Preprocess(frame, output)
    local expanded, hasSymbols = utils.ExpandSymbols(output)
    return hasSymbols and frame:preprocess(expanded) or expanded
end

local function SplitLine(ruleLine)
     -- Finds the index and the rest. If the index has an extra period, it is considered a formatting issue in the CR and is therefore ignored.
    local index, rest = match(ruleLine, "^(%d+%.%d*[%.a-kmnp-z]?)%.?%s(.+)")
    return index, rest
end

local function ParseIndex(index)
    local heading, major
    local main, minor, subrule = match(index, "^(%d+)%.?(%d*)([a-kmnp-z]?)%.?$")
    main = tonumber(main)
    minor = tonumber(minor)
    if subrule == "" then subrule = nil end
    if not main or (subrule and not minor) then
        return false;
    else
        -- The body of the rules starts at 100, lower values are headings
        if main >= 100 then
            heading = math.floor(main / 100)
            major = main % 100
        else
            heading = main
        end
        return heading, major, minor, subrule
    end
end

local function GetNestingDepth(index)
    local depth
    -- Subrules, e.g. 103.7a
    if match(index, "[a-kmnp-z]") then
        depth = 4
    -- Rules, e.g. 112.1
    elseif match(index, "%d%.%d") then
        depth = 3
    -- Titles, e.g. 102
    elseif match(index, "%d%d+") then
        depth = 2
    -- Headings, e.g. 1
    else
        depth = 1
    end
    return depth
end

local function Titleize(title)
    -- this used to turn title into a [[page|title]] link
    -- we don't want this behaviour on arena wiki because most of them would be red links
    -- Left here in case we ever want to enclose titles in a <span> for styling
    return title
end

local function GetGeneralTitle(heading)
    local headingName = match(rulesText, "\n" .. heading .. "%. (.-)\n")
    assert(headingName, "Heading name for general section not found")
    local expanded = format("General (%s)", headingName)
    return Titleize(expanded)
end

local function StylizeRule(ruleLine)
    local index, rest = SplitLine(ruleLine)
    if not index then
        if find(ruleLine, "Example:") then
            ruleLine = "<p class=\"mdw-comprules-example\">''" .. gsub(ruleLine, "(Example:)", "'''%1'''") .. "''</p>"
        end
    else
        local heading, major, minor, _ = ParseIndex(index)
        -- Major indices and any rule shorter than five words should be a title
        -- (this is probably a stupid assumption let's see how long before we get burned)
        if (heading and major and not minor) then
            -- Because a heading name may just be "General", expand that to "General (name of section)"
            rest = find(rest, "^General") and GetGeneralTitle(heading) or Titleize(rest)
        else
            local _, numWords = gsub(rest, "%S+", "")
            if numWords < 5 then rest = Titleize(rest) end
        end
        ruleLine = format("'''%s''' %s", index, rest)
    end
    return ruleLine
end

local function CreateRulesDiv(output)
    local div = mw.html.create("div"):addClass("mdw-comprules")
    div:wikitext(format(LAST_UPDATED_FORMAT, rulesDate))
    div:newline()
    if type(output) == "string" then
        local line = StylizeRule(output)
        div:wikitext("* ", line)
    else
        local indentLevel
        local prevMax = 0
        local outputLine, maxIndent, index
        for _, line in ipairs(output) do
            outputLine = StylizeRule(line)
            index = SplitLine(line)
            if index then
                div:newline()
                maxIndent = GetNestingDepth(index)
                if not indentLevel then
                    indentLevel = 1
                else
                    indentLevel = indentLevel + (maxIndent - prevMax)
                end
                prevMax = maxIndent
                outputLine = rep("*",  indentLevel) .. outputLine
            else
                if not find(outputLine, "Example:") then
                    outputLine = rep(":",  indentLevel) .. outputLine
                else
                    outputLine = outputLine
                end
            end
            div:wikitext(outputLine)
        end
    end
    return div
end

local function CreateGlossaryDiv(output)
    local div = mw.html.create("div"):addClass("mdw-comprules-glossary")
    div:wikitext(format(LAST_UPDATED_GLOSSARY_FORMAT, rulesDate))
    div:newline()
    for i, line in ipairs(output) do
        -- Bold the name of the entry for clarity
        if i == 1 then
            div:wikitext(";" .. line .. "\n")
        else
            div:wikitext(":" .. line .. "\n")
        end
    end
    return div
end

local function RulesLines(startPattern, indexPattern)
    local line, endpos, _
    _, endpos, line = find(rulesText, startPattern, rulesStart)
    if line and not indexPattern then
        indexPattern = "^" .. Sanitize(SplitLine(line))
    end
    return function ()
        if not endpos then return nil end
        local currentLine, _ = line
        repeat
            _, endpos, line = find(rulesText, "(.-)\n", endpos + 1)
        until not line or match(line, "%S")
        if line and ((not match(line,"^[^%d]") and not match(line, indexPattern)) or match(line, "^Glossary")) then
            endpos = nil
        end
        return currentLine
    end
end

local function RulesLinesByTitle(title)
    return RulesLines("\n([^\n]-" .. Sanitize(title) .. ")\n")
end

local function RulesLinesByIndex(index)
    index = Sanitize(index)
    return RulesLines("\n(" .. index .. ".-)\n", "^" .. index)
end

local function GlossaryLines(term)
    local line, endpos, _
    _, endpos = find(rulesText, "\nGlossary", rulesStart, true)
    assert(endpos, "Glossary start not found")
    _, endpos, line = find(rulesText, "\n(" .. Sanitize(term) .. ")\n")
    return function ()
        local currentLine, _ = line
        _, endpos, line = find(rulesText, "(.-)\n", endpos + 1)
        if line and (not match(line, "%S") or match(line, "^Credits")) then
            line = nil
        end
        return currentLine
    end
end

local function RulesByTitle(title)
    local output = {}
    for line in RulesLinesByTitle(title) do
        tinsert(output, line)
    end
    assert(#output > 0, "Rules title not found! " .. title)
    return tostring(CreateRulesDiv(output))
end

local function ExactRule(index, additionalLevels)
    additionalLevels = tonumber(additionalLevels)
    local output = {}
    local ruleDepth = GetNestingDepth(index)
    local lineDepth
    for line in RulesLinesByIndex(index) do
        if additionalLevels then
            local additionalIndex = SplitLine(line)
            if additionalIndex then
                lineDepth = GetNestingDepth(additionalIndex)
            end
            if lineDepth <= ruleDepth + additionalLevels then
                tinsert(output, line)
            end
        else
            tinsert(output, line)
            break
        end
    end
    assert(#output > 0, "Exact rules index not found " .. index)
    return tostring(CreateRulesDiv(output))
end

local function RulesByIndex(index)
    local output = {}
    for line in RulesLinesByIndex(index) do
        tinsert(output, line)
    end
    assert(#output > 0, "Rules index not found " .. index)
    return tostring(CreateRulesDiv(output)) .. "[[Category:Pages with indexed rule]]"
end

local function GlossaryTerm(term)
    local output = {}
    for line in GlossaryLines(term) do
        tinsert(output, line)
    end
    assert(#output > 0, "Glossary term not found " .. term)
    return tostring(CreateGlossaryDiv(output))
end

-- Exports

function p.ExtractExactRule(frame)
    return Preprocess(frame, ExactRule(frame.args[1], frame.args[2]))
end

function p.ExtractRulesByIndex(frame)
    return Preprocess(frame, RulesByIndex(frame.args[1]))
end

function p.ExtractRulesByTitle(frame)
    return Preprocess(frame, RulesByTitle(frame.args[1]));
end

function p.ExractGlossaryTerm(frame)
    return Preprocess(frame, GlossaryTerm(frame.args[1]))
end

function p.RulesExtract(frame)
    local exact, lookup, glossary = false, false, false
    local result

    for key, value in pairs(frame.args) do
        if ((key == "exact") and value ~= "") or (value == "exact") then
            exact = true
        elseif ((key == "glossary") and value ~= "") or (value == "glossary") then
            glossary = true
        elseif value and value ~= "" then
            assert(not lookup, "Multiple lookups specified")
            lookup = value
        end
    end
    assert(lookup, "No lookup value provided")
    if exact then
        result = ExactRule(lookup)
    elseif glossary then
        result = GlossaryTerm(lookup)
    else
        result = ParseIndex(lookup) and RulesByIndex(lookup) or RulesByTitle(lookup)
    end
    return Preprocess(frame, result)
end

return p
--</nowiki>
