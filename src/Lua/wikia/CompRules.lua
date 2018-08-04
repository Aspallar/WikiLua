-- <nowiki>
-- Obtained and Distributed under CC BY-NC-SA 2.5 license (https://creativecommons.org/licenses/by-nc-sa/2.5/)
-- Attribution: original source - https://mtg.gamepedia.com/Module:CR
-- Modified by Aspallar for use on the Magic Arena Wiki (Work in progress)
--    Inline styling removed
--    Last set in title removed
--    Output class names changed to use mdw- convention
--    Some wikitext links in titles changes to plain text
--      (most of the articles do not and probably will never exist on arena wiki)
--    Rules text moved to separate module
--    Removed adding glossary category
--    added class to glossary output, and different title class to rules section

local rulesText = mw.loadData("Module:CompRulesText").text
local CR = {}

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

local LAST_UPDATED_FORMAT = "<p class=\"mdw-cr-title\">From the ''Comprehensive Rules'' (%s)</p>"
local LAST_UPDATED_GLOSSARY_FORMAT = "<p class=\"mdw-cr-title-glossary\">From the glossary of the ''Comprehensive Rules'' (%s)</p>"

-- Escape magic characters in a string.
local sanitize
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

  sanitize = function(s)
    return (gsub(s, ".", matches))
  end
end

local function GetLastUpdate()
    local lastEffectiveDate = match(rulesText, COMP_RULES_DATE_PATTERN)
    return lastEffectiveDate
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

    local i, j, suffix = find(index, "%.(.+)")
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

    local h, a, i, s = ParseIndex(index)

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
    local i, j, index, rest = SplitLine(ruleLine)
    if not index then
        if find(ruleLine, "Example:") then
            ruleLine = "<p class=\"crExample\">''" .. gsub(ruleLine, "(Example:)", "'''%1'''") .. "''</p>"
        end
        return ruleLine, true
    end

    local h, a, i, s = ParseIndex(index)
    -- Major indices and any rule shorter than five words should be a title, so try linking it!
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
            assert(headingName)
            headingName = lower(headingName)
            headingName = gsub(headingName, "^(%S)", upper)
            local expandedLink = format(GENERAL_RULE_EXPANDED_TEXT_FORMAT, headingName)
            rest = format(WIKILINK_ALT_FORMAT, expandedLink, rest)
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

-- Creates a mw.html object matching the styling of the old CR template
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
        local outputLine, isExample, maxIndent, index, _
        for _, line in ipairs(output) do
            outputLine, isExample = StylizeRule(line)
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

                -- if indentLevel > 1 then
                    -- outputLine = "*" .. outputLine
                -- end
                -- outputLine = rep(":",  indentLevel-1) .. outputLine

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
    div:wikitext(format(LAST_UPDATED_GLOSSARY_FORMAT, lastDate))
    div:newline()

    for i, line in ipairs(output) do
        -- Bold the name of the entry for clarity
        if i == 1 then
            div:wikitext(";" .. line .. "\n")
            -- div:newline()
        else
            div:wikitext(":" .. line .. "\n")
        end

    end

    return div
end

function CR.TOC(frame)
    local index = frame.args[1]
    local heading, major, minor, subrule
    -- If there's no index, we want the full TOC. Otherwise, pass it in for validation.
    local fullTOC
    if (not index) or type(index)=="string" and index=="" then
        heading = 1
        fullTOC = true
    else
        heading, major, minor, subrule = ParseIndex(index)
        assert(heading and heading>=1 and heading<=10 and not major and not minor and not subrule, "Invalid table of contents index!")
    end

    local output = {}

    local collecting = false
    for line in gmatch(rulesText, LINE_PATTERN) do
        if match(line, RULE_LINE_PATTERN) then
            if match(line, "^"..heading.."%.") then
                collecting = true
            elseif (not fullTOC) and IsSubsequentRule(line, heading, major, minor, subrule) then
                break
            end

            -- NOT elseif. We want to start collecting lines on the same line we match the target heading
            if collecting then
                tinsert(output, line)
            end
        elseif match(line, TOC_END_LINE_PATTERN) then
            break
        end
    end

    assert(#output > 0, "Index not found! ", index)
    return tostring(CreateRulesDiv(output))
end

-- Basically CR.full but with the full text of an index
function CR.title(frame)
    local title = frame.args[1]
    title = sanitize(title)

    local output = {}
    local passedTOC = false
    local collecting = false
    local heading, major, minor, subrule -- this is a stupid hack to continue using the original index-based stuff
    for line in gmatch(rulesText, LINE_PATTERN) do
        if (not passedTOC) and match(line, TOC_END_LINE_PATTERN) then
            passedTOC = true
        elseif match(line, BODY_END_LINE_PATTERN) then
            break
        elseif passedTOC then   
            if match(line, title.."$") then
                collecting = true
                -- Stupid hack see above
                local _, _, i = SplitLine(line)
                heading, major, minor, subrule = ParseIndex(i)
            elseif collecting and IsSubsequentRule(line, heading, major, minor, subrule) then
                break
            end

            -- NOT elseif. We want to start collecting lines on the same line we match the target heading
            -- ignore whitespace
            if collecting and match(line, "%S") then
                tinsert(output, line)
            end
        end
    end

    assert(#output > 0, "Index not found! " .. title)
    if output then
        return tostring(CreateRulesDiv(output))
    else
        return nil
    end
end

function CR.only(frame)
    local index, additionalLevels = frame.args[1], tonumber(frame.args[2])
    local heading, major, minor, subrule = ParseIndex(index)

    local output = {}
    local passedTOC = false
    local collecting = false
    local ruleDepth, lineDepth = GetNestingDepth(index)
    for line in gmatch(rulesText, LINE_PATTERN) do
        if (not passedTOC) and match(line, TOC_END_LINE_PATTERN) then
            passedTOC = true
        elseif match(line, BODY_END_LINE_PATTERN) then
            break
        elseif passedTOC then
            if match(line, RULE_LINE_PATTERN) then
                if match(line, "^"..index) then
                    collecting = true
                elseif collecting and IsSubsequentRule(line, heading, major, minor, subrule) then
                    break
                end
            end

            -- NOT elseif. We want to start collecting lines on the same line we match the target heading
            -- ignore whitespace
            if collecting and match(line, "%S") then
                if additionalLevels then
                    local _, _, index = SplitLine(line)
                    -- This looks a little weird.
                    -- We only update lineDepth in the case that we're looking at a rules index
                    -- But we capture any line for which it or the preceding index is within our targeting scope
                    -- (examples, mostly)
                    if index then
                        lineDepth = GetNestingDepth(index)
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

    assert(#output > 0, "Index not found! " .. index)
    return tostring(CreateRulesDiv(output))
end

function CR.full(frame)
    local index = frame.args[1]
    local heading, major, minor, subrule = ParseIndex(index)

    local output = {}
    local passedTOC = false
    local collecting = false
    for line in gmatch(rulesText, LINE_PATTERN) do
        if (not passedTOC) and match(line, TOC_END_LINE_PATTERN) then
            passedTOC = true
        elseif match(line, BODY_END_LINE_PATTERN) then
            break
        elseif passedTOC then
            if match(line, RULE_LINE_PATTERN) then
                if match(line, "^"..index) then
                    collecting = true
                elseif collecting and IsSubsequentRule(line, heading, major, minor, subrule) then
                    break
                end
            end

            -- NOT elseif. We want to start collecting lines on the same line we match the target heading
            -- ignore whitespace
            if collecting and match(line, "%S") then
                tinsert(output, line)
            end
        end
    end

    assert(#output > 0, "Index not found! " .. index)
    return tostring(CreateRulesDiv(output))
end

function CR.glossary(frame)
    local lookup = frame.args[1]
    lookup = sanitize(lookup)

    local output = {}
    local passedTOC, passedBody = false, false
    local collecting = false
    for line in gmatch(rulesText, LINE_PATTERN) do
        if (not passedTOC) and match(line, TOC_END_LINE_PATTERN) then
            passedTOC = true
        elseif (not passedBody) and match(line, BODY_END_LINE_PATTERN) then
            passedBody = true
        elseif passedTOC and passedBody and match(line, GLOSSARY_END_LINE_PATTERN) then
            break
        elseif passedBody then
            -- if match(line, "Bury") then
                -- local a,b = {}, {}
                -- line = sanitize(line)
                -- for i=1, #line do tinsert(a, string.byte(line, i)) end
                -- for i=1, #lookup do tinsert(b, string.byte(lookup, i)) end
                -- a = table.concat(a, ",")
                -- b = table.concat(b, ",")
                -- assert(false, a .. ";" .. b)
            -- end
            if match(line, "^"..lookup) then
                collecting = true
            elseif collecting and not match(line, "%w") then
                break
            end

            -- NOT elseif. We want to start collecting lines on the same line we match the target heading
            -- ignore whitespace
            if collecting then
                tinsert(output, line)
            end
        end
    end

    assert(#output > 0, "Glossary entry not found! " .. lookup)
    return tostring(CreateGlossaryDiv(output))
end

function CR.CRTemplateCall(frame)
    local toc, exact, lookup, glossary

    for key, value in pairs(frame.args) do
        if ((key == "toc") and value ~= "") or (value == "toc") then
            toc = true
        elseif ((key == "exact") and value ~= "") or (value == "exact") then
            exact = true
        elseif ((key == "glossary") and value ~= "") or (value == "glossary") then
            glossary = true
        elseif value and value ~= "" then
            assert(not lookup, "Unknown error, multiple lookups ")
            lookup = value
        end
    end
    assert(lookup or toc, "No lookup provided")

    if toc then
        if not lookup then
            return CR.TOC({args={}})
        elseif tonumber(lookup) < 10 then
            return CR.TOC({args={lookup}})
        else
            return CR.only({args={lookup, 1}})
        end
    elseif exact then
        return CR.only({args={lookup}})
    elseif glossary then
        return CR.glossary({args={lookup}})
    else
        if ParseIndex(lookup) then
            return CR.full({args={lookup}})
        else
            local output = CR.title({args={lookup}})
            if output then
                return output
            else
                return CR.glossary({args={lookup}})
            end
        end
    end
end

return CR
-- </nowiki>
