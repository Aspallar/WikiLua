-- <nowiki>
-- Obtained and Distributed under CC BY-NC-SA 2.5 license (https://creativecommons.org/licenses/by-nc-sa/2.5/)
-- Attribution: original source - https://mtg.gamepedia.com/Module:CR
-- Modified by Aspallar for use on the Magic Arena Wiki (Work in progress)
--    Inline styling removed
--    Last set in title removed
--    Output class names changed to use mdw- convention
--    Some wikitext links in titles changed to plain text
--       (as most of the articles do not and probably will never exist on arena wiki)
--    Rules text moved to separate module loaded by mw.loadData
--    Removed adding glossary category
--    added class to glossary output, and different title class to rules section
--    added category to output for rules obtained by index number
--    added expanding symbols to appropriate template in output
--    removed TOC handling, no requirement for it on Arena Wiki
--    don't bold 1st line of glossary if there is only one line

local utils = require("Module:TemplateUtils")
local rulesText = mw.loadData("Module:CompRulesText").text
local p = {}

-- locals for performance
local format, find, match, sub, gsub, gmatch, rep, lower, upper = string.format, string.find, string.match, string.sub, string.gsub, string.gmatch, string.rep, string.lower, string.upper
local tonumber, tostring, type, assert, ipairs = tonumber, tostring, type, assert, ipairs
local tinsert = table.insert

-- We need to split the text via LINE_PATTERN before we can use the beginning-of-string caret
-- Otherwise, we would need a more complicated pattern to match all possible indices
-- (Off the top of my head, I'm not sure Lua's pattern matching *could* do it in one pattern. It's not a full regex suite.)
local LINE_PATTERN = "(.-)\n"
local RULE_LINE_PATTERN = "^%d"
local TOC_END_LINE_PATTERN = "^Glossary"
local BODY_END_LINE_PATTERN  = "^Glossary"
local GLOSSARY_MARKER = "\nGlossary"
local GLOSSARY_END_LINE_PATTERN = "^Credits"
local GENERAL_RULE_PATTERN = "General"

-- local WIKILINK_ALT_FORMAT = "[[%s|%s]]" -- This changed to line below as we don't want links on arena wiki
local WIKILINK_ALT_FORMAT = "%s"
local GENERAL_RULE_EXPANDED_TEXT_FORMAT = "General_(%s)"

-- Note that, per the Introduction to the Comprehensive Rules, the subrules skip the letters L and O to avoid confusion with numerals.
local INDEX_SUBRULE_CHARACTER_SET = "ABCDEFGHIJKMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz"

-- This is the format of the line in the Comp Rules where the date is found. As of last edit, it's the second line of text.
-- The date itself is wrapped in parentheses to extract that text alone.
local COMP_RULES_DATE_PATTERN = "These rules are effective as of ([^%.]+)."

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

local function GetLastUpdate()
    local lastEffectiveDate = match(rulesText, COMP_RULES_DATE_PATTERN)
    return lastEffectiveDate
end

local function Preprocess(frame, output)
    local hasSymbols
    output, hasSymbols = utils.ExpandSymbols(output)
    return hasSymbols and frame:preprocess(output) or output
end

local function SplitLine(ruleLine)
     -- Finds the index and the rest. If the index has an extra period, it is considered a formatting issue in the CR and is therefore ignored.
    local i, j, index, rest = find(ruleLine, "^(%d+%.%d*[%.a-kmnp-z]?)%.?%s(.+)")
    return i, j, index, rest
end

--[[
    Chops up and validates an index.
    Individually breaking down index parts here for ease of comprehension and future maintenance.
    Yes, a clever soul could streamline this with more complex pattern matching.
    Clever and absolute performance are not the goals. Editability by anonymous maintainers is.

    heading, major, and minor should all be number or nil
    returns false instead if the string provided is not an index
--]]
local function ParseIndex(index)
    local heading, major, minor, subrule

    if match(index, "%s") then
        return false
    end

    local i, _, suffix = find(index, "%.(.+)")
    if suffix then
        -- If the last character in the suffix is alphanumeric (and not L or O), set the subrule
        subrule = match(sub(suffix, -1), "(["..INDEX_SUBRULE_CHARACTER_SET.."])")
        -- If that was successful, cut that character off the suffix.
        if subrule then
            suffix = sub(suffix, 1, -2)
        end

        -- Now we can easily check whether the part between the period and the letter is a number.
        -- If so, that's our minor index
        minor = tonumber(suffix)
        assert(type(minor) == "number", "Invalid index!")

        -- Now cut off the entire suffix and let's parse the rest
        index = sub(index, 1, i-1)
    end

    -- Getting the heading and major index is just some number manipulation
    index = tonumber(index)
    -- assert(type(index) == "number", "Invalid index!")
    if not index then
        return false
    end

    if index >= 100 then
        major = index%100
        heading = math.floor(index/100)
    else
        -- The body of the rules starts at 100, lower values are headings
        heading = index
    end

    return heading, major, minor, subrule
end

local function IsSubsequentRule(line, heading, major, minor, subrule)
    local _, _, index = SplitLine(line)
    if not index then
        return false
    end

    local h, a, i, _ = ParseIndex(index)

    if subrule then
        -- We can cheat like hell if we're dealing with subrules because there's no further nesting
        -- Therefore, the next line is the next rule by definition
        -- That said, if this ever changes, this snippet might be useful
        --[[
            -- Yes, this makes assumptions about character encoding and subrules never numbering more than 24 for a given rule
            local i = find(INDEX_SUBRULE_CHARACTER_SET, subrule) + 1
            nextIndex = sub(INDEX_SUBRULE_CHARACTER_SET, i, i)
        --]]
        return true
    elseif i and minor and i > minor then
        return true
    elseif a and major and a > major then
        return true
    elseif h and heading and h > heading then
        return true
    end
end

local function GetNestingDepth(index)
    local depth
    -- Subrules, e.g. 103.7a
    if match(index, "["..INDEX_SUBRULE_CHARACTER_SET.."]") then
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
    local link = lower(title)
    -- convert the first letter back to uppercase
    link = gsub(link, "^(%S)", upper)
    local t = format(WIKILINK_ALT_FORMAT, link, title)
    return t
end

local function StylizeRule(ruleLine)
    local i, _, index, rest = SplitLine(ruleLine)
    if not index then
        if find(ruleLine, "Example:") then
            ruleLine = "<p class=\"mdw-comprules-example\">''" .. gsub(ruleLine, "(Example:)", "'''%1'''") .. "''</p>"
        end
        return ruleLine, true
    end

    local h, a, _, _ = ParseIndex(index)
    -- Major indices and any rule shorter than five words should be a title
    -- (this is probably a stupid assumption let's see how long before we get burned)
    if (h and a and not i) then
        -- Because each heading in the CR has a "General" section, expand that to "General_(name of header)"
        if find(rest, GENERAL_RULE_PATTERN) then
            local headingName
            for line in gmatch(rulesText, LINE_PATTERN) do
                headingName = match(line, "^"..h.."%. (.+)")
                if headingName then
                    break
                end
            end
            assert(headingName, "Heading name not found")
            headingName = lower(headingName)
            headingName = gsub(headingName, "^(%S)", upper)
            local expanded = format(GENERAL_RULE_EXPANDED_TEXT_FORMAT, headingName)
            rest = format(WIKILINK_ALT_FORMAT, expanded, rest)
        else
            rest = Titleize(rest)
        end
    else
        local _, numWords = gsub(rest, "%S+", "")
        if numWords < 5 then
            rest = Titleize(rest)
        end
    end

    return format("'''%s''' %s", index, rest)
end

local function CreateRulesDiv(output)
    local div = mw.html.create("div"):addClass("mdw-comprules")

    local lastDate = GetLastUpdate()
    div:wikitext(format(LAST_UPDATED_FORMAT, lastDate))
    div:newline()
    if type(output) == "string" then
        local line = StylizeRule(output)
        div:wikitext("* ", line)
    else
        local indentLevel
        local prevMax = 0
        local outputLine, maxIndent, index
        for _, line in ipairs(output) do
            outputLine, _ = StylizeRule(line)
            _, _, index = SplitLine(line)
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
    local lastDate = GetLastUpdate()
    local numlines = #output
    div:wikitext(format(LAST_UPDATED_GLOSSARY_FORMAT, lastDate))
    div:newline()
    for i, line in ipairs(output) do
        -- Bold the name of the entry for clarity
        if i == 1 and numlines > 1 then
            div:wikitext(";" .. line .. "\n")
        else
            div:wikitext(":" .. line .. "\n")
        end
    end
    return div
end

local function GetRulesLines()
    local lines = gmatch(rulesText, LINE_PATTERN)
    for line in lines do
        if match(line, TOC_END_LINE_PATTERN) then
            break
        end
    end
    return lines
end

local function GetGlossaryLines()
    local _, endpos = find(rulesText, GLOSSARY_MARKER, nil, true)
    _, endpos = find(rulesText, GLOSSARY_MARKER, endpos, true)
    assert(endpos, "Glossary not found")
    return gmatch(sub(rulesText, endpos + 1), LINE_PATTERN)
end

local function RulesByTitle(title)
    local output = {}
    local collecting = false
    local heading, major, minor, subrule -- this is a stupid hack to continue using the original index-based stuff
    title = Sanitize(title)
    for line in GetRulesLines() do
        if match(line, BODY_END_LINE_PATTERN) then
            break
        else
            if match(line, title.."$") then
                collecting = true
                -- Stupid hack see above
                local _, _, i = SplitLine(line)
                heading, major, minor, subrule = ParseIndex(i)
            elseif collecting and IsSubsequentRule(line, heading, major, minor, subrule) then
                break
            end
            if collecting and match(line, "%S") then
                tinsert(output, line)
            end
        end
    end
    assert(#output > 0, "Rules title not found! " .. title)
    if output then
        return tostring(CreateRulesDiv(output))
    else
        return nil
    end

end

local function ExactRule(index, additionalLevels)
    additionalLevels = tonumber(additionalLevels)
    local heading, major, minor, subrule = ParseIndex(index)
    local output = {}
    local collecting = false
    local ruleDepth, lineDepth = GetNestingDepth(index)
    for line in GetRulesLines() do
        if match(line, BODY_END_LINE_PATTERN) then
            break
        else
            if match(line, RULE_LINE_PATTERN) then
                if match(line, "^"..index) then
                    collecting = true
                elseif collecting and IsSubsequentRule(line, heading, major, minor, subrule) then
                    break
                end
            end
            if collecting and match(line, "%S") then
                if additionalLevels then
                    local _, _, additionalIndex = SplitLine(line)
                    -- This looks a little weird.
                    -- We only update lineDepth in the case that we're looking at a rules index
                    -- But we capture any line for which it or the preceding index is within our targeting scope
                    -- (examples, mostly)
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
        end
    end
    assert(#output > 0, "Rules index not found! " .. index)
    return tostring(CreateRulesDiv(output))
end

local function RulesByIndex(index)
    local heading, major, minor, subrule = ParseIndex(index)

    local output = {}
    local collecting = false
    for line in GetRulesLines() do
        if match(line, BODY_END_LINE_PATTERN) then
            break
        else
            if match(line, RULE_LINE_PATTERN) then
                if match(line, "^"..index) then
                    collecting = true
                elseif collecting and IsSubsequentRule(line, heading, major, minor, subrule) then
                    break
                end
            end
            if collecting and match(line, "%S") then
                tinsert(output, line)
            end
        end
    end

    assert(#output > 0, "Rules index not found! " .. index)
    return tostring(CreateRulesDiv(output)) .. "[[Category:Pages with indexed rule]]"
end

local function GlossaryTerm(term)
    term = Sanitize(term)
    local output = {}
    local collecting = false
    for line in GetGlossaryLines() do
        if match(line, GLOSSARY_END_LINE_PATTERN) then
            break
        else
            if match(line, "^"..term) then
                collecting = true
            elseif collecting and not match(line, "%w") then
                break
            end
            if collecting then
                tinsert(output, line)
            end
        end
    end

    assert(#output > 0, "Glossary term not found! " .. term)
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
    local exact, lookup, glossary, result

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
-- </nowiki>
