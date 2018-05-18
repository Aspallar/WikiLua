require("wikienv")
local decks = require("wikia\\decks")
local inputList = [=[
4 Snubhorn Sentry
3 Soul of the Rapids
4 Opt
4 Baffling End
2 Censor
3 Essence Scatter
2 Cancel
4 Secrets of the Golden City
3 Supreme Will
2 Cast Out
3 Ixalan's Binding
2 Hieroglyphic Illumination
4 Evolving Wilds
4 Meandering River
10 Island
6 Plains
2 Woodland Stream
--
2 Woodland Stream
4 Air Elemental
4 Ancient Crab
4 Aerial Guide
2 Aquatic Incursion
1 As Foretold]=]

local result = decks.TestGenerateDeckFromList("Test Deck",inputList)
print(result)

