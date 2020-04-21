require("wikienv")
local decks = require("wikia\\decks")
local inputList = [=[
Commander
1 Torbran, Thane of Red Fell (ELD) 147
Deck
1 Sundering Stroke (ELD) 144
1 Chandra's Embercat (M20) 129
19 Mountain (ANA) 64
1 Chandra's Pyrohelix (WAR) 120
1 Chandra's Regulator (M20) 131
1 Chandra's Triumph (WAR) 121|
1 Chandra, Acolyte of Flame (M20) 126
1 Chandra's Spitfire (M20) 132
1 Chandra, Fire Artisan (WAR) 119
1 Thunderkin Awakener (M20) 162
1 Mask of Immolation (M20) 151
1 Chandra's Flame Wave (M20) 295
1 Chandra, Awakened Inferno (M20) 127
1 Shock (M20) 160
1 Infuriate (M20) 145
1 Grim Initiate (WAR) 130
1 Scorch Spitter (M20) 159
1 Runaway Steam-Kin (GRN) 115
1 Smelt-Ward Ignus (RNA) 116
1 Chandra, Novice Pyromancer (M20) 128
1 Chandra's Outrage (M20) 130
1 Drakuseth, Maw of Flames (M20) 136
1 Fire Urchin (GRN) 101
1 Scampering Scorcher (M20) 158
1 Castle Embereth (ELD) 239
1 Dwarven Mine (ELD) 243
1 Claim the Firstborn (ELD) 118
1 Fervent Champion (ELD) 124
1 Irencrag Feat (ELD) 127
1 Cavalcade of Calamity (RNA) 95
1 Mirror March (RNA) 108
1 Fires of Invention (ELD) 125
1 Leyline of Combustion (M20) 148
1 Scorching Dragonfire (ELD) 139
1 Risk Factor (GRN) 113
1 Bonecrusher Giant (ELD) 115
1 Repeated Reverberation (M20) 156
1 Tectonic Rift (M20) 161
1 Rubble Reading (RNA) 110
1 Demolish (WAR) 123
1 Lavakin Brawler (M20) 147
]=]

local result = decks.TestGenerateDeckFromList("Test Deck", inputList, "none")
print(result)
