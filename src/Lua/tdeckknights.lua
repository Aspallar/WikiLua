require("wikienv")
local decks = require("wikia\\decks")

local inputList = [=[
3 Aryel, Knight of Windgrace
2 Baffling End
4 Benalish Marshal
2 call the cavalry
3 Cast Down
4 Dauntless Bodyguard
4 Forsaken Sanctuary
4 History of Benalia
4 Isolated Chapel
2 Ixalan's Binding
4 Knight of Grace
4 Knight of Malice
13 Plains
4 Radiant Destiny
2 Swamp
1 Vanquisher's Banner]=]

local result = decks.TestGenerateDeckFromList("Test Deck",inputList)
print(result)

