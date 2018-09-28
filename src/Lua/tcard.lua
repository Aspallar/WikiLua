require("wikienv")
local cards = require("wikia\\cards")
local pageName = arg[1] and arg[1] or "Plains"
-- luacheck: push ignore 212
local function Preprocess(self, s)
    if (s == "{{PAGENAMEE}}") then
        return pageName
    else
        return s
    end
end
-- luacheck: pop
local result = cards.GetCardPage({ preprocess=Preprocess })
print(result)
