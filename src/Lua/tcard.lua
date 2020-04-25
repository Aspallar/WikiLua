require("wikienv")
local cards = require("wikia\\cards")
local pageName = arg[1] and arg[1] or "Plains"

local function Preprocess(self, s) -- luacheck: ignore 212
    if (s == "{{PAGENAMEE}}") then
        return pageName
    else
        return s
    end
end

local result = cards.GetCardPage({ preprocess=Preprocess })
print(result)
