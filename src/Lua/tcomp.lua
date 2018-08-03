require("wikienv")
local compRules = require("wikia\\CompRules")
local result = compRules.title({args={"Lands"}})
print(result)
