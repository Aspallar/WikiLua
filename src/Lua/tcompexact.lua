require("wikienv")
local compRules = require("wikia\\CompRules")
-- luacheck: push ignore 212
local function Preprocess(self, s)
    return s
end
-- luacheck: pop
local lookup = arg[1] and arg[1] or "702"
local result = compRules.ExtractExactRule({ preprocess=Preprocess, args={lookup, arg[2]} })
print(result)
