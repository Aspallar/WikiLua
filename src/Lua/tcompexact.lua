require("wikienv")
local compRules = require("wikia\\CompRules")
-- luacheck: push ignore 212
local function Preprocess(self, s)
    return s
end
-- luacheck: pop
local result = compRules.ExtractExactRule({ preprocess=Preprocess, args={"702", 1} })
print(result)
