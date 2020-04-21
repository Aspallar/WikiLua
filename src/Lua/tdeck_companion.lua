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

-- 3 Abandoned Sarcophagus
-- 1 Academy Drake

local inputList = [=[
Companion
1 Lurrus of the Dream Den (IKO) 226
Deck
14 Plains (IKO) 260
14 Swamp (IKO) 266
4 Alseid of Life's Bounty (THB) 1
4 Arrester's Zeal (RNA) 4
4 Beloved Princess (ELD) 7
4 Charmed Stray (WAR) 8
4 Healer's Hawk (GRN) 14
4 Cauldron Familiar (ELD) 81
4 Twilight Panther (RNA) 28
4 Dead Weight (GRN) 67
--
1 Lurrus of the Dream Den (IKO) 226
4 Duress (M20) 97
4 Foulmire Knight (ELD) 90
4 Elite Arrester (RNA) 266
2 Haazda Marshal (GRN) 13]=]
local result = decks.TestGenerateDeckFromList("Cpmpanion Deck", inputList, "none")
print(result)

