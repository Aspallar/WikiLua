require("wikienv")
local decks = require("wikia\\decks")
-- local inputList = [=[
-- 4 Rekindling Phoenix
-- 20 Mountain
-- 4 Fanatical Firebrand
-- 3 Rigging Runner
-- 3 Lightning Strike
-- 3 Goblin Trailblazer
-- 1 Tilonalli's Summoner
-- 1 Captain Lannery Storm
-- 2 Sure Strike
-- 2 Fiery Cannonade
-- 2 Hijack
-- 1 Legion Conquistador
-- 3 Charging Monstrosaur
-- 2 Vance's Blasting Cannons
-- 1 Rampaging Ferocidon
-- 2 Nest Robber
-- 3 Daring Buccaneer
-- 1 Arch of Orazca
-- 2 Field of Ruin
-- 1 Mutiny]=]
local inputList = [=[

20 Mountain
1 Legion Conquistador
2 Arch of Orazca

]=]

local result = decks.TestGenerateDeckFromList("Test Deck",inputList)
print(result)

