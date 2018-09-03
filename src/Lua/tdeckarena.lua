require("wikienv")
local decks = require("wikia\\decks")
local inputList = [=[
1 Consign /// Oblivion (HOU) 149
4 Rekindling Phoenix (RIX) 111
20 Mountain (RIX) 195
4     Fanatical Firebrand (RIX) 101
3 Rigging Runner (XLN) 157
3 Lightning Strike (XLN) 149
3 Goblin Trailblazer (RIX) 105   
1 Tilonalli's Summoner (RIX) 121
1 Captain Lannery Storm (XLN) 136

   

2 Sure Strike (XLN) 166
2 Fiery Cannonade (XLN) 143
2 Hijack (XLN) 148
3 Charging Monstrosaur (XLN) 138
2 Vance's Blasting Cannons (XLN) 173
1 Rampaging Ferocidon (XLN) 154
2 Nest Robber (XLN) 152
3 Daring Buccaneer (RIX) 98
1 Arch of Orazca (RIX) 185
2 Field of Ruin (XLN) 254
1 Mutiny (RIX) 106]=]

local result = decks.TestGenerateDeckFromList("Test Deck",inputList)
print(result)

