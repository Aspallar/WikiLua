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

local format, find, match, gsub, rep = string.format, string.find, string.match, string.gsub, string.rep
local tonumber, tostring, assert, ipairs = tonumber, tostring, assert, ipairs
local tinsert, tconcat = table.insert, table.concat

local LAST_UPDATED_GLOSSARY_FORMAT = "<p class=\"mdw-cr-title-glossary\">''Comprehensive Rules Glossary'' (%s)</p>"
local indexedRuleCategory = "[[Category:Pages with indexed rule]]"

local EscapePattern
do
    local magicChars =
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
    EscapePattern = function(s)
        return (gsub(s, ".", magicChars))
    end
end

local function Preprocess(frame, output)
    local expanded, hasSymbols = utils.ExpandSymbols(output)
    return hasSymbols and frame:preprocess(expanded) or expanded
end

local function ParseLine(ruleLine)
    return match(ruleLine, "^(%d+%.%d*[%.a-kmnp-z]?)%.?%s(.+)")
end

local function RuleDepth(index)
    local depth
    if match(index, "[a-kmnp-z]") then
        -- Subrule, e.g. 100.1a
        depth = 4
    elseif match(index, "%d%.%d") then
        -- Rule, e.g. 100.1
        depth = 3
    elseif match(index, "%d%d+") then
        -- Title, e.g. 102
        depth = 2
    else
        -- Heading, e.g. 1
        depth = 1
    end
    return depth
end

local function ExpandGeneralTitle(index)
    local headingName = match(rulesText, "\n" .. index .. "%. (.-)\n")
    assert(headingName, "Heading name for general section not found")
    local expanded = format("General (%s)", headingName)
    return expanded
end

local function FormatRule(ruleLine)
    local index, rest = ParseLine(ruleLine)
    if index then
        local generalIndex = match(ruleLine, "^(%d%d-)00%.%s+General$")
        if generalIndex then
            rest = ExpandGeneralTitle(generalIndex)
        end
        ruleLine = format("'''%s''' %s", index, rest)
    else
        if find(ruleLine, "Example:") then
            ruleLine = "<p class=\"mdw-comprules-example\">''" .. gsub(ruleLine, "(Example:)", "'''%1'''") .. "''</p>"
        end
    end
    return ruleLine, index
end

local function RulesDiv(lines, postDiv)
    local div = {}
    local prevMax = 0
    local outputLine, maxIndent, indentLevel, index
    tinsert(div, "<div class=\"mdw-comprules\">")
    tinsert(div, format("<p class=\"mdw-cr-title\">''Comprehensive Rules'' (%s)</p>\n", rulesDate))
    for _, line in ipairs(lines) do
        outputLine, index = FormatRule(line)
        if index then
            tinsert(div, "\n")
            maxIndent = RuleDepth(index)
            if not indentLevel then
                indentLevel = 1
            else
                indentLevel = indentLevel + (maxIndent - prevMax)
            end
            prevMax = maxIndent
            tinsert(div, rep("*",  indentLevel))
        elseif not find(outputLine, "Example:") then
            tinsert(div, rep(":",  indentLevel))
        end
        tinsert(div, outputLine)
    end
    tinsert(div, "</div>")
    if (postDiv) then
        tinsert(div, postDiv)
    end
    return tconcat(div)
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
        indexPattern = "^" .. EscapePattern(ParseLine(line))
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
    return RulesLines("\n([^\n]-" .. EscapePattern(title) .. ")\n")
end

local function RulesLinesByIndex(index)
    index = EscapePattern(index)
    return RulesLines("\n(" .. index .. ".-)\n", "^" .. index)
end

local function GlossaryLines(term)
    local line, endpos, _
    _, endpos = find(rulesText, "\nGlossary", rulesStart, true)
    assert(endpos, "Glossary start not found")
    _, endpos, line = find(rulesText, "\n(" .. EscapePattern(term) .. ")\n")
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
    return RulesDiv(output)
end

local function ExactRule(index, additionalLevels)
    additionalLevels = tonumber(additionalLevels)
    local output = {}
    local ruleDepth = RuleDepth(index)
    local lineDepth
    for line in RulesLinesByIndex(index) do
        if additionalLevels then
            local additionalIndex = ParseLine(line)
            if additionalIndex then
                lineDepth = RuleDepth(additionalIndex)
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
    return RulesDiv(output, indexedRuleCategory)
end

local function RulesByIndex(index)
    local output = {}
    for line in RulesLinesByIndex(index) do
        tinsert(output, line)
    end
    assert(#output > 0, "Rules index not found " .. index)
    return RulesDiv(output, indexedRuleCategory)
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
            assert(not lookup, "Multiple rule lookup values specified")
            lookup = value
        end
    end
    assert(lookup, "No lookup value provided")
    if exact then
        result = ExactRule(lookup)
    elseif glossary then
        result = GlossaryTerm(lookup)
    else
        result = match(lookup, "^%d") and RulesByIndex(lookup) or RulesByTitle(lookup)
    end
    return Preprocess(frame, result)
end

return p
--</nowiki>
