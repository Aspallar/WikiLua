/*jshint -W043 */ // allow multiline strings
/*jshint -W109 */ // strungs must use single quote
console.log("cardnames.js");
var globalCardnames = "Abandoned Sarcophagus|C\n\
Abrade|R\n\
Academy Drake|U\n\
Academy Journeymage|U\n\
Accomplished Automaton|C\n\
Accursed Horde|B\n\
Acrobatic Maneuver|W\n\
Act of Heroism|W\n\
Adamant Will|W\n\
Adanto Vanguard|W\n\
Adeliz, the Cinder Wind|UR\n\
Admiral Beckett Brass|UBR\n\
Admiral's Order|U\n\
Adorned Pouncer|W\n\
Adventurous Impulse|G\n\
Aegis Automaton|C\n\
Aerial Guide|U\n\
Aerial Modification|W\n\
Aerial Responder|W\n\
Aeronaut Admiral|W\n\
Aesthir Glider|C\n\
Aether Chaser|R\n\
Aether Herder|G\n\
Aether Hub|L\n\
Aether Inspector|W\n\
Aether Meltdown|U\n\
Aether Poisoner|B\n\
Aether Swooper|U\n\
Aether Theorist|U\n\
Aether Tradewinds|U\n\
Aetherborn Marauder|B\n\
Aetherflux Reservoir|C\n\
Aethergeode Miner|W\n\
Aethersphere Harvester|C\n\
Aethersquall Ancient|U\n\
Aetherstorm Roc|W\n\
Aetherstream Leopard|G\n\
Aethertide Whale|U\n\
Aethertorch Renegade|R\n\
Aetherwind Basker|G\n\
Aetherworks Marvel|C\n\
Aggressive Urge|G\n\
Ahn-Crop Champion|WG\n\
Ahn-Crop Crasher|R\n\
Aid from the Cowl|G\n\
Air Elemental|U\n\
Airdrop Aeronauts|W\n\
Ajani Unyielding|WG\n\
Ajani, Valiant Protector|WG\n\
Ajani's Aid|WG\n\
Ajani's Comrade|G\n\
Alley Evasion|W\n\
Alley Strangler|B\n\
Amaranthine Wall|C\n\
Ambitious Aetherborn|B\n\
Ambuscade|G\n\
Ammit Eternal|B\n\
Ancient Animus|G\n\
Ancient Brontodon|G\n\
Ancient Crab|U\n\
Angel of Condemnation|W\n\
Angel of Invention|W\n\
Angel of Sanctions|W\n\
Angel of the God-Pharaoh|W\n\
Angler Drake|U\n\
Angrath, Minotaur Pirate|BR\n\
Angrath, the Flame-Chained|BR\n\
Angrath's Ambusher|B\n\
Angrath's Fury|BR\n\
Angrath's Marauders|R\n\
Animation Module|C\n\
Anointed Deacon|B\n\
Anointed Procession|W\n\
Anointer Priest|W\n\
Apocalypse Demon|B\n\
Appeal|G\n\
Appetite for the Unnatural|G\n\
Approach of the Second Sun|W\n\
Aquatic Incursion|U\n\
Aradara Express|C\n\
Arbor Armament|G\n\
Arborback Stomper|G\n\
Arcane Adaptation|U\n\
Arcane Flight|U\n\
Arch of Orazca|L\n\
Archfiend of Ifnir|B\n\
Architect of the Untamed|G\n\
Arguel's Blood Fast|B\n\
Armorcraft Judge|G\n\
Arterial Flow|B\n\
Artificer's Assistant|U\n\
Arvad the Cursed|WB\n\
Aryel, Knight of Windgrace|WB\n\
As Foretold|U\n\
Ashes of the Abhorrent|W\n\
Attune with Aether|G\n\
Atzocan Archer|G\n\
Atzocan Seer|WG\n\
Audacious Infiltrator|W\n\
Augmenting Automaton|C\n\
Authority of the Consuls|W\n\
Aven Initiate|U\n\
Aven Mindcensor|W\n\
Aven of Enduring Hope|W\n\
Aven Reedstalker|U\n\
Aven Sentry|W\n\
Aven Wind Guide|WU\n\
Aviary Mechanic|W\n\
Avid Reclaimer|G\n\
Awakened Amalgam|C\n\
Axis of Mortality|W\n\
Azor, the Lawbringer|WU\n\
Azor's Gateway|C\n\
Baffling End|W\n\
Baird, Steward of Argive|W\n\
Baleful Ammit|B\n\
Ballista Charger|C\n\
Baloth Gorger|G\n\
Banewhip Punisher|B\n\
Baral, Chief of Compliance|U\n\
Baral's Expertise|U\n\
Barricade Breaker|C\n\
Bastion Enforcer|W\n\
Bastion Inventor|U\n\
Bastion Mastodon|C\n\
Battle at the Bridge|B\n\
Battlefield Scavenger|R\n\
Befuddle|U\n\
Belligerent Brontodon|WG\n\
Bellowing Aegisaur|W\n\
Benalish Honor Guard|W\n\
Benalish Marshal|W\n\
Beneath the Sands|G\n\
Benefaction of Rhonas|G\n\
Binding Mummy|W\n\
Bishop of Binding|W\n\
Bishop of Rebirth|W\n\
Bishop of the Bloodstained|B\n\
Bishop's Soldier|W\n\
Bitterblade Warrior|G\n\
Bitterbow Sharpshooters|G\n\
Blackblade Reforged|C\n\
Blazing Hope|W\n\
Blazing Volley|R\n\
Blessed Light|W\n\
Blessing of Belzenlok|B\n\
Blight Keeper|B\n\
Blighted Bat|B\n\
Blinding Fog|G\n\
Blink of an Eye|U\n\
Blood Sun|R\n\
Bloodcrazed Paladin|B\n\
Bloodhunter Bat|B\n\
Bloodlust Inciter|R\n\
Bloodrage Brawler|R\n\
Bloodstone Goblin|R\n\
Bloodtallow Candle|C\n\
Bloodwater Entity|UR\n\
Blooming Marsh|L\n\
Blossom Dryad|G\n\
Blossoming Defense|G\n\
Blur of Blades|R\n\
Board the Weatherlight|W\n\
Bomat Bazaar Barge|C\n\
Bomat Courier|C\n\
Bombard|R\n\
Bonded Horncrest|R\n\
Bone Picker|B\n\
Boneyard Parley|B\n\
Bontu the Glorified|B\n\
Bontu's Last Reckoning|B\n\
Bontu's Monument|C\n\
Botanical Sanctum|L\n\
Bounty of the Luxa|UG\n\
Brambleweft Behemoth|G\n\
Brass's Bounty|R\n\
Brazen Buccaneers|R\n\
Brazen Freebooter|R\n\
Brazen Scourge|R\n\
Bright Reprisal|W\n\
Bristling Hydra|G\n\
Broken Bond|G\n\
Brute Strength|R\n\
Buccaneer's Bravado|R\n\
Built to Last|W\n\
Built to Smash|R\n\
Burning Sun's Avatar|R\n\
Burning-Fist Minotaur|R\n\
By Force|R\n\
Cabal Evangel|B\n\
Cabal Paladin|B\n\
Cabal Stronghold|L\n\
Cacophodon|G\n\
Caligo Skin-Witch|B\n\
Call for Unity|W\n\
Call the Cavalry|W\n\
Call to the Feast|WB\n\
Canal Monitor|B\n\
Cancel|U\n\
Canyon Slough|L\n\
Captain Lannery Storm|R\n\
Captain's Hook|C\n\
Captivating Crew|R\n\
Captured by the Consulate|W\n\
Carnage Tyrant|G\n\
Carrion Screecher|B\n\
Cartouche of Ambition|B\n\
Cartouche of Knowledge|U\n\
Cartouche of Solidarity|W\n\
Cartouche of Strength|G\n\
Cartouche of Zeal|R\n\
Cascading Cataracts|L\n\
Cast Down|B\n\
Cast Out|W\n\
Castaway's Despair|U\n\
Cataclysmic Gearhulk|W\n\
Cathartic Reunion|R\n\
Caught in the Brights|W\n\
Censor|U\n\
Ceremonious Rejection|U\n\
Certain Death|B\n\
Chainer's Torment|B\n\
Champion of Dusk|B\n\
Champion of Rhonas|G\n\
Champion of the Flame|R\n\
Champion of Wits|U\n\
Chandra, Bold Pyromancer|R\n\
Chandra, Pyrogenius|R\n\
Chandra, Torch of Defiance|R\n\
Chandra's Defeat|R\n\
Chandra's Outburst|R\n\
Chandra's Pyrohelix|R\n\
Chandra's Revolution|R\n\
Channeler Initiate|G\n\
Chaos Maw|R\n\
Charge|W\n\
Charging Monstrosaur|R\n\
Charging Tuskodon|R\n\
Chart a Course|U\n\
Cherished Hatchling|G\n\
Chief of the Foundry|C\n\
Cinder Barrens|L\n\
Claim|B\n\
Cleansing Ray|W\n\
Clifftop Retreat|L\n\
Cloudblazer|WU\n\
Cloudreader Sphinx|U\n\
Cobbled Wings|C\n\
Cogwork Assembler|C\n\
Cogworker's Puzzleknot|C\n\
Cold-Water Snapper|U\n\
Colossal Dreadmaw|G\n\
Colossapede|G\n\
Combat Celebrant|R\n\
Combustible Gearhulk|R\n\
Commencement of Festivities|G\n\
Commit|U\n\
Commune with Dinosaurs|G\n\
Companion of the Trials|W\n\
Compelling Argument|U\n\
Compulsory Rest|W\n\
Concealed Courtyard|L\n\
Confiscation Coup|U\n\
Conqueror's Galleon|C\n\
Consign|U\n\
Consulate Crackdown|W\n\
Consulate Dreadnought|C\n\
Consulate Skygate|C\n\
Consulate Surveillance|W\n\
Consulate Turret|C\n\
Consul's Shieldguard|W\n\
Consuming Fervor|R\n\
Contraband Kingpin|UB\n\
Contract Killing|B\n\
Conviction|W\n\
Coral Merfolk|U\n\
Corrosive Ooze|G\n\
Costly Plunder|B\n\
Countervailing Winds|U\n\
Countless Gears Renegade|W\n\
Cowl Prowler|G\n\
Crackdown Construct|C\n\
Cradle of the Accursed|L\n\
Crafty Cutpurse|U\n\
Crash the Ramparts|G\n\
Crash Through|R\n\
Crashing Tide|U\n\
Creeping Mold|G\n\
Crested Herdcaller|G\n\
Crested Sunmare|W\n\
Crocodile of the Crossing|G\n\
Crook of Condemnation|C\n\
Cruel Finality|B\n\
Cruel Reality|B\n\
Crushing Canopy|G\n\
Crypt of the Eternals|L\n\
Cryptic Serpent|U\n\
Cultivator of Blades|G\n\
Cultivator's Caravan|C\n\
Cunning Survivor|U\n\
Curator of Mysteries|U\n\
Curator's Ward|U\n\
Curio Vendor|U\n\
Curious Obsession|U\n\
Cursed Minotaur|B\n\
Cut|R\n\
Dagger of the Worthy|C\n\
Damping Sphere|C\n\
Danitha Capashen, Paragon|W\n\
Daredevil Dragster|C\n\
Darigaaz Reincarnated|BRG\n\
Daring Archaeologist|W\n\
Daring Buccaneer|R\n\
Daring Demolition|B\n\
Daring Saboteur|U\n\
Dark Bargain|B\n\
Dark Inquiry|B\n\
Dark Intimations|UBR\n\
Dark Nourishment|B\n\
Dauntless Aven|W\n\
Dauntless Bodyguard|W\n\
D'Avenant Trapper|W\n\
Dawnfeather Eagle|W\n\
Dead Man's Chest|B\n\
Deadeye Brawler|UB\n\
Deadeye Harpooner|W\n\
Deadeye Plunderers|UB\n\
Deadeye Quartermaster|U\n\
Deadeye Rig-Hauler|U\n\
Deadeye Tormentor|B\n\
Deadeye Tracker|B\n\
Deadlock Trap|C\n\
Deathbloom Thallid|B\n\
Deathgorge Scavenger|G\n\
Deathless Ancient|B\n\
Decimator Beetle|BG\n\
Decision Paralysis|U\n\
Decoction Module|C\n\
Decommission|W\n\
Deem Worthy|R\n\
Deep Freeze|U\n\
Deeproot Champion|G\n\
Deeproot Elite|G\n\
Deeproot Warrior|G\n\
Deeproot Waters|U\n\
Defiant Greatmaw|G\n\
Defiant Khenra|R\n\
Defiant Salvager|B\n\
Deft Dismissal|W\n\
Demolish|R\n\
Demolition Stomper|C\n\
Demon of Dark Schemes|B\n\
Demonic Vigor|B\n\
Demonlord Belzenlok|B\n\
Demystify|W\n\
Depala, Pilot Exemplar|WR\n\
Depths of Desire|U\n\
Desert Cerodon|R\n\
Desert of the Fervent|L\n\
Desert of the Glorified|L\n\
Desert of the Indomitable|L\n\
Desert of the Mindful|L\n\
Desert of the True|L\n\
Desert's Hold|W\n\
Desiccated Naga|B\n\
Desperate Castaways|B\n\
Destined|B\n\
Destructive Tampering|R\n\
Devoted Crop-Mate|W\n\
Devotee of Strength|G\n\
Dhund Operative|B\n\
Diabolic Tutor|B\n\
Die Young|B\n\
Diligent Excavator|U\n\
Dinosaur Hunter|B\n\
Dinosaur Stampede|R\n\
Dire Fleet Captain|BR\n\
Dire Fleet Daredevil|R\n\
Dire Fleet Hoarder|B\n\
Dire Fleet Interloper|B\n\
Dire Fleet Neckbreaker|BR\n\
Dire Fleet Poisoner|B\n\
Dire Fleet Ravager|B\n\
Disallow|U\n\
Disappearing Act|U\n\
Dispersal Technician|U\n\
Disposal Mummy|W\n\
Dispossess|B\n\
Dissenter's Deliverance|G\n\
Dive Down|U\n\
Divest|B\n\
Divination|U\n\
Divine Verdict|W\n\
Djeru, With Eyes Open|W\n\
Djeru's Renunciation|W\n\
Djeru's Resolve|W\n\
Doomed Dissenter|B\n\
Doomfall|B\n\
Dovin Baan|WU\n\
Dowsing Dagger|C\n\
Drag Under|U\n\
Dragonskull Summit|L\n\
Drake Haven|U\n\
Dramatic Reversal|U\n\
Dread Shade|B\n\
Dread Wanderer|B\n\
Dreamcaller Siren|U\n\
Dreamstealer|B\n\
Driven|G\n\
Drover of the Mighty|G\n\
Drowned Catacomb|L\n\
Drudge Sentinel|B\n\
Druid of the Cowl|G\n\
Dual Shot|R\n\
Dub|W\n\
Dubious Challenge|G\n\
Dukhara Peafowl|C\n\
Dukhara Scavenger|B\n\
Dune Beetle|B\n\
Dune Diviner|G\n\
Dunes of the Dead|L\n\
Durable Handicraft|G\n\
Duress|B\n\
Dusk|W\n\
Dusk Charger|B\n\
Dusk Legion Dreadnought|C\n\
Dusk Legion Zealot|B\n\
Duskborne Skymarcher|W\n\
Dutiful Servants|W\n\
Dynavolt Tower|C\n\
Eager Construct|C\n\
Earthshaker Khenra|R\n\
Eddytrail Hawk|W\n\
Edifice of Authority|C\n\
Efficient Construction|U\n\
Elaborate Firecannon|C\n\
Electrify|R\n\
Electrostatic Pummeler|C\n\
Elegant Edgecrafters|G\n\
Elenda, the Dusk Rose|WB\n\
Elfhame Druid|G\n\
Eliminate the Competition|B\n\
Embalmer's Tools|C\n\
Emberhorn Minotaur|R\n\
Embraal Bruiser|B\n\
Embraal Gear-Smasher|R\n\
Emergent Growth|G\n\
Emissary of Sunrise|W\n\
Emperor's Vanguard|G\n\
Empyreal Voyager|UG\n\
Encampment Keeper|W\n\
Endless Sands|L\n\
Engineered Might|WG\n\
Enigma Drake|UR\n\
Enraged Giant|R\n\
Enter the Unknown|G\n\
Entrancing Melody|U\n\
Era of Innovation|U\n\
Essence Extraction|B\n\
Essence Scatter|U\n\
Etali, Primal Storm|R\n\
Eternal of Harsh Truths|U\n\
Everdawn Champion|W\n\
Eviscerate|B\n\
Evolving Wilds|L\n\
Evra, Halcyon Witness|W\n\
Excavation Elephant|W\n\
Exemplar of Strength|G\n\
Expel from Orazca|U\n\
Experimental Aviator|U\n\
Exquisite Archangel|W\n\
Exultant Skymarcher|W\n\
Fabrication Module|C\n\
Failed Inspection|U\n\
Failure|U\n\
Fairgrounds Trumpeter|G\n\
Fairgrounds Warden|W\n\
Faith of the Devoted|B\n\
Falkenrath Reaver|R\n\
Fall of the Thran|W\n\
Famished Paladin|W\n\
Fan Bearer|W\n\
Fanatical Firebrand|R\n\
Farm|W\n\
Fatal Push|B\n\
Fateful Showdown|R\n\
Fathom Fleet Boarder|B\n\
Fathom Fleet Captain|B\n\
Fathom Fleet Cutthroat|B\n\
Fathom Fleet Firebrand|R\n\
Favorable Winds|U\n\
Felidar Guardian|W\n\
Fell Flagship|C\n\
Fen Hauler|B\n\
Feral Abomination|B\n\
Feral Prowler|G\n\
Fervent Paincaster|R\n\
Fervent Strike|R\n\
Festering Mummy|B\n\
Fetid Pools|L\n\
Field of Ruin|L\n\
Fiery Cannonade|R\n\
Fiery Intervention|R\n\
Fight with Fire|R\n\
Filigree Crawler|C\n\
Filigree Familiar|C\n\
Final Parting|B\n\
Final Reward|B\n\
Fire Elemental|R\n\
Fire Shrine Keeper|R\n\
Firebrand Archer|R\n\
Firecannon Blast|R\n\
Firefist Adept|R\n\
Fireforger's Puzzleknot|C\n\
Firesong and Sunspeaker|WR\n\
Flame Lash|R\n\
Flameblade Adept|R\n\
Fleet Swallower|U\n\
Fleetwheel Cruiser|C\n\
Fling|R\n\
Flood of Recollection|U\n\
Floodwaters|U\n\
Forebear's Blade|C\n\
Forerunner of the Coalition|B\n\
Forerunner of the Empire|R\n\
Forerunner of the Heralds|G\n\
Forerunner of the Legion|W\n\
Forest|L\n\
Form of the Dinosaur|R\n\
Forsake the Worldly|W\n\
Forsaken Sanctuary|L\n\
Fortuitous Find|B\n\
Foul Orchard|L\n\
Foundry Assembler|C\n\
Foundry Hornet|B\n\
Foundry Inspector|C\n\
Foundry Screecher|B\n\
Fourth Bridge Prowler|B\n\
Fragmentize|W\n\
Fraying Sanity|U\n\
Freejam Regent|R\n\
Frenzied Rage|R\n\
Frenzied Raptor|R\n\
Fretwork Colony|B\n\
Frilled Deathspitter|R\n\
Frilled Sandwalla|G\n\
Frontline Devastator|R\n\
Frontline Rebel|R\n\
Fumigate|W\n\
Fungal Infection|B\n\
Fungal Plots|G\n\
Furious Reprisal|R\n\
Gaea's Blessing|G\n\
Gaea's Protector|G\n\
Galestrike|U\n\
Garna, the Bloodflame|BR\n\
Garruk's Horde|G\n\
Gate to the Afterlife|C\n\
Gearseeker Serpent|U\n\
Gearshift Ace|W\n\
Ghalta, Primal Hunger|G\n\
Ghirapur Guide|G\n\
Ghirapur Orrery|C\n\
Ghirapur Osprey|W\n\
Ghitu Chronicler|R\n\
Ghitu Journeymage|R\n\
Ghitu Lavarunner|R\n\
Giant Spectacle|R\n\
Giant Spider|G\n\
Gideon of the Trials|W\n\
Gideon, Martial Paragon|W\n\
Gideon's Defeat|W\n\
Gideon's Intervention|W\n\
Gideon's Reproach|W\n\
Gideon's Resolve|W\n\
Gift of Growth|G\n\
Gift of Paradise|G\n\
Gift of Strength|G\n\
Gifted Aetherborn|B\n\
Gilded Cerodon|R\n\
Gilded Lotus|C\n\
Gilded Sentinel|C\n\
Giltgrove Stalker|G\n\
Gishath, Sun's Avatar|WRG\n\
Glacial Fortress|L\n\
Glassblower's Puzzleknot|C\n\
Gleaming Barrier|C\n\
Glimmer of Genius|U\n\
Glint-Nest Crane|U\n\
Glint-Sleeve Artisan|W\n\
Glint-Sleeve Siphoner|B\n\
Glorifier of Dusk|W\n\
Glorious End|R\n\
Glory Seeker|W\n\
Glory-Bound Initiate|W\n\
Glorybringer|R\n\
Glyph Keeper|U\n\
Goblin Barrage|R\n\
Goblin Chainwhirler|R\n\
Goblin Trailblazer|R\n\
Goblin Warchief|R\n\
God-Pharaoh's Faithful|W\n\
God-Pharaoh's Gift|C\n\
Golden Demise|B\n\
Golden Guardian|C\n\
Gonti, Lord of Luxury|B\n\
Gonti's Aether Heart|C\n\
Gonti's Machinations|B\n\
Goring Ceratops|W\n\
Graceful Cat|W\n\
Grand Warlord Radha|RG\n\
Granitic Titan|R\n\
Grasping Current|U\n\
Grasping Dunes|L\n\
Grasping Scoundrel|B\n\
Gravedigger|B\n\
Graven Abomination|C\n\
Grazing Whiptail|G\n\
Greater Sandwurm|G\n\
Greenbelt Rampager|G\n\
Greenwheel Liberator|G\n\
Gremlin Infestation|R\n\
Grim Captain's Call|B\n\
Grim Strider|B\n\
Grind|B\n\
Grisly Survivor|B\n\
Grow from the Ashes|G\n\
Growing Rites of Itlimoc|G\n\
Gruesome Fate|B\n\
Grunn, the Lonely King|G\n\
Guardian of the Great Conduit|G\n\
Guardians of Koilos|C\n\
Gust Walker|W\n\
Hadana's Climb|UG\n\
Hallar, the Firefletcher|RG\n\
Hapatra, Vizier of Poisons|BG\n\
Hapatra's Mark|G\n\
Haphazard Bombardment|R\n\
Hardy Veteran|G\n\
Harnessed Lightning|R\n\
Harrier Naga|G\n\
Harsh Mentor|R\n\
Harsh Scrutiny|B\n\
Harvest Season|G\n\
Hashep Oasis|L\n\
Hazardous Conditions|BG\n\
Haze of Pollen|G\n\
Hazoret the Fervent|R\n\
Hazoret's Favor|R\n\
Hazoret's Monument|C\n\
Hazoret's Undying Fury|R\n\
Headstrong Brute|R\n\
Headwater Sentries|U\n\
Healing Grace|W\n\
Heart of Kiran|C\n\
Heartless Pillage|B\n\
Heart-Piercer Manticore|R\n\
Heaven|G\n\
Hekma Sentinels|U\n\
Helm of the Host|C\n\
Herald of Anguish|B\n\
Herald of Secret Streams|U\n\
Herald of the Fair|W\n\
Heroic Intervention|G\n\
Hidden Herbalists|G\n\
Hidden Stockpile|WB\n\
Hieroglyphic Illumination|U\n\
Hierophant's Chalice|C\n\
Highland Lake|L\n\
Highspire Artisan|G\n\
Highspire Infusion|G\n\
Hightide Hermit|U\n\
Hijack|R\n\
Hinterland Drake|U\n\
Hinterland Harbor|L\n\
History of Benalia|W\n\
Hollow One|C\n\
Homarid Explorer|U\n\
Honed Khopesh|C\n\
Honored Crop-Captain|WR\n\
Honored Hydra|G\n\
Hooded Brawler|G\n\
Hope of Ghirapur|C\n\
Hope Tender|G\n\
Hornswoggle|U\n\
Horror of the Broken Lands|B\n\
Hostage Taker|UB\n\
Hostile Desert|L\n\
Hour of Devastation|R\n\
Hour of Eternity|U\n\
Hour of Glory|B\n\
Hour of Promise|G\n\
Hour of Revelation|W\n\
Howling Golem|C\n\
Huatli, Dinosaur Knight|WR\n\
Huatli, Radiant Champion|WG\n\
Huatli, Warrior Poet|WR\n\
Huatli's Snubhorn|W\n\
Huatli's Spurring|R\n\
Hungry Flames|R\n\
Hunt the Weak|G\n\
Hyena Pack|R\n\
Ice Over|U\n\
Icy Manipulator|C\n\
Ifnir Deadlands|L\n\
Illusionist's Stratagem|U\n\
Illusory Wrappings|U\n\
Imaginary Threats|U\n\
Imminent Doom|R\n\
Impale|B\n\
Impeccable Timing|W\n\
Imperial Aerosaur|W\n\
Imperial Ceratops|W\n\
Imperial Lancer|W\n\
Implement of Combustion|C\n\
Implement of Examination|C\n\
Implement of Ferocity|C\n\
Implement of Improvement|C\n\
Implement of Malice|C\n\
In Bolas's Clutches|U\n\
In Oketra's Name|W\n\
Incendiary Sabotage|R\n\
Indomitable Creativity|R\n\
Induced Amnesia|U\n\
Inferno Jet|R\n\
Initiate's Companion|G\n\
Insidious Will|U\n\
Inspiration|U\n\
Inspired Charge|W\n\
Inspiring Cleric|W\n\
Inspiring Roar|W\n\
Inspiring Statuary|C\n\
Inspiring Vantage|L\n\
Insult|R\n\
Inventor's Apprentice|R\n\
Inventors' Fair|L\n\
Inventor's Goggles|C\n\
Invigorated Rampage|R\n\
Invoke the Divine|W\n\
Ipnu Rivulet|L\n\
Iron League Steed|C\n\
Ironclad Revolutionary|B\n\
Irontread Crusher|C\n\
Irrigated Farmland|L\n\
Island|L\n\
Isolated Chapel|L\n\
Ixalan's Binding|W\n\
Ixalli's Diviner|G\n\
Ixalli's Keeper|G\n\
Jace, Cunning Castaway|U\n\
Jace, Ingenious Mind-Mage|U\n\
Jace's Defeat|U\n\
Jace's Sentinel|U\n\
Jade Bearer|G\n\
Jade Guardian|G\n\
Jadecraft Artisan|G\n\
Jadelight Ranger|G\n\
Janjeet Sentry|U\n\
Jaya Ballard|R\n\
Jaya's Immolating Inferno|R\n\
Jhoira, Weatherlight Captain|UR\n\
Jhoira's Familiar|C\n\
Jodah, Archmage Eternal|WUR\n\
Josu Vess, Lich Knight|B\n\
Journey to Eternity|BG\n\
Jousting Lance|C\n\
Juggernaut|C\n\
Jungle Creeper|BG\n\
Jungle Delver|G\n\
Jungleborn Pioneer|G\n\
Kamahl's Druidic Vow|G\n\
Kambal, Consul of Allocation|WB\n\
Kari Zev, Skyship Raider|R\n\
Kari Zev's Expertise|R\n\
Karn, Scion of Urza|C\n\
Karn's Temporal Sundering|U\n\
Karplusan Hound|R\n\
Kazarov, Sengir Pureblood|B\n\
Kefnet the Mindful|U\n\
Kefnet's Last Word|U\n\
Kefnet's Monument|C\n\
Keldon Overseer|R\n\
Keldon Raider|R\n\
Keldon Warcaller|R\n\
Key to the City|C\n\
Khenra Charioteer|RG\n\
Khenra Eternal|B\n\
Khenra Scrapper|R\n\
Kindled Fury|R\n\
Kinjalli's Caller|W\n\
Kinjalli's Sunwing|W\n\
Kitesail Corsair|U\n\
Kitesail Freebooter|B\n\
Knight of Grace|W\n\
Knight of Malice|B\n\
Knight of New Benalia|W\n\
Knight of the Stampede|G\n\
Kopala, Warden of Waves|U\n\
Krosan Druid|G\n\
Kujar Seedsculptor|G\n\
Kumena, Tyrant of Orazca|UG\n\
Kumena's Awakening|U\n\
Kumena's Speaker|G\n\
Kwende, Pride of Femeref|W\n\
Labyrinth Guardian|U\n\
Larger Than Life|G\n\
Lathnu Hellion|R\n\
Lathnu Sailback|R\n\
Lawless Broker|B\n\
Lay Bare the Heart|B\n\
Lay Claim|U\n\
Leave|W\n\
Leave in the Dust|U\n\
Legion Conquistador|W\n\
Legion Lieutenant|WB\n\
Legion's Judgment|W\n\
Legion's Landing|W\n\
Lethal Sting|B\n\
Liberating Combustion|R\n\
Lich's Mastery|B\n\
Life Goes On|G\n\
Lifecraft Awakening|G\n\
Lifecraft Cavalry|G\n\
Lifecrafter's Bestiary|C\n\
Lifecrafter's Gift|G\n\
Lightning Runner|R\n\
Lightning Strike|R\n\
Lightning-Rig Crew|R\n\
Liliana, Death Wielder|B\n\
Liliana, Death's Majesty|B\n\
Liliana's Defeat|B\n\
Liliana's Influence|B\n\
Liliana's Mastery|B\n\
Limits of Solidarity|R\n\
Lingering Phantom|B\n\
Live Fast|B\n\
Llanowar Elves|G\n\
Llanowar Envoy|G\n\
Llanowar Scout|G\n\
Long-Finned Skywhale|U\n\
Longtusk Cub|G\n\
Lookout's Dispersal|U\n\
Looming Altisaur|W\n\
Lord of the Accursed|B\n\
Lost Legacy|B\n\
Luminous Bonds|W\n\
Lurching Rotbeast|B\n\
Lurking Chupacabra|B\n\
Luxa River Shrine|C\n\
Lyra Dawnbringer|W\n\
Madcap Experiment|R\n\
Magma Spray|R\n\
Magmaroth|R\n\
Majestic Heliopterus|W\n\
Majestic Myriarch|G\n\
Make Obsolete|B\n\
Makeshift Munitions|R\n\
Malfunction|U\n\
Mammoth Spider|G\n\
Manalith|C\n\
Manglehorn|G\n\
Manticore Eternal|R\n\
Manticore of the Gauntlet|R\n\
Marauding Boneslasher|B\n\
Marauding Looter|UR\n\
March of the Drowned|B\n\
Marionette Master|B\n\
Mark of the Vampire|B\n\
Martyr of Dusk|W\n\
Marwyn, the Nurturer|G\n\
Master Trinketeer|W\n\
Mastermind's Acquisition|B\n\
Maulfist Doorbuster|R\n\
Maulfist Revolutionary|G\n\
Maulfist Squad|B\n\
Mausoleum Harpy|B\n\
Maverick Thopterist|UR\n\
Mavren Fein, Dusk Apostle|W\n\
Meandering River|L\n\
Mechanized Production|U\n\
Memorial to Folly|L\n\
Memorial to Genius|L\n\
Memorial to Glory|L\n\
Memorial to Unity|L\n\
Memorial to War|L\n\
Merchant's Dockhand|C\n\
Merciless Eternal|B\n\
Merciless Javelineer|BR\n\
Merfolk Branchwalker|G\n\
Merfolk Mistbinder|UG\n\
Merfolk Trickster|U\n\
Mesa Unicorn|W\n\
Metallic Mimic|C\n\
Metallic Rebuke|U\n\
Metallurgic Summonings|U\n\
Metalspinner's Puzzleknot|C\n\
Metalwork Colossus|C\n\
Miasmic Mummy|B\n\
Midnight Entourage|B\n\
Midnight Oil|B\n\
Mighty Leap|W\n\
Mind Rot|B\n\
Minister of Inquiries|U\n\
Minotaur Sureshot|R\n\
Mirage Mirror|C\n\
Mishra's Self-Replicator|C\n\
Mist-Cloaked Herald|U\n\
Moaning Wall|B\n\
Mobile Garrison|C\n\
Moment of Craving|B\n\
Moment of Triumph|W\n\
Monstrous Onslaught|G\n\
Morbid Curiosity|B\n\
Mountain|L\n\
Mouth|G\n\
Mox Amber|C\n\
Muldrotha, the Gravetide|UBG\n\
Multani, Yavimaya's Avatar|G\n\
Multiform Wonder|C\n\
Mummy Paramount|W\n\
Mutiny|R\n\
Naban, Dean of Iteration|U\n\
Naga Oracle|U\n\
Naga Vitalist|G\n\
Narnam Cobra|C\n\
Narnam Renegade|G\n\
Naru Meha, Master Wizard|U\n\
Natural Obsolescence|G\n\
Naturalize|G\n\
Nature's Spiral|G\n\
Nature's Way|G\n\
Navigator's Compass|C\n\
Navigator's Ruin|U\n\
Needletooth Raptor|R\n\
Nef-Crop Entangler|R\n\
Negate|U\n\
Neheb, the Eternal|R\n\
Neheb, the Worthy|BR\n\
Nest of Scarabs|B\n\
Nest Robber|R\n\
Never|B\n\
New Horizons|G\n\
New Perspectives|U\n\
Nezahal, Primal Tide|U\n\
Niambi, Faithful Healer|WU\n\
Nicol Bolas, God-Pharaoh|UBR\n\
Nicol Bolas, the Deceiver|UBR\n\
Night Market Aeronaut|B\n\
Night Market Guard|C\n\
Night Market Lookout|B\n\
Nightmare|B\n\
Nimble Innovator|U\n\
Nimble Obstructionist|U\n\
Nimble-Blade Khenra|R\n\
Ninth Bridge Patrol|W\n\
Nissa, Genesis Mage|G\n\
Nissa, Nature's Artisan|G\n\
Nissa, Steward of Elements|UG\n\
Nissa, Vital Force|G\n\
Nissa's Defeat|G\n\
Nissa's Encouragement|G\n\
Noxious Gearhulk|B\n\
Oakenform|G\n\
Oashra Cultivator|G\n\
Oasis Ritualist|G\n\
Oath of Ajani|WG\n\
Oath of Teferi|WU\n\
Oathsworn Vampire|B\n\
Obelisk Spider|BG\n\
Oketra the True|W\n\
Oketra's Attendant|W\n\
Oketra's Avenger|W\n\
Oketra's Last Mercy|W\n\
Oketra's Monument|C\n\
Old-Growth Dryads|G\n\
Ominous Sphinx|U\n\
On Serra's Wings|W\n\
One With the Wind|U\n\
Onward|R\n\
Open Fire|R\n\
Open into Wonder|U\n\
Opt|U\n\
Oracle's Vault|C\n\
Orazca Frillback|G\n\
Orazca Raptor|R\n\
Orazca Relic|C\n\
Orcish Vandal|R\n\
Ornamental Courage|G\n\
Ornery Kudu|G\n\
Ornithopter|C\n\
Otepec Huntmaster|R\n\
Outland Boar|RG\n\
Ovalchase Daredevil|B\n\
Ovalchase Dragster|C\n\
Overcome|G\n\
Overflowing Insight|U\n\
Overgrown Armasaur|G\n\
Overwhelming Splendor|W\n\
Oviya Pashiri, Sage Lifecrafter|G\n\
Pacification Array|C\n\
Padeem, Consul of Innovation|U\n\
Painful Lesson|B\n\
Painted Bluffs|L\n\
Paladin of Atonement|W\n\
Paladin of the Bloodstained|W\n\
Panharmonicon|C\n\
Paradox Engine|C\n\
Paradoxical Outcome|U\n\
Pardic Wanderer|C\n\
Path of Discovery|G\n\
Path of Mettle|WR\n\
Pathmaker Initiate|R\n\
Peacewalker Colossus|C\n\
Peema Aether-Seer|G\n\
Peema Outrider|G\n\
Pegasus Courser|W\n\
Pendulum of Patterns|C\n\
Perilous Predicament|B\n\
Perilous Voyage|U\n\
Perpetual Timepiece|C\n\
Phyrexian Scriptures|B\n\
Pia Nalaar|R\n\
Pia's Revolution|R\n\
Pierce the Sky|G\n\
Pillar of Origins|C\n\
Pious Interdiction|W\n\
Pirate's Cutlass|C\n\
Pirate's Pillage|R\n\
Pirate's Prize|U\n\
Pitiless Plunderer|B\n\
Pitiless Vizier|B\n\
Plague Belcher|B\n\
Plains|L\n\
Planar Bridge|C\n\
Plummet|G\n\
Polyraptor|G\n\
Pounce|G\n\
Pouncing Cheetah|G\n\
Powerstone Shard|C\n\
Prakhata Club Security|B\n\
Prakhata Pillar-Bug|C\n\
Precise Strike|R\n\
Precognition Field|U\n\
Prepare|W\n\
Pressure Point|W\n\
Prey Upon|G\n\
Pride of Conquerors|W\n\
Pride Sovereign|G\n\
Priest of the Wakening Sun|W\n\
Primal Amulet|C\n\
Primevals' Glorious Rebirth|WB\n\
Primordial Wurm|G\n\
Prizefighter Construct|C\n\
Profane Procession|WB\n\
Propeller Pioneer|W\n\
Prophetic Prism|C\n\
Prosperous Pirates|U\n\
Protean Raider|UR\n\
Protection of the Hekma|W\n\
Proven Combatant|U\n\
Prowling Serpopard|G\n\
Prying Blade|C\n\
Pterodon Knight|W\n\
Pull from Tomorrow|U\n\
Puncturing Blow|R\n\
Pursue Glory|R\n\
Pyramid of the Pantheon|C\n\
Pyromantic Pilgrim|R\n\
Quarry Beetle|G\n\
Quarry Hauler|G\n\
Queen's Agent|B\n\
Queen's Bay Soldier|B\n\
Queen's Commission|W\n\
Quicksmith Genius|R\n\
Quicksmith Rebel|R\n\
Quicksmith Spy|U\n\
Rabid Bite|G\n\
Radiant Destiny|W\n\
Radiating Lightning|R\n\
Raff Capashen, Ship's Mage|WU\n\
Raging Regisaur|RG\n\
Raging Swordtooth|RG\n\
Rags|B\n\
Raiders' Wake|B\n\
Raise Dead|B\n\
Rallying Roar|W\n\
Rampaging Cyclops|R\n\
Rampaging Ferocidon|R\n\
Rampaging Hippo|G\n\
Ramunap Excavator|G\n\
Ramunap Hydra|G\n\
Ramunap Ruins|L\n\
Ranging Raptors|G\n\
Raptor Companion|W\n\
Raptor Hatchling|R\n\
Rashmi, Eternities Crafter|UG\n\
Rat Colony|B\n\
Ravenous Chupacabra|B\n\
Ravenous Daggertooth|G\n\
Ravenous Intruder|R\n\
Razaketh, the Foulblooded|B\n\
Razaketh's Rite|B\n\
Reason|U\n\
Reaver Ambush|B\n\
Reckless Fireweaver|R\n\
Reckless Racer|R\n\
Reckless Rage|R\n\
Recover|B\n\
Reduce|U\n\
Refurbish|W\n\
Refuse|R\n\
Regal Caracal|W\n\
Regisaur Alpha|RG\n\
Rekindling Phoenix|R\n\
Release the Gremlins|R\n\
Release to the Wind|U\n\
Relentless Raptor|WR\n\
Relic Runner|U\n\
Renegade Firebrand|R\n\
Renegade Freighter|C\n\
Renegade Map|C\n\
Renegade Rallier|WG\n\
Renegade Tactics|R\n\
Renegade Wheelsmith|WR\n\
Renegade's Getaway|B\n\
Renewed Faith|W\n\
Repeating Barrage|R\n\
Rescue|U\n\
Reservoir Walker|C\n\
Resilient Khenra|G\n\
Resolute Survivors|WR\n\
Resourceful Return|B\n\
Resplendent Griffin|WU\n\
Restoration Gearsmith|WB\n\
Restoration Specialist|W\n\
Revel in Riches|B\n\
Reverse Engineer|U\n\
Revoke Privileges|W\n\
Revolutionary Rebuff|U\n\
Rhet-Crop Spearmaster|W\n\
Rhonas the Indomitable|G\n\
Rhonas's Last Stand|G\n\
Rhonas's Monument|C\n\
Rhonas's Stalwart|G\n\
Riddleform|U\n\
Ridgescale Tusker|G\n\
Rigging Runner|R\n\
Rile|R\n\
Riparian Tiger|G\n\
Ripjaw Raptor|G\n\
Rishkar, Peema Renegade|G\n\
Rishkar's Expertise|G\n\
Rite of Belzenlok|B\n\
Ritual of Rejuvenation|W\n\
River Darter|U\n\
River Heralds' Boon|G\n\
River Hoopoe|UG\n\
River Serpent|U\n\
River Sneak|U\n\
River's Rebuke|U\n\
Riverwise Augur|U\n\
Rogue Refiner|UG\n\
Rona, Disciple of Gix|UB\n\
Rootbound Crag|L\n\
Rootwalla|G\n\
Rowdy Crew|R\n\
Ruin Raider|B\n\
Ruin Rat|B\n\
Ruinous Gremlin|R\n\
Rummaging Goblin|R\n\
Run Aground|U\n\
Run Amok|R\n\
Rush of Vitality|B\n\
Ruthless Knave|B\n\
Ruthless Sniper|B\n\
Sacred Cat|W\n\
Sacred Excavation|U\n\
Sadistic Skymarcher|B\n\
Sage of Lat-Nam|U\n\
Sage of Shaila's Claim|G\n\
Saheeli Rai|UR\n\
Saheeli's Artistry|U\n\
Sailor of Means|U\n\
Salivating Gremlins|R\n\
Salvage Scuttler|U\n\
Samut, the Tested|RG\n\
Samut, Voice of Dissent|RG\n\
Sanctum Seeker|B\n\
Sanctum Spirit|W\n\
Sand Strangler|R\n\
Sandblast|W\n\
Sandwurm Convergence|G\n\
Sanguine Glorifier|W\n\
Sanguine Sacrament|W\n\
Saproling Migration|G\n\
Savage Stomp|G\n\
Saving Grace|W\n\
Scaled Behemoth|G\n\
Scarab Feast|B\n\
Scattered Groves|L\n\
Scavenger Grounds|L\n\
Scrap Trawler|C\n\
Scrapheap Scrounger|C\n\
Scrapper Champion|R\n\
Scribe of the Mindful|U\n\
Scrounger of Souls|B\n\
Scrounging Bandar|G\n\
Sea Legs|U\n\
Seafloor Oracle|U\n\
Seal Away|W\n\
Search for Azcanta|U\n\
Secret Salvage|B\n\
Secrets of the Golden City|U\n\
See Red|R\n\
Seeker of Insight|U\n\
Seekers' Squire|B\n\
Seer of the Last Tomorrow|U\n\
Seismic Shift|R\n\
Select for Inspection|U\n\
Self-Assembler|C\n\
Sengir Vampire|B\n\
Sentinel of the Pearl Trident|U\n\
Sentinel Totem|C\n\
Sequestered Stash|L\n\
Seraph of the Suns|W\n\
Sergeant-at-Arms|W\n\
Serra Angel|W\n\
Serra Disciple|W\n\
Servant of the Conduit|G\n\
Servo Exhibition|W\n\
Servo Schematic|C\n\
Settle the Score|B\n\
Settle the Wreckage|W\n\
Shadow of the Grave|B\n\
Shadowed Caravel|C\n\
Shadowstorm Vizier|UB\n\
Shake the Foundations|R\n\
Shalai, Voice of Plenty|W\n\
Shanna, Sisay's Legacy|WG\n\
Shaper Apprentice|U\n\
Shapers of Nature|UG\n\
Shapers' Sanctuary|G\n\
Shatter|R\n\
Shed Weakness|G\n\
Shefet Dunes|L\n\
Shefet Monitor|G\n\
Sheltered Thicket|L\n\
Sheltering Light|W\n\
Shield of the Realm|C\n\
Shielded Aether Thief|U\n\
Shimmerscale Drake|U\n\
Shining Aerosaur|W\n\
Shipwreck Looter|U\n\
Shipwreck Moray|U\n\
Shivan Dragon|R\n\
Shivan Fire|R\n\
Shock|R\n\
Shore Keeper|U\n\
Short Sword|C\n\
Shrewd Negotiation|U\n\
Sidewinder Naga|G\n\
Siege Modification|R\n\
Siege-Gang Commander|R\n\
Siegehorn Ceratops|WG\n\
Sifter Wurm|G\n\
Silent Gravestone|C\n\
Silkweaver Elite|G\n\
Silverclad Ferocidons|R\n\
Silvergill Adept|U\n\
Sinuous Striker|U\n\
Siren Lookout|U\n\
Siren Reaver|U\n\
Siren Stormtamer|U\n\
Siren's Ruse|U\n\
Sixth Sense|G\n\
Skirk Prospector|R\n\
Skittering Heartstopper|B\n\
Skittering Surveyor|C\n\
Skizzik|R\n\
Skulduggery|B\n\
Sky Skiff|C\n\
Sky Terror|WR\n\
Skyblade of the Legion|W\n\
Skymarch Bloodletter|B\n\
Skymarcher Aspirant|W\n\
Skyship Plunderer|U\n\
Skyship Stalker|R\n\
Skysovereign, Consul Flagship|C\n\
Skyswirl Harrier|W\n\
Skywhaler's Shot|W\n\
Slash of Talons|W\n\
Slaughter the Strong|W\n\
Sleek Schooner|C\n\
Sleep Paralysis|U\n\
Slice in Twain|G\n\
Slimefoot, the Stowaway|BG\n\
Slinn Voda, the Rising Deep|U\n\
Slippery Scoundrel|U\n\
Slither Blade|U\n\
Sly Requisitioner|B\n\
Smuggler's Copter|C\n\
Snapping Sailback|G\n\
Snare Thopter|C\n\
Snubhorn Sentry|W\n\
Solemn Recruit|W\n\
Solemnity|W\n\
Solitary Camel|W\n\
Song of Freyalise|G\n\
Sorcerer's Wand|C\n\
Sorcerous Spyglass|C\n\
Soul of the Rapids|U\n\
Soul Salvage|B\n\
Soul-Scar Mage|R\n\
Soulstinger|B\n\
Spark of Creativity|R\n\
Sparring Construct|C\n\
Sparring Mummy|W\n\
Speedway Fanatic|R\n\
Spell Pierce|U\n\
Spell Swindle|U\n\
Spellweaver Eternal|U\n\
Sphinx of Magosi|U\n\
Sphinx's Decree|W\n\
Spidery Grasp|G\n\
Spike-Tailed Ceratops|G\n\
Spire of Industry|L\n\
Spire Patrol|WU\n\
Spire Winder|U\n\
Spirebluff Canal|L\n\
Spireside Infiltrator|R\n\
Splendid Agony|B\n\
Spontaneous Artist|R\n\
Spore Swarm|G\n\
Sporecrown Thallid|G\n\
Spreading Rot|B\n\
Spring|G\n\
Squee, the Immortal|R\n\
Squire's Devotion|W\n\
Sram, Senior Edificer|W\n\
Sram's Expertise|W\n\
Stalking Tiger|G\n\
Stampeding Horncrest|R\n\
Stampeding Rhino|G\n\
Standing Troops|W\n\
Star of Extinction|R\n\
Start|W\n\
Start Your Engines|R\n\
Steadfast Armasaur|W\n\
Steadfast Sentinel|W\n\
Stealer of Secrets|U\n\
Steel Leaf Champion|G\n\
Steward of Solidarity|W\n\
Stinging Shot|G\n\
Stir the Sands|B\n\
Stone Quarry|L\n\
Storm Fleet Aerialist|U\n\
Storm Fleet Arsonist|R\n\
Storm Fleet Pyromancer|R\n\
Storm Fleet Sprinter|UR\n\
Storm Fleet Spy|U\n\
Storm Fleet Swashbuckler|R\n\
Storm Sculptor|U\n\
Storm the Vault|UR\n\
Stormfront Pegasus|W\n\
Strategic Planning|U\n\
Strength of the Pack|G\n\
Strider Harness|C\n\
Striped Riverwinder|U\n\
Stronghold Confessor|B\n\
Struggle|R\n\
Submerged Boneyard|L\n\
Subtle Strike|B\n\
Sulfur Falls|L\n\
Sun Sentinel|W\n\
Sunbird's Invocation|R\n\
Sun-Blessed Mount|WR\n\
Sun-Collared Raptor|R\n\
Sun-Crested Pterodon|W\n\
Sun-Crowned Hunters|R\n\
Sunpetal Grove|L\n\
Sunrise Seeker|W\n\
Sunscorched Desert|L\n\
Sunscourge Champion|W\n\
Sunset Pyramid|C\n\
Supernatural Stamina|B\n\
Supply Caravan|W\n\
Supreme Will|U\n\
Sure Strike|R\n\
Survivors' Encampment|L\n\
Swab Goblin|R\n\
Swaggering Corsair|R\n\
Swamp|L\n\
Swarm Intelligence|U\n\
Swashbuckling|R\n\
Sweatworks Brawler|R\n\
Sweltering Suns|R\n\
Swift Warden|G\n\
Sword-Point Diplomacy|B\n\
Sworn Guardian|U\n\
Sylvan Awakening|G\n\
Synchronized Strike|G\n\
Syncopate|U\n\
Syndicate Trafficker|B\n\
Tah-Crop Elite|W\n\
Tah-Crop Skirmisher|U\n\
Take Down|G\n\
Take into Custody|U\n\
Tasseled Dromedary|W\n\
Tattered Mummy|B\n\
Tatyova, Benthic Druid|UG\n\
Teferi, Hero of Dominaria|WU\n\
Teferi, Timebender|WU\n\
Teferi's Sentinel|C\n\
Temmet, Vizier of Naktamun|WU\n\
Tempest Caller|U\n\
Tempest Djinn|U\n\
Temple Altisaur|W\n\
Temporal Machinations|U\n\
Tenacious Hunter|G\n\
Tendershoot Dryad|G\n\
Terrain Elemental|G\n\
Territorial Allosaurus|G\n\
Territorial Gorger|R\n\
Territorial Hammerskull|W\n\
Terror of the Fairgrounds|R\n\
Teshar, Ancestor's Apostle|W\n\
Tetsuko Umezawa, Fugitive|U\n\
Tetzimoc, Primal Death|B\n\
Tezzeret the Schemer|UB\n\
Tezzeret, Master of Metal|UB\n\
Tezzeret's Ambition|U\n\
Tezzeret's Betrayal|UB\n\
Tezzeret's Simulacrum|C\n\
Tezzeret's Touch|UB\n\
Thallid Omnivore|B\n\
Thallid Soothsayer|B\n\
Thaumatic Compass|C\n\
The Antiquities War|U\n\
The Eldest Reborn|B\n\
The First Eruption|R\n\
The Flame of Keld|R\n\
The Immortal Sun|C\n\
The Locust God|UR\n\
The Mending of Dominaria|G\n\
The Mirari Conjecture|U\n\
The Scarab God|UB\n\
The Scorpion God|BR\n\
Thopter Arrest|W\n\
Thorn Elemental|G\n\
Thorned Moloch|R\n\
Those Who Serve|W\n\
Thran Temporal Gateway|C\n\
Thrash of Raptors|R\n\
Thrashing Brontodon|G\n\
Thresher Lizard|R\n\
Thriving Grubs|R\n\
Thriving Ibex|W\n\
Thriving Rats|B\n\
Thriving Rhino|G\n\
Thriving Turtle|U\n\
Throne of the God-Pharaoh|C\n\
Thunderherd Migration|G\n\
Thundering Giant|R\n\
Thundering Spineback|G\n\
Tiana, Ship's Caretaker|WR\n\
Tidy Conclusion|B\n\
Tilonalli's Crown|R\n\
Tilonalli's Knight|R\n\
Tilonalli's Skinshifter|R\n\
Tilonalli's Summoner|R\n\
Timber Gorge|L\n\
Time of Ice|U\n\
Time to Reflect|W\n\
Timestream Navigator|U\n\
Tishana, Voice of Thunder|UG\n\
Tishana's Wayfinder|G\n\
Tocatli Honor Guard|W\n\
Tolarian Scholar|U\n\
Tomb Robber|B\n\
Toolcraft Exemplar|W\n\
Torch Gauntlet|C\n\
Torgaar, Famine Incarnate|B\n\
Torment of Hailfire|B\n\
Torment of Scarabs|B\n\
Torment of Venom|B\n\
Tormenting Voice|R\n\
Torrential Gearhulk|U\n\
Tragic Lesson|U\n\
Tragic Poet|W\n\
Tranquil Expanse|L\n\
Trapjaw Tyrant|W\n\
Traveler's Amulet|C\n\
Traxos, Scourge of Kroog|C\n\
Treasure Keeper|C\n\
Treasure Map|C\n\
Trespasser's Curse|B\n\
Trial of Ambition|B\n\
Trial of Knowledge|U\n\
Trial of Solidarity|W\n\
Trial of Strength|G\n\
Trial of Zeal|R\n\
Tricks of the Trade|U\n\
Triumph of Gerrard|W\n\
Trophy Mage|U\n\
Trove of Temptation|R\n\
Trueheart Duelist|W\n\
Trueheart Twins|R\n\
Trusty Companion|W\n\
Twilight Prophet|B\n\
Two-Headed Giant|R\n\
Unbridled Growth|G\n\
Unburden|B\n\
Uncage the Menagerie|G\n\
Unclaimed Territory|L\n\
Unconventional Tactics|W\n\
Underhanded Designs|B\n\
Unesh, Criosphinx Sovereign|U\n\
Unfriendly Fire|R\n\
Universal Solvent|C\n\
Unknown Shores|L\n\
Unlicensed Disintegration|BR\n\
Unquenchable Thirst|U\n\
Unraveling Mummy|WB\n\
Unsummon|U\n\
Untamed Hunger|B\n\
Untamed Kavu|G\n\
Untethered Express|C\n\
Unwavering Initiate|W\n\
Unwind|U\n\
Urgoros, the Empty One|B\n\
Urza's Ruinous Blast|W\n\
Urza's Tome|C\n\
Valduk, Keeper of the Flame|R\n\
Vampire Champion|B\n\
Vampire Revenant|B\n\
Vampire's Zeal|W\n\
Vance's Blasting Cannons|R\n\
Vanquish the Weak|B\n\
Vanquisher's Banner|C\n\
Vedalken Blademaster|U\n\
Vengeful Rebel|B\n\
Verdant Automaton|C\n\
Verdant Crescendo|G\n\
Verdant Force|G\n\
Verdant Rebirth|G\n\
Verdant Sun's Avatar|G\n\
Verdurous Gearhulk|G\n\
Verix Bladewing|R\n\
Veteran Motorist|WR\n\
Vicious Conquistador|B\n\
Vicious Offering|B\n\
Victory's Herald|W\n\
Vile Manifestation|B\n\
Vineshaper Mystic|G\n\
Violent Impact|R\n\
Visage of Bolas|C\n\
Visionary Augmenter|W\n\
Vizier of Deferment|W\n\
Vizier of Many Faces|U\n\
Vizier of Remedies|W\n\
Vizier of the Anointed|U\n\
Vizier of the Menagerie|G\n\
Vizier of the True|W\n\
Vizier of Tumbling Sands|U\n\
Vodalian Arcanist|U\n\
Voltaic Brawler|RG\n\
Voltaic Servant|C\n\
Vona, Butcher of Magan|WB\n\
Vona's Hunger|B\n\
Voracious Vampire|B\n\
Vraska, Relic Seeker|BG\n\
Vraska, Scheming Gorgon|B\n\
Vraska's Conquistador|B\n\
Vraska's Contempt|B\n\
Vraska's Scorn|B\n\
Wakening Sun's Avatar|W\n\
Waker of the Wilds|G\n\
Walk the Plank|B\n\
Walking Ballista|C\n\
Wall of Forgotten Pharaohs|C\n\
Wander in Death|B\n\
Wanted Scoundrels|B\n\
Warcry Phoenix|R\n\
Warfire Javelineer|R\n\
Warkite Marauder|U\n\
Warlord's Fury|R\n\
Wasp of the Bitter End|B\n\
Wasteland Scorpion|B\n\
Watchers of the Dead|C\n\
Watchful Automaton|C\n\
Watchful Naga|G\n\
Waterknot|U\n\
Watertrap Weaver|U\n\
Wayward Giant|R\n\
Wayward Servant|WB\n\
Wayward Swordtooth|G\n\
Weaponcraft Enthusiast|B\n\
Weatherlight|C\n\
Weaver of Currents|UG\n\
Weight of Memory|U\n\
Welder Automaton|C\n\
Weldfast Engineer|BR\n\
Weldfast Monitor|C\n\
Weldfast Wingsmith|U\n\
Welding Sparks|R\n\
Whir of Invention|U\n\
Whirler Virtuoso|UR\n\
Whirlermaker|C\n\
Whisper, Blood Liturgist|B\n\
Wild Onslaught|G\n\
Wild Wanderer|G\n\
Wildest Dreams|G\n\
Wildfire Eternal|R\n\
Wildgrowth Walker|G\n\
Wily Bandar|G\n\
Wily Goblin|R\n\
Wind Drake|U\n\
Wind Strider|U\n\
Windgrace Acolyte|B\n\
Winding Constrictor|BG\n\
Wind-Kin Raiders|U\n\
Winds of Rebuke|U\n\
Wing Snare|G\n\
Winged Shepherd|W\n\
Wispweaver Angel|W\n\
Without Weakness|B\n\
Wizard's Lightning|R\n\
Wizard's Retort|U\n\
Woodland Cemetery|L\n\
Woodland Stream|L\n\
Woodweaver's Puzzleknot|C\n\
Workshop Assistant|C\n\
World Shaper|G\n\
Wrangle|R\n\
Wretched Camel|B\n\
Yahenni, Undying Partisan|B\n\
Yahenni's Expertise|B\n\
Yargle, Glutton of Urborg|B\n\
Yavimaya Sapherd|G\n\
Yawgmoth's Vile Offering|B\n\
Zacama, Primal Calamity|WRG\n\
Zahid, Djinn of the Lamp|U\n\
Zealot of the God-Pharaoh|R\n\
Zenith Seeker|U\n\
Zetalpa, Primal Dawn|W\n\
Zhalfirin Void|L";
