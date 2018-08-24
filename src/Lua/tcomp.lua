require("wikienv")
local compRules = require("wikia\\CompRules")
-- luacheck: push ignore 212
local function Preprocess(self, s)
    return s
end
-- luacheck: pop
local result = compRules.ExtractRulesByIndex({ preprocess=Preprocess, args={"801.2"} })
print(result)
