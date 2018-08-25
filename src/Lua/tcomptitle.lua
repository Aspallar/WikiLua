require("wikienv")
local compRules = require("wikia\\CompRules")
-- luacheck: push ignore 212
local function Preprocess(self, s)
    return s
end
-- luacheck: pop
local lookup = arg[1] and arg[1] or "Lands"
local result = compRules.ExtractRulesByTitle({ preprocess=Preprocess, args={lookup} })
print(result)
