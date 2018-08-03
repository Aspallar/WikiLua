require("wikienv")
local compRules = require("wikia\\CompRules")
local result = compRules.glossary({args={"Ability"}})
print(result)
