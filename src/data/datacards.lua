local data = {
{Name="Adanto Vanguard";
SetCode="XLN";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Uncommon";
Text=[=[As long as Adanto Vanguard is attacking, it gets +2/+0.<br/>
Pay 4 life: Adanto Vanguard gains indestructible until end of turn. (Damage and effects that say "destroy" don't destroy it.)]=];
CardNumber="XLN1";
Power="1";
Toughness="1";
MultiverseID=435152;
};

{Name="Adanto, the First Fort";
SetCode="XLN";
cmc=1;
Type="Legendary Land";
SuperTypes={"Legendary"};
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Legion's Landing.)<br/>
{{Tap}}: Add {{W}} to your mana pool.<br/>
{{2}}{{W}}, {{Tap}}: Create a 1/1 white Vampire creature token with lifelink.]=];
CardNumber="XLN22b";
MultiverseID=435174;
};

{Name="Admiral Beckett Brass";
SetCode="XLN";
Manacost="{{1}}{{U}}{{B}}{{R}}";
cmc=4;
Colors={"Blue";"Black";"Red";};
Type="Legendary Creature — Human Pirate";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Mythic Rare";
Text=[=[Other Pirates you control get +1/+1.<br/>
At the beginning of your end step, gain control of target nonland permanent controlled by a player who was dealt combat damage by three or more Pirates this turn.]=];
Flavor=[=["You and your ship will make a fine addition to my fleet."]=];
CardNumber="XLN217";
Power="3";
Toughness="3";
MultiverseID=435373;
Rulings={
	{Date="2017-09-29";Text=[=[Admiral Beckett Brass’s triggered ability checks what happened earlier in the turn. It doesn’t care whether Admiral Beckett Brass was on the battlefield when those Pirates dealt combat damage, whether those creatures are still on the battlefield, or whether they’re still Pirates.]=];};
	{Date="2017-09-29";Text=[=[If one Pirate deals combat damage multiple times, most likely because it has double strike, it counts as only one of the three Pirates for Admiral Beckett Brass’s triggered ability.]=];};
	{Date="2017-09-29";Text=[=[If more than one player was dealt combat damage by three Pirates, you target only one permanent. It may be controlled by either of those players.]=];};
	{Date="2017-09-29";Text=[=[The control-change effect of Admiral Beckett Brass’s triggered ability lasts indefinitely. It doesn’t wear off during the cleanup step or when you lose control of Admiral Beckett Brass.]=];};
	{Date="2017-09-29";Text=[=[In a multiplayer game, if a player leaves the game, all cards that player owns leave as well, and any effects that give the player control of permanents immediately end.]=];};
	{Date="2017-09-29";Text=[=[In a Two-Headed Giant game, an unblocked attacking creature deals its combat damage to one of the two players it’s attacking. The attacking team chooses which player that is for each creature as combat damage is assigned. Combat damage dealt by Pirates your teammate controls will count when checking for Admiral Beckett Brass’s ability.]=];};
};
};

{Name="Admiral's Order";
SetCode="RIX";
Manacost="{{1}}{{U}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Rare";
Text=[=[Raid — If you attacked with a creature this turn, you may pay {{U}} rather than pay this spell's mana cost.<br/>
Counter target spell.]=];
Flavor=[=["Damn the cannons, mates. Charge!"]=];
CardNumber="RIX31";
MultiverseID=439688;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Aggressive Urge";
SetCode="RIX";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Target creature gets +1/+1 until end of turn.<br/>
Draw a card.]=];
Flavor=[=["Our lives, our homes, and all our history are at risk. Do not speak to me of peace."]=];
CardNumber="RIX122";
MultiverseID=439779;
Rulings={
	{Date="2018-01-19";Text=[=[If the target creature is an illegal target by the time Aggressive Urge tries to resolve, the spell is countered. You won’t draw a card.]=];};
};
};

{Name="Air Elemental";
SetCode="XLN";
Manacost="{{3}}{{U}}{{U}}";
cmc=5;
Colors={"Blue"};
Type="Creature — Elemental";
Types={"Creature"};
SubTypes={"Elemental"};
Rarity="Uncommon";
Text=[=[Flying]=];
Flavor=[=[As the ship approached, the jade totem rose high overhead. Power rippled. Eyes of stone glowed and crackled. Out hissed a breath of the world, and a windstorm came alive.]=];
CardNumber="XLN45";
Power="4";
Toughness="4";
MultiverseID=435197;
};

{Name="Ancient Brontodon";
SetCode="XLN";
Manacost="{{6}}{{G}}{{G}}";
cmc=8;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Flavor=[=[It is taller than all but the tallest trees, and older than all but the oldest.]=];
CardNumber="XLN175";
Power="9";
Toughness="9";
MultiverseID=435330;
};

{Name="Angrath, Minotaur Pirate";
SetCode="RIX";
Manacost="{{4}}{{B}}{{R}}";
cmc=6;
Colors={"Black";"Red";};
Type="Legendary Planeswalker — Angrath";
SuperTypes={"Legendary"};
Types={"Planeswalker"};
SubTypes={"Angrath"};
Rarity="Mythic Rare";
Text=[=[+2: Angrath, Minotaur Pirate deals 1 damage to target opponent and each creature that player controls.<br/>
−3: Return target Pirate card from your graveyard to the battlefield.<br/>
−11: Destroy all creatures target opponent controls. Angrath, Minotaur Pirate deals damage to that player equal to their total power.]=];
CardNumber="RIX201";
Loyalty="5";
MultiverseID=441895;
Rulings={
	{Date="2018-01-19";Text=[=[Angrath’s first and last abilities target only the player. Creatures with hexproof that player controls will be affected.]=];};
	{Date="2018-01-19";Text=[=[Angrath’s last ability uses the power of those creatures as they last existed on the battlefield to determine their total power. If a creature’s power was somehow less than 0, it subtracts from the total power of the other creatures. If the total power of those creatures is 0 or less, Angrath doesn’t deal damage.]=];};
	{Date="2018-01-19";Text=[=[If a creature controlled by the target opponent isn’t destroyed as Angrath’s last ability resolves (most likely because it has indestructible), its power still contributes to the amount of damage dealt. Use its power as it currently exists on the battlefield to determine the total power of the creatures.]=];};
	{Date="2018-01-19";Text=[=[Any abilities that trigger when creatures die while resolving Angrath’s last ability won’t be put on the stack until after the player is dealt damage. If the player’s life total becomes 0 or less, those triggers won’t resolve in time to save that player.]=];};
	{Date="2018-01-19";Text=[=[Any abilities of the destroyed creatures that trigger when the player is dealt damage won’t trigger.]=];};
};
};

{Name="Angrath, the Flame-Chained";
SetCode="RIX";
Manacost="{{3}}{{B}}{{R}}";
cmc=5;
Colors={"Black";"Red";};
Type="Legendary Planeswalker — Angrath";
SuperTypes={"Legendary"};
Types={"Planeswalker"};
SubTypes={"Angrath"};
Rarity="Mythic Rare";
Text=[=[+1: Each opponent discards a card and loses 2 life.<br/>
−3: Gain control of target creature until end of turn. Untap it. It gains haste until end of turn. Sacrifice it at the beginning of the next end step if it has converted mana cost 3 or less.<br/>
−8: Each opponent loses life equal to the number of cards in his or her graveyard.]=];
CardNumber="RIX152";
Loyalty="4";
MultiverseID=439809;
Rulings={
	{Date="2018-01-19";Text=[=[Angrath’s first ability causes each opponent to lose 2 life even if some or all of those players were unable to discard a card.]=];};
	{Date="2018-01-19";Text=[=[You can target and gain control of an untapped creature with Angrath’s second ability. You can also untap a creature you already control and give it haste.]=];};
	{Date="2018-01-19";Text=[=[Whether the target creature has converted mana cost 3 or less is checked only as the delayed triggered ability from Angrath’s second ability resolves during the end step.]=];};
	{Date="2018-01-19";Text=[=[In a Two-Headed Giant game, Angrath’s first ability causes the opposing team to lose 4 life, and each player on that team discards a card. His last ability causes the opposing team to lose life equal to the number of cards in both graveyards.]=];};
};
};

{Name="Angrath's Ambusher";
SetCode="RIX";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Creature — Orc Pirate";
Types={"Creature"};
SubTypes={"Orc";"Pirate";};
Rarity="Uncommon";
Text=[=[Angrath's Ambusher gets +2/+0 as long as you control an Angrath planeswalker.]=];
Flavor=[=[Orcs have been enemies of the Legion of Dusk since it was formed, and the entire race has been declared anathema.]=];
CardNumber="RIX202";
Power="2";
Toughness="3";
MultiverseID=441896;
};

{Name="Angrath's Fury";
SetCode="RIX";
Manacost="{{3}}{{B}}{{R}}";
cmc=5;
Colors={"Black";"Red";};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Rare";
Text=[=[Destroy target creature. Angrath's Fury deals 3 damage to target player. You may search your library and/or graveyard for a card named Angrath, Minotaur Pirate, reveal it, and put it into your hand. If you search your library this way, shuffle it.]=];
CardNumber="RIX204";
MultiverseID=441898;
Rulings={
	{Date="2018-01-19";Text=[=[You can’t cast Angrath’s Fury unless you choose both a target creature and a target player.]=];};
	{Date="2018-01-19";Text=[=[If either target becomes illegal after you cast Angrath’s Fury but before it resolves, the other is still affected as appropriate and you’ll search for Angrath. However, if both targets become illegal, the spell is countered and you won’t search.]=];};
};
};

{Name="Angrath's Marauders";
SetCode="XLN";
Manacost="{{5}}{{R}}{{R}}";
cmc=7;
Colors={"Red"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[If a source you control would deal damage to a permanent or player, it deals double that damage to that permanent or player instead.]=];
Flavor=[=[Captain Angrath cares less about treasure than mayhem. If he can't leave Ixalan, he'll burn the plane down.]=];
CardNumber="XLN132";
Power="4";
Toughness="4";
MultiverseID=435286;
Rulings={
	{Date="2017-09-29";Text=[=[If a creature with trample you control would deal combat damage to a blocking creature while you control Angrath’s Marauders, you must assign its unmodified damage. For example, a 3/3 creature with trample blocked by a 2/2 creature can have at most 1 damage assigned to the defending player. It will then deal 4 damage to the blocking creature and 2 damage to the defending player.]=];};
	{Date="2017-09-29";Text=[=[If an effect such as that of Chandra’s Pyrohelix asks you to divide damage among targets, you must divide the unmodified damage before doubling it.]=];};
	{Date="2017-09-29";Text=[=[If you control a second Angrath’s Marauders, damage dealt by sources you control will be multiplied by 4. If you control a third, it will be multiplied by 8, and so on.]=];};
};
};

{Name="Anointed Deacon";
SetCode="XLN";
Manacost="{{4}}{{B}}";
cmc=5;
Colors={"Black"};
Type="Creature — Vampire Cleric";
Types={"Creature"};
SubTypes={"Vampire";"Cleric";};
Rarity="Common";
Text=[=[At the beginning of combat on your turn, you may have target Vampire get +2/+0 until end of turn.]=];
Flavor=[=[Inspiration is red as rubies, flowing like honeyed wine.]=];
CardNumber="XLN89";
Power="3";
Toughness="3";
MultiverseID=435242;
};

{Name="Aquatic Incursion";
SetCode="RIX";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Uncommon";
Text=[=[When Aquatic Incursion enters the battlefield, create two 1/1 blue Merfolk creature tokens with hexproof. (They can't be the targets of spells or abilities your opponents control.)<br/>
{{3}}{{U}}: Target Merfolk can't be blocked this turn.]=];
CardNumber="RIX32";
MultiverseID=439689;
Rulings={
	{Date="2018-01-19";Text=[=[Activating the last ability of Aquatic Incursion after a Merfolk has become blocked won’t cause it to become unblocked.]=];};
};
};

{Name="Arcane Adaptation";
SetCode="XLN";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Rare";
Text=[=[As Arcane Adaptation enters the battlefield, choose a creature type.<br/>
Creatures you control are the chosen type in addition to their other types. The same is true for creature spells you control and creature cards you own that aren't on the battlefield.]=];
CardNumber="XLN46";
MultiverseID=435198;
Rulings={
	{Date="2017-09-29";Text=[=[Replacement effects that modify creatures of a certain type as they enter the battlefield will apply after you apply Arcane Adaptation’s effect. This is a change from previous rules. If you control Arcane Adaptation and the Aether Revolt card Metallic Mimic, with the same creature type chosen for both, then any creature you control will enter the battlefield with an additional +1/+1 counter on it.]=];};
	{Date="2018-01-19";Text=[=[To choose a creature type, you must choose an existing creature type, such as Vampire or Knight. You can’t choose multiple creature types, such as “Vampire Knight.” Card types such as artifact can’t be chosen, nor can subtypes that aren’t creature types, such as Jace, Vehicle, or Treasure.]=];};
};
};

{Name="Arch of Orazca";
SetCode="RIX";
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
{{Tap}}: Add {{C}} to your mana pool.<br/>
{{5}}, {{Tap}}: Draw a card. Activate this ability only if you have the city's blessing.]=];
CardNumber="RIX185";
MultiverseID=439849;
Rulings={
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
};
};

{Name="Arguel's Blood Fast";
SetCode="XLN";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Legendary Enchantment";
SuperTypes={"Legendary"};
Types={"Enchantment"};
Rarity="Rare";
Text=[=[{{1}}{{B}}, Pay 2 life: Draw a card.<br/>
At the beginning of your upkeep, if you have 5 or less life, you may transform Arguel's Blood Fast.]=];
Flavor=[=[Arguel's vision led him into the jungles of Ixalan . . .]=];
CardNumber="XLN90a";
MultiverseID=435243;
Rulings={
	{Date="2017-09-29";Text=[=[If your life total is 6 or greater as your upkeep begins, the second ability of Arguel’s Blood Fast won’t trigger. You can’t take any actions during your turn before your upkeep begins.]=];};
	{Date="2017-09-29";Text=[=[If your life total is 6 or greater as the second ability of Arguel’s Blood Fast tries to resolve, it won’t do anything.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Arterial Flow";
SetCode="RIX";
Manacost="{{1}}{{B}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Each opponent discards two cards. If you control a Vampire, each opponent loses 2 life and you gain 2 life.]=];
Flavor=[=["It is impious to admit, but I do enjoy pirate blood. Something in the salty tang of it, the spice of rebellion."]=];
CardNumber="RIX62";
MultiverseID=439719;
Rulings={
	{Date="2018-01-19";Text=[=[Whether you control a Vampire is checked as Arterial Flow resolves.]=];};
	{Date="2018-01-19";Text=[=[Arterial Flow causes each opponent to lose 2 life if you control a Vampire, even if some or all of those players were unable to discard any cards.]=];};
	{Date="2018-01-19";Text=[=[In a Two-Headed Giant game, Arterial Flow causes the opposing team to lose 4 life, and each player on that team discards two cards. You gain 2 life.]=];};
};
};

{Name="Ashes of the Abhorrent";
SetCode="XLN";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Rare";
Text=[=[Players can't cast spells from graveyards or activate abilities of cards in graveyards.<br/>
Whenever a creature dies, you gain 1 life.]=];
Flavor=[=["Let no trace of the vampires' foulness remain."]=];
CardNumber="XLN2";
MultiverseID=435153;
Rulings={
	{Date="2017-09-29";Text=[=[Activated abilities contain a colon. They’re generally written “[Cost]: [Effect].” Some keyword abilities (such as embalm from the Amonkhet set) are activated abilities and will have colons in their reminder text. Triggered abilities (starting with “when,” “whenever,” or “at”) are unaffected by Ashes of the Abhorrent.]=];};
	{Date="2017-09-29";Text=[=[Ashes of the Abhorrent doesn’t stop players from playing land cards from the graveyard if an effect allows them to do so.]=];};
	{Date="2017-09-29";Text=[=[If a creature dies at the same time that Ashes of the Abhorrent is destroyed, you’ll gain 1 life.]=];};
};
};

{Name="Atzal, Cave of Eternity";
SetCode="RIX";
cmc=3;
Type="Legendary Land";
SuperTypes={"Legendary"};
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Journey to Eternity.)<br/>
{{Tap}}: Add one mana of any color to your mana pool.<br/>
{{3}}{{B}}{{G}}, {{Tap}}: Return target creature card from your graveyard to the battlefield.]=];
Flavor=[=[. . . but every end is a new beginning.]=];
CardNumber="RIX160b";
MultiverseID=439819;
};

{Name="Atzocan Archer";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Human Archer";
Types={"Creature"};
SubTypes={"Human";"Archer";};
Rarity="Uncommon";
Text=[=[Reach<br/>
When Atzocan Archer enters the battlefield, you may have it fight another target creature. (Each deals damage equal to its power to the other.)]=];
Flavor=[=[His arrows are fletched with feathers from the greatest of the winged dinosaurs.]=];
CardNumber="XLN176";
Power="1";
Toughness="4";
MultiverseID=435331;
Rulings={
	{Date="2017-09-29";Text=[=[You must choose another target creature (if able) as Atzocan Archer’s triggered ability is put on the stack. You choose as that ability resolves whether those creatures fight.]=];};
	{Date="2017-09-29";Text=[=[If Atzocan Archer isn’t on the battlefield as its triggered ability resolves, or if the target of that ability is illegal, no creature will deal or be dealt damage.]=];};
	{Date="2017-09-29";Text=[=[Atzocan Archer’s ability can target another creature you control (such as a Dinosaur with an enrage ability).]=];};
};
};

{Name="Atzocan Seer";
SetCode="RIX";
Manacost="{{1}}{{G}}{{W}}";
cmc=3;
Colors={"White";"Green";};
Type="Creature — Human Druid";
Types={"Creature"};
SubTypes={"Human";"Druid";};
Rarity="Uncommon";
Text=[=[{{Tap}}: Add one mana of any color to your mana pool.<br/>
Sacrifice Atzocan Seer: Return target Dinosaur card from your graveyard to your hand.]=];
Flavor=[=[Streams of gold and bright feathers flash in the orb, visions of past and future.]=];
CardNumber="RIX153";
Power="2";
Toughness="3";
MultiverseID=439810;
Rulings={
	{Date="2018-01-19";Text=[=[Atzocan Seer’s second ability doesn’t include the {Tap} symbol. You can activate that ability even if it’s already been tapped, perhaps because you activated its first ability.]=];};
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Awakened Amalgam";
SetCode="RIX";
Manacost="{{4}}";
cmc=4;
Type="Artifact Creature — Golem";
Types={"Artifact";"Creature";};
SubTypes={"Golem"};
Rarity="Rare";
Text=[=[Awakened Amalgam's power and toughness are each equal to the number of differently named lands you control.]=];
Flavor=[=["The fools have done it."<br/>
—Tishana]=];
CardNumber="RIX175";
Power="*";
Toughness="*";
MultiverseID=439837;
Rulings={
	{Date="2018-01-19";Text=[=[The ability that defines Awakened Amalgam’s power and toughness works in all zones, not just the battlefield.]=];};
	{Date="2018-01-19";Text=[=[To determine the number of differently named lands you control, count each land you control once, but only if its English name isn’t exactly the same as another land you’ve already counted this way. For example, if you control four lands named Plains, two named Island, and one named Drowned Catacomb, Awakened Amalgam is a 3/3 creature.]=];};
};
};

{Name="Axis of Mortality";
SetCode="XLN";
Manacost="{{4}}{{W}}{{W}}";
cmc=6;
Colors={"White"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Mythic Rare";
Text=[=[At the beginning of your upkeep, you may have two target players exchange life totals.]=];
Flavor=[=[The Church of Dusk teaches there is no gain without loss, no triumph without sacrifice, no drink of exquisite crimson without a dying gasp.]=];
CardNumber="XLN3";
MultiverseID=435154;
Rulings={
	{Date="2017-09-29";Text=[=[If one of the targeted players is an illegal target when the triggered ability of Axis of Mortality tries to resolve, the exchange won’t happen. Neither player’s life total will change.]=];};
	{Date="2017-09-29";Text=[=[When the life totals are exchanged, each player gains or loses the amount of life necessary to equal the other player’s previous life total. For example, if player A has 5 life and player B has 3 life before the exchange, player A will lose 2 life and player B will gain 2 life. Replacement effects may modify these gains and losses, and triggered abilities may trigger on them.]=];};
	{Date="2017-09-29";Text=[=[If a player can’t gain life, that player can’t exchange life totals with a player with a higher life total. If a player can’t lose life, that player can’t exchange life totals with a player with a lower life total. In either of these cases, neither player’s life total will change.]=];};
	{Date="2017-09-29";Text=[=[In a Two-Headed Giant game, each player is considered to have the same life total as his or her team. If the two targeted players are on different teams, those players gain or lose the appropriate amount of life so that the teams end up exchanging life totals. If the two targeted players are teammates, they can’t exchange life totals.]=];};
};
};

{Name="Azcanta, the Sunken Ruin";
SetCode="XLN";
cmc=2;
Type="Legendary Land";
SuperTypes={"Legendary"};
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Search for Azcanta.)<br/>
{{Tap}}: Add {{U}} to your mana pool.<br/>
{{2}}{{U}}, {{Tap}}: Look at the top four cards of your library. You may reveal a noncreature, nonland card from among them and put it into your hand. Put the rest on the bottom of your library in any order.]=];
CardNumber="XLN74b";
MultiverseID=435227;
};

{Name="Azor, the Lawbringer";
SetCode="RIX";
Manacost="{{2}}{{W}}{{W}}{{U}}{{U}}";
cmc=6;
Colors={"White";"Blue";};
Type="Legendary Creature — Sphinx";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Sphinx"};
Rarity="Mythic Rare";
Text=[=[Flying<br/>
When Azor, the Lawbringer enters the battlefield, each opponent can't cast instant or sorcery spells during that player's next turn.<br/>
Whenever Azor attacks, you may pay {{X}}{{W}}{{U}}{{U}}. If you do, you gain X life and draw X cards.]=];
CardNumber="RIX154";
Power="6";
Toughness="6";
MultiverseID=439811;
Rulings={
	{Date="2018-01-19";Text=[=[If multiple effects say that an opponent can’t cast instant or sorcery spells during that player’s next turn, they all apply to the same turn.]=];};
};
};

{Name="Azor's Gateway";
SetCode="RIX";
Manacost="{{2}}";
cmc=2;
Type="Legendary Artifact";
SuperTypes={"Legendary"};
Types={"Artifact"};
Rarity="Mythic Rare";
Text=[=[{{1}}, {{Tap}}: Draw a card, then exile a card from your hand. If cards with five or more different converted mana costs are exiled with Azor's Gateway, you gain 5 life, untap Azor's Gateway, and transform it.]=];
CardNumber="RIX176a";
MultiverseID=439838;
Rulings={
	{Date="2018-01-19";Text=[=[The cards you exile from your hand are exiled face up.]=];};
	{Date="2018-01-19";Text=[=[The converted mana cost of a split card, such as a card with aftermath from the Amonkhet block, is based on the combined mana cost of its two halves. A split card doesn’t have two converted mana costs.]=];};
	{Date="2018-01-19";Text=[=[If a card in exile has {X} in its mana cost, X is considered to be 0.]=];};
	{Date="2018-01-19";Text=[=[If an object has no mana cost, its converted mana cost is 0. A converted mana cost of 0 can still help unlock Azor’s Gateway.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Baffling End";
SetCode="RIX";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Uncommon";
Text=[=[When Baffling End enters the battlefield, exile target creature an opponent controls with converted mana cost 3 or less.<br/>
When Baffling End leaves the battlefield, target opponent creates a 3/3 green Dinosaur creature token with trample.]=];
CardNumber="RIX1";
MultiverseID=439658;
Rulings={
	{Date="2018-01-19";Text=[=[While Baffling End’s two abilities are flavorfully related, they are independent. If the first ability doesn’t resolve (perhaps because the target gained hexproof), the second will still create a Dinosaur token when Baffling End leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[In a multiplayer game, the target opponent who creates a Dinosaur token doesn’t have to be the same one whose creature was exiled.]=];};
};
};

{Name="Belligerent Brontodon";
SetCode="XLN";
Manacost="{{5}}{{G}}{{W}}";
cmc=7;
Colors={"White";"Green";};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Each creature you control assigns combat damage equal to its toughness rather than its power.]=];
Flavor=[=[Predators try to separate the young, old, or injured from the rest of the herd. The alternative is crushing defeat.]=];
CardNumber="XLN218";
Power="4";
Toughness="6";
MultiverseID=435374;
Rulings={
	{Date="2017-09-29";Text=[=[Belligerent Brontodon’s ability doesn’t actually change any creature’s power. It changes only the amount of combat damage it assigns. All other rules and effects that check power or toughness use the real values. For example, Hunt the Weak won’t cause a creature to fight with its toughness.]=];};
};
};

{Name="Bellowing Aegisaur";
SetCode="XLN";
Manacost="{{5}}{{W}}";
cmc=6;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Enrage — Whenever Bellowing Aegisaur is dealt damage, put a +1/+1 counter on each other creature you control.]=];
Flavor=[=[Its roaring challenge is punctuated by the slam of its tail on the earth, rousing the herds of the plains.]=];
CardNumber="XLN4";
Power="3";
Toughness="5";
MultiverseID=435155;
Rulings={
	{Date="2017-09-29";Text=[=[If another creature you control is dealt lethal damage at the same time that Bellowing Aegisaur is dealt damage, the other creature won’t be saved by the +1/+1 counter that would have been put on it.]=];};
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Bishop of Binding";
SetCode="RIX";
Manacost="{{3}}{{W}}";
cmc=4;
Colors={"White"};
Type="Creature — Vampire Cleric";
Types={"Creature"};
SubTypes={"Vampire";"Cleric";};
Rarity="Rare";
Text=[=[When Bishop of Binding enters the battlefield, exile target creature an opponent controls until Bishop of Binding leaves the battlefield.<br/>
Whenever Bishop of Binding attacks, target Vampire gets +X/+X until end of turn, where X is the power of the exiled card.]=];
CardNumber="RIX2";
Power="1";
Toughness="1";
MultiverseID=439659;
Rulings={
	{Date="2018-01-19";Text=[=[If Bishop of Binding leaves the battlefield before its first triggered ability tries to resolve, the target creature won’t be exiled.]=];};
	{Date="2018-01-19";Text=[=[Auras attached to the exiled creature will be put into their owners’ graveyards. Any Equipment will become unattached and remain on the battlefield. Any counters on the exiled creature will cease to exist.]=];};
	{Date="2018-01-19";Text=[=[If a token is exiled this way, it will cease to exist and won’t return to the battlefield.]=];};
	{Date="2018-01-19";Text=[=[The value of X is determined only as Bishop of Binding’s second ability resolves. It won’t change if the card leaves exile later in the turn.]=];};
	{Date="2018-01-19";Text=[=[If there is no exiled card as Bishop of Binding’s last ability resolves, most likely because Bishop of Binding left the battlefield while that ability was on the stack, X is 0. The same is true if the exiled card doesn’t have a power, most likely because it’s a noncreature card that had become a creature.]=];};
	{Date="2018-01-19";Text=[=[If a Vehicle is exiled with Bishop of Binding, use its printed power to determine the value of X. ]=];};
};
};

{Name="Bishop of Rebirth";
SetCode="XLN";
Manacost="{{3}}{{W}}{{W}}";
cmc=5;
Colors={"White"};
Type="Creature — Vampire Cleric";
Types={"Creature"};
SubTypes={"Vampire";"Cleric";};
Rarity="Rare";
Text=[=[Vigilance<br/>
Whenever Bishop of Rebirth attacks, you may return target creature card with converted mana cost 3 or less from your graveyard to the battlefield.]=];
Flavor=[=["In the death of the foe lies the resurrection of the faithful."]=];
CardNumber="XLN5";
Power="3";
Toughness="4";
MultiverseID=435156;
Rulings={
	{Date="2017-09-29";Text=[=[If the mana cost of a card in your graveyard includes X, X is considered to be 0.]=];};
	{Date="2017-09-29";Text=[=[All attackers are chosen at once. You can’t attack with Bishop of Rebirth, return a creature card to the battlefield, and then attack with that creature.]=];};
	{Date="2017-09-29";Text=[=[If the creature returned to the battlefield has any abilities that trigger when creatures attack, those abilities won’t trigger.]=];};
};
};

{Name="Bishop of the Bloodstained";
SetCode="XLN";
Manacost="{{3}}{{B}}{{B}}";
cmc=5;
Colors={"Black"};
Type="Creature — Vampire Cleric";
Types={"Creature"};
SubTypes={"Vampire";"Cleric";};
Rarity="Uncommon";
Text=[=[When Bishop of the Bloodstained enters the battlefield, target opponent loses 1 life for each Vampire you control.]=];
Flavor=[=["They shall give us all they have as penance for their resistance. Their ships. Their goods. Their rebellious blood."]=];
CardNumber="XLN91";
Power="3";
Toughness="3";
MultiverseID=435245;
Rulings={
	{Date="2017-09-29";Text=[=[The number of Vampires you control is counted only as Bishop of the Bloodstained’s ability resolves. If Bishop of the Bloodstained is still on the battlefield, it’ll count itself.]=];};
};
};

{Name="Bishop's Soldier";
SetCode="XLN";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Common";
Text=[=[Lifelink]=];
Flavor=[=[Vampires, the noble class of old Torrezon, are guided by their dual loyalties to church and crown.]=];
CardNumber="XLN6";
Power="2";
Toughness="2";
MultiverseID=435157;
};

{Name="Blazing Hope";
SetCode="RIX";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Exile target creature with power greater than or equal to your life total.]=];
Flavor=[=["No shadow remains for you to hide in."<br/>
—Caparocti Sunborn]=];
CardNumber="RIX3";
MultiverseID=439660;
};

{Name="Blight Keeper";
SetCode="XLN";
Manacost="{{B}}";
cmc=1;
Colors={"Black"};
Type="Creature — Bat Imp";
Types={"Creature"};
SubTypes={"Bat";"Imp";};
Rarity="Common";
Text=[=[Flying<br/>
{{7}}{{B}}, {{Tap}}, Sacrifice Blight Keeper: Target opponent loses 4 life and you gain 4 life.]=];
Flavor=[=[It withers fruit and flesh alike.]=];
CardNumber="XLN92";
Power="1";
Toughness="1";
MultiverseID=435246;
};

{Name="Blinding Fog";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Prevent all damage that would be dealt to creatures this turn. Creatures you control gain hexproof until end of turn. (They can't be the targets of spells or abilities your opponents control.)]=];
Flavor=[=["I see you, shiny soldiers, but you won't see me."]=];
CardNumber="XLN177";
MultiverseID=435332;
Rulings={
	{Date="2017-09-29";Text=[=[Blinding Fog prevents all damage that would be dealt to creatures, not just combat damage.]=];};
	{Date="2017-09-29";Text=[=[Damage that would be dealt to creatures that enter the battlefield later in the turn will also be prevented. However, creatures that come under your control later in the turn won’t gain hexproof.]=];};
};
};

{Name="Blood Sun";
SetCode="RIX";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Rare";
Text=[=[When Blood Sun enters the battlefield, draw a card.<br/>
All lands lose all abilities except mana abilities.]=];
Flavor=[=[As the struggle raged for control of the Immortal Sun, the world grew dark under a blood-red sky.]=];
CardNumber="RIX92";
MultiverseID=439749;
Rulings={
	{Date="2018-01-19";Text=[=[A mana ability is an ability that produces mana, not an ability that costs mana.]=];};
	{Date="2018-01-19";Text=[=[Land cards not on the battlefield aren’t affected.]=];};
	{Date="2018-01-19";Text=[=[If a land has an ability that triggers “when” it enters the battlefield, it will lose that ability before it triggers.]=];};
	{Date="2018-01-19";Text=[=[If a land has an ability that causes it to enter the battlefield tapped, it will lose that ability before it applies. The same is also true of any other abilities of a land that modify how it enters the battlefield or apply “as” it enters the battlefield, such as the first ability of Unclaimed Territory.]=];};
	{Date="2018-01-19";Text=[=[If a land gains an ability after Blood Sun has entered the battlefield, it keeps that ability.]=];};
	{Date="2018-01-19";Text=[=[If a land has an ability that continuously changes the types of other lands (such as Urborg, Tomb of Yawgmoth does), that ability will apply before Blood Sun removes that land’s abilities. If a land has an ability that grants abilities to other objects, Blood Sun will stop it from doing so.]=];};
};
};

{Name="Bloodcrazed Paladin";
SetCode="XLN";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Vampire Knight";
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Rare";
Text=[=[Flash<br/>
Bloodcrazed Paladin enters the battlefield with a +1/+1 counter on it for each creature that died this turn.]=];
Flavor=[=[When a paladin undertaking the Blood Fast finally gives in to hunger, the violence is sudden, explosive, and complete.]=];
CardNumber="XLN93";
Power="1";
Toughness="1";
MultiverseID=435247;
Rulings={
	{Date="2017-09-29";Text=[=[Bloodcrazed Paladin’s last ability counts all creatures that were put into any graveyard from the battlefield this turn, including token creatures and noncreature cards that were creatures as they left the battlefield. It doesn’t check whether any of them are still in graveyards.]=];};
	{Date="2017-09-29";Text=[=[Bloodcrazed Paladin’s last ability won’t count creatures that were put directly into a zone other than the graveyard, perhaps because of a replacement effect (for example, a creature that was exiled instead or a commander that moved to the command zone in the Commander variant).]=];};
};
};

{Name="Blossom Dryad";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Dryad";
Types={"Creature"};
SubTypes={"Dryad"};
Rarity="Common";
Text=[=[{{Tap}}: Untap target land.]=];
Flavor=[=[The only force on Ixalan not interested in finding the golden city is Ixalan itself.]=];
CardNumber="XLN178";
Power="2";
Toughness="2";
MultiverseID=435333;
};

{Name="Bombard";
SetCode="RIX";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Bombard deals 4 damage to target creature.]=];
Flavor=[=["Want to sink a ship? Blow a hole in the hull. Want to kill a regisaur? Same answer."<br/>
—Captain Brandis Thorn]=];
CardNumber="RIX93";
MultiverseID=439750;
};

{Name="Bonded Horncrest";
SetCode="XLN";
Manacost="{{3}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Bonded Horncrest can't attack or block alone.]=];
Flavor=[=["You don't tame a horncrest. You convince it that it's easier to destroy something else."<br/>
—Amautl, knight of Atzocan]=];
CardNumber="XLN133";
Power="5";
Toughness="5";
MultiverseID=435287;
Rulings={
	{Date="2017-09-29";Text=[=[If you control more than one Bonded Horncrest, they can attack or block together, even if no other creatures attack or block.]=];};
	{Date="2017-09-29";Text=[=[Although Bonded Horncrest can’t attack alone, other attacking creatures don’t have to attack the same player or planeswalker. For example, Bonded Horncrest could attack an opponent and another creature could attack a planeswalker that opponent controls. Similarly, other blocking creatures don’t have to block the same creature that Bonded Horncrest blocks.]=];};
	{Date="2017-09-29";Text=[=[Once Bonded Horncrest has attacked or blocked, it will remain in combat even if you no longer control another attacking or blocking creature.]=];};
	{Date="2017-09-29";Text=[=[If an effect says that Bonded Horncrest attacks or blocks if able and you control another creature able to attack or block, you must attack or block with Bonded Horncrest and that creature.]=];};
	{Date="2017-09-29";Text=[=[In a Two-Headed Giant game, Bonded Horncrest can attack or block with a creature controlled by your teammate, even if no other creatures you control are attacking or blocking.]=];};
};
};

{Name="Boneyard Parley";
SetCode="XLN";
Manacost="{{5}}{{B}}{{B}}";
cmc=7;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Mythic Rare";
Text=[=[Exile up to five target creature cards from graveyards. An opponent separates those cards into two piles. Put all cards from the pile of your choice onto the battlefield under your control and the rest into their owners' graveyards.]=];
CardNumber="XLN94";
MultiverseID=435248;
Rulings={
	{Date="2017-09-29";Text=[=[The creature cards may come from different graveyards.]=];};
	{Date="2017-09-29";Text=[=[You (not your opponent) choose which pile to put onto the battlefield and which to return to graveyards.]=];};
	{Date="2017-09-29";Text=[=[A pile can have no cards in it. In this case, you’ll choose whether to put all the exiled cards onto the battlefield or into graveyards.]=];};
	{Date="2017-09-29";Text=[=[In multiplayer games, you choose an opponent to separate the cards when the ability resolves. This doesn’t target that opponent. Because the cards are revealed, all players may see the cards and offer opinions.]=];};
	{Date="2017-09-29";Text=[=[In a multiplayer game, if a player leaves the game, all cards that player owns leave as well. If you leave the game, any creatures you control from Boneyard Parley’s effect are exiled.]=];};
};
};

{Name="Brass's Bounty";
SetCode="RIX";
Manacost="{{6}}{{R}}";
cmc=7;
Colors={"Red"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Rare";
Text=[=[For each land you control, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=["Why squabble for trinkets when we could be living large off all this gold?"<br/>
—Admiral Beckett Brass]=];
CardNumber="RIX94";
MultiverseID=439751;
};

{Name="Brazen Buccaneers";
SetCode="XLN";
Manacost="{{3}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[Haste<br/>
When Brazen Buccaneers enters the battlefield, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
CardNumber="XLN134";
Power="2";
Toughness="2";
MultiverseID=435288;
Rulings={
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Brazen Freebooter";
SetCode="RIX";
Manacost="{{3}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[When Brazen Freebooter enters the battlefield, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=[Finders, keepers.]=];
CardNumber="RIX95";
Power="3";
Toughness="3";
MultiverseID=439752;
};

{Name="Bright Reprisal";
SetCode="XLN";
Manacost="{{4}}{{W}}";
cmc=5;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Destroy target attacking creature.<br/>
Draw a card.]=];
Flavor=[=[Vampires know blood and the systems that carry it. And they know exactly where to strike to set it free.]=];
CardNumber="XLN7";
MultiverseID=435158;
Rulings={
	{Date="2017-09-29";Text=[=[If the target creature is an illegal target by the time Bright Reprisal resolves, the entire spell is countered. You won’t draw a card. If, on the other hand, the target is a legal target but isn’t destroyed (most likely because it has indestructible), you’ll draw a card.]=];};
};
};

{Name="Buccaneer's Bravado";
SetCode="RIX";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Choose one —<br/>
• Target creature gets +1/+1 and gains first strike until end of turn.<br/>
• Target Pirate gets +1/+1 and gains double strike until end of turn.]=];
Flavor=[=[Never underestimate the power of panache.]=];
CardNumber="RIX96";
MultiverseID=439753;
};

{Name="Burning Sun's Avatar";
SetCode="XLN";
Manacost="{{3}}{{R}}{{R}}{{R}}";
cmc=6;
Colors={"Red"};
Type="Creature — Dinosaur Avatar";
Types={"Creature"};
SubTypes={"Dinosaur";"Avatar";};
Rarity="Rare";
Text=[=[When Burning Sun's Avatar enters the battlefield, it deals 3 damage to target opponent and 3 damage to up to one target creature.]=];
Flavor=[=["Tilonalli's searing rays carry the spark of life's eventual destruction as all light fades."<br/>
—Chitlati, Lightning Rider]=];
CardNumber="XLN135";
Power="6";
Toughness="6";
MultiverseID=435289;
Rulings={
	{Date="2017-09-29";Text=[=[The ability of Burning Sun’s Avatar can target any creature, not just one controlled by the target opponent.]=];};
	{Date="2017-09-29";Text=[=[If the ability of Burning Sun’s Avatar has two targets and one becomes illegal, the other will still be dealt damage.]=];};
};
};

{Name="Cacophodon";
SetCode="RIX";
Manacost="{{3}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Enrage — Whenever Cacophodon is dealt damage, untap target permanent.]=];
Flavor=[=[When a cacophodon is angry, the whole jungle knows.]=];
CardNumber="RIX123";
Power="2";
Toughness="5";
MultiverseID=439780;
Rulings={
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Call to the Feast";
SetCode="XLN";
Manacost="{{2}}{{W}}{{B}}";
cmc=4;
Colors={"White";"Black";};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Create three 1/1 white Vampire creature tokens with lifelink.]=];
Flavor=[=[By the law of church and crown, vampires feed only on the blood of the guilty—those declared heretics, rebels, or enemies of war.]=];
CardNumber="XLN219";
MultiverseID=435375;
};

{Name="Canal Monitor";
SetCode="RIX";
Manacost="{{4}}{{B}}";
cmc=5;
Colors={"Black"};
Type="Creature — Lizard";
Types={"Creature"};
SubTypes={"Lizard"};
Rarity="Common";
Flavor=[=[The first goblin tried to swim the canal. The second built a raft. The last and craftiest goblin launched herself from a firecannon and soared over the canal, trailing smoke. All were eaten, but only one was cooked.]=];
CardNumber="RIX63";
Power="5";
Toughness="3";
MultiverseID=439720;
};

{Name="Cancel";
SetCode="XLN";
Manacost="{{1}}{{U}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Counter target spell.]=];
Flavor=[=["Hold your fire, obviously."<br/>
—Captain Brandis Thorn]=];
CardNumber="XLN47";
MultiverseID=435199;
};

{Name="Captain Lannery Storm";
SetCode="XLN";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Legendary Creature — Human Pirate";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[Haste<br/>
Whenever Captain Lannery Storm attacks, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."<br/>
Whenever you sacrifice a Treasure, Captain Lannery Storm gets +1/+0 until end of turn.]=];
CardNumber="XLN136";
Power="2";
Toughness="2";
MultiverseID=435290;
Rulings={
	{Date="2017-09-29";Text=[=[You can activate the mana ability of a Treasure even if you have nothing to spend that mana on.]=];};
	{Date="2017-09-29";Text=[=[Captain Lannery Storm’s last ability triggers whenever you sacrifice a Treasure for any reason, not just to activate a Treasure’s mana ability.]=];};
	{Date="2017-09-29";Text=[=[If you sacrifice Treasures to cast Captain Lannery Storm, its last ability won’t trigger for those Treasures.]=];};
};
};

{Name="Captain's Hook";
SetCode="RIX";
Manacost="{{3}}";
cmc=3;
Type="Artifact — Equipment";
Types={"Artifact"};
SubTypes={"Equipment"};
Rarity="Rare";
Text=[=[Equipped creature gets +2/+0, has menace, and is a Pirate in addition to its other creature types.<br/>
Whenever Captain's Hook becomes unattached from a permanent, destroy that permanent.<br/>
Equip {{1}}]=];
CardNumber="RIX177";
MultiverseID=439840;
Rulings={
	{Date="2018-01-19";Text=[=[Captain’s Hook becomes unattached from the creature it’s equipping if you equip it to a new creature, if Captain’s Hook leaves the battlefield, if the equipped creature ceases to be a creature, or if Captain’s Hook ceases to be an Equipment. (It also becomes unattached if the equipped creature leaves the battlefield, but the triggered ability won’t do anything in that case.)]=];};
};
};

{Name="Captivating Crew";
SetCode="XLN";
Manacost="{{3}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[{{3}}{{R}}: Gain control of target creature an opponent controls until end of turn. Untap that creature. It gains haste until end of turn. Activate this ability only any time you could cast a sorcery.]=];
Flavor=[=["We sail. We plunder. Then we dance."]=];
CardNumber="XLN137";
Power="4";
Toughness="3";
MultiverseID=435291;
Rulings={
	{Date="2017-09-29";Text=[=[You can target and gain control of an untapped creature this way.]=];};
};
};

{Name="Carnage Tyrant";
SetCode="XLN";
Manacost="{{4}}{{G}}{{G}}";
cmc=6;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Mythic Rare";
Text=[=[Carnage Tyrant can't be countered.<br/>
Trample, hexproof]=];
Flavor=[=[Sun Empire commanders are well versed in advanced martial strategy. Still, the correct maneuver is usually to deploy the giant, implacable death lizard.]=];
CardNumber="XLN179";
Power="7";
Toughness="6";
MultiverseID=435334;
};

{Name="Castaway's Despair";
SetCode="XLN";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Common";
Text=[=[Enchant creature<br/>
When Castaway's Despair enters the battlefield, tap enchanted creature.<br/>
Enchanted creature doesn't untap during its controller's untap step.]=];
CardNumber="XLN281";
MultiverseID=435442;
Rulings={
	{Date="2017-09-29";Text=[=[Castaway’s Despair can target a creature that’s already tapped.]=];};
};
};

{Name="Champion of Dusk";
SetCode="RIX";
Manacost="{{3}}{{B}}{{B}}";
cmc=5;
Colors={"Black"};
Type="Creature — Vampire Knight";
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Rare";
Text=[=[When Champion of Dusk enters the battlefield, you draw X cards and you lose X life, where X is the number of Vampires you control.]=];
Flavor=[=["Drench these golden streets in the blood of our enemies."]=];
CardNumber="RIX64";
Power="4";
Toughness="4";
MultiverseID=439721;
Rulings={
	{Date="2018-01-19";Text=[=[The number of Vampires you control is counted only as Champion of Dusk’s ability resolves. If Champion of Dusk is still on the battlefield, it’ll count itself.]=];};
};
};

{Name="Charging Monstrosaur";
SetCode="XLN";
Manacost="{{4}}{{R}}";
cmc=5;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Trample, haste]=];
Flavor=[=["I knew I should have stayed with the boat. Always stay with the boat!"]=];
CardNumber="XLN138";
Power="5";
Toughness="5";
MultiverseID=435292;
};

{Name="Charging Tuskodon";
SetCode="RIX";
Manacost="{{3}}{{R}}{{R}}";
cmc=5;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Trample<br/>
If Charging Tuskodon would deal combat damage to a player, it deals double that damage to that player instead.]=];
Flavor=[=[It doesn't hold grudges. It runs them down and impales them.]=];
CardNumber="RIX97";
Power="4";
Toughness="4";
MultiverseID=439754;
Rulings={
	{Date="2018-01-19";Text=[=[If Charging Tuskodon has trample damage to assign to a player, that damage is assigned based on its actual power and is doubled only as it’s dealt. For example, if Charging Tuskodon is blocked by a 3/3 creature, the attacking player can assign 1 damage to the defending player and then Charging Tuskodon deals 2 damage to that player.]=];};
	{Date="2018-01-19";Text=[=[The doubled damage Charging Tuskodon deals is still combat damage.]=];};
};
};

{Name="Chart a Course";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Draw two cards. Then discard a card unless you attacked with a creature this turn.]=];
Flavor=[=[While other pirates prowl for treasure, Captain Parrish plunders secrets.]=];
CardNumber="XLN48";
MultiverseID=435200;
};

{Name="Cherished Hatchling";
SetCode="RIX";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[When Cherished Hatchling dies, you may cast Dinosaur spells this turn as though they had flash, and whenever you cast a Dinosaur spell this turn, it gains "When this creature enters the battlefield, you may have it fight another target creature."]=];
Flavor=[=[Despite its appearance, it's anything but defenseless.]=];
CardNumber="RIX124";
Power="2";
Toughness="1";
MultiverseID=439781;
Rulings={
	{Date="2018-01-19";Text=[=[During the turn Cherished Hatchling dies, you may cast any number of Dinosaurs as though they had flash.]=];};
	{Date="2018-01-19";Text=[=[You must pay the costs for spells you cast this way. If there’s an alternative cost you can pay instead of the mana cost for a Dinosaur spell, you may pay that cost instead.]=];};
	{Date="2018-01-19";Text=[=[For the triggered ability that the entering Dinosaur gains, if the target is illegal when it tries to resolve or if the Dinosaur that entered the battlefield has left the battlefield, no creature will deal or be dealt damage.]=];};
	{Date="2018-01-19";Text=[=[For the triggered ability that the entering Dinosaur gains, you choose a target when the ability goes on the stack, but you don’t choose until that ability resolves whether those creatures fight.]=];};
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Cinder Barrens";
SetCode="RIX";
Type="Land";
Types={"Land"};
Rarity="Common";
Text=[=[Cinder Barrens enters the battlefield tapped.<br/>
{{Tap}}: Add {{B}} or {{R}} to your mana pool.]=];
Flavor=[=["Burn their fleet to the waterline, and sink whatever's left."<br/>
—Angrath]=];
CardNumber="RIX205";
MultiverseID=441899;
};

{Name="Cleansing Ray";
SetCode="RIX";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Choose one —<br/>
• Destroy target Vampire.<br/>
• Destroy target enchantment.]=];
Flavor=[=["The sun creates, sustains, and consumes so it can create again."<br/>
—Caparocti Sunborn]=];
CardNumber="RIX4";
MultiverseID=439661;
};

{Name="Cobbled Wings";
SetCode="XLN";
Manacost="{{2}}";
cmc=2;
Type="Artifact — Equipment";
Types={"Artifact"};
SubTypes={"Equipment"};
Rarity="Common";
Text=[=[Equipped creature has flying.<br/>
Equip {{1}} ({{1}}: Attach to target creature you control. Equip only as a sorcery.)]=];
Flavor=[=[Flotsam held together by optimism.]=];
CardNumber="XLN233";
MultiverseID=435389;
};

{Name="Colossal Dreadmaw";
SetCode="RIX";
Manacost="{{4}}{{G}}{{G}}";
cmc=6;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Trample]=];
Flavor=[=["Remember when it was the most terrifying thing you'd ever seen?"<br/>
—Captain Lannery Storm]=];
CardNumber="RIX125";
Power="6";
Toughness="6";
MultiverseID=439782;
};

{Name="Commune with Dinosaurs";
SetCode="XLN";
Manacost="{{G}}";
cmc=1;
Colors={"Green"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Look at the top five cards of your library. You may reveal a Dinosaur or land card from among them and put it into your hand. Put the rest on the bottom of your library in any order.]=];
CardNumber="XLN181";
MultiverseID=435336;
Rulings={
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Conqueror's Foothold";
SetCode="XLN";
cmc=4;
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Conqueror's Galleon.)<br/>
{{Tap}}: Add {{C}} to your mana pool.<br/>
{{2}}, {{Tap}}: Draw a card, then discard a card.<br/>
{{4}}, {{Tap}}: Draw a card.<br/>
{{6}}, {{Tap}}: Return target card from your graveyard to your hand.]=];
CardNumber="XLN234b";
MultiverseID=435391;
};

{Name="Conqueror's Galleon";
SetCode="XLN";
Manacost="{{4}}";
cmc=4;
Type="Artifact — Vehicle";
Types={"Artifact"};
SubTypes={"Vehicle"};
Rarity="Rare";
Text=[=[When Conqueror's Galleon attacks, exile it at end of combat, then return it to the battlefield transformed under your control.<br/>
Crew 4 (Tap any number of creatures you control with total power 4 or more: This Vehicle becomes an artifact creature until end of turn.)]=];
CardNumber="XLN234a";
Power="2";
Toughness="10";
MultiverseID=435390;
Rulings={
	{Date="2017-09-29";Text=[=[Conqueror’s Galleon won’t be exiled if it doesn’t survive combat.]=];};
	{Date="2017-09-29";Text=[=[Unlike the other double-faced cards in the Ixalan set, Conqueror’s Galleon is exiled and then returned to battlefield transformed. It will be considered a new object entering the battlefield. Notably, it will return to the battlefield untapped.]=];};
	{Date="2017-09-29";Text=[=[Each Vehicle is printed with a power and toughness, but it’s not a creature. If it becomes a creature (most likely through its crew ability), it will have that power and toughness.]=];};
	{Date="2017-09-29";Text=[=[If an effect causes a Vehicle to become an artifact creature with a specified power and toughness, that effect overwrites the Vehicle’s printed power and toughness.]=];};
	{Date="2017-09-29";Text=[=[Vehicle is an artifact type, not a creature type. A Vehicle that’s crewed won’t normally have any creature type.]=];};
	{Date="2017-09-29";Text=[=[Once a player announces that he or she is activating a crew ability, no player may take other actions until the ability has been paid for. Notably, players can’t try to stop the ability by changing a creature’s power or by removing or tapping a creature.]=];};
	{Date="2017-09-29";Text=[=[Any untapped creature you control can be tapped to pay a crew cost, even one that just came under your control.]=];};
	{Date="2017-09-29";Text=[=[You may tap more creatures than necessary to activate a crew ability.]=];};
	{Date="2017-09-29";Text=[=[Creatures that crew a Vehicle aren’t attached to it or related in any other way. Effects that affect the Vehicle, such as by destroying it or giving it a +1/+1 counter, don’t affect the creatures that crewed it.]=];};
	{Date="2017-09-29";Text=[=[Once a Vehicle becomes a creature, it behaves exactly like any other artifact creature. It can’t attack unless you’ve controlled it continuously since your turn began, it can block if it’s untapped, it can be tapped to pay a Vehicle’s crew cost, and so on.]=];};
	{Date="2017-09-29";Text=[=[You may activate a crew ability of a Vehicle even if it’s already an artifact creature. Doing so has no effect on the Vehicle. It doesn’t change its power and toughness.]=];};
	{Date="2017-09-29";Text=[=[For a Vehicle to be able to attack, it must be a creature as the declare attackers step begins, so the latest you can activate its crew ability to attack with it is during the beginning of combat step. For a Vehicle to be able to block, it must be a creature as the declare blockers step begins, so the latest you can activate its crew ability to block with it is during the declare attackers step. In either case, players may take actions after the crew ability resolves but before the Vehicle has been declared as an attacking or blocking creature.]=];};
	{Date="2017-09-29";Text=[=[When a Vehicle becomes a creature, that doesn’t count as having a creature enter the battlefield. The permanent was already on the battlefield; it only changed its types. Abilities that trigger whenever a creature enters the battlefield won’t trigger.]=];};
	{Date="2017-09-29";Text=[=[If a permanent becomes a copy of a Vehicle, the copy won’t be a creature, even if the Vehicle it’s copying has become an artifact creature.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Contract Killing";
SetCode="XLN";
Manacost="{{3}}{{B}}{{B}}";
cmc=5;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Destroy target creature. Create two colorless Treasure artifact tokens with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=[For a price, the floating city of High and Dry offers all the amenities a pirate could want: rest, recreation, and revenge.]=];
CardNumber="XLN95";
MultiverseID=435249;
Rulings={
	{Date="2017-09-29";Text=[=[If the target creature is an illegal target by the time Contract Killing resolves, the entire spell is countered. You won’t get Treasures. If, on the other hand, the target is a legal target but isn’t destroyed (most likely because it has indestructible), you’ll get Treasures.]=];};
};
};

{Name="Costly Plunder";
SetCode="XLN";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[As an additional cost to cast Costly Plunder, sacrifice an artifact or creature.<br/>
Draw two cards.]=];
Flavor=[=[No lock of iron is a match for Vraska's will of stone.]=];
CardNumber="XLN96";
MultiverseID=435250;
Rulings={
	{Date="2017-09-29";Text=[=[You can’t sacrifice a Treasure to pay mana towards Costly Plunder’s cost and also to pay its additional cost.]=];};
};
};

{Name="Crafty Cutpurse";
SetCode="RIX";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[Flash<br/>
When Crafty Cutpurse enters the battlefield, each token that would be created under an opponent's control this turn is created under your control instead.]=];
Flavor=[=[Possession is eleven-tenths of the pirate code.]=];
CardNumber="RIX33";
Power="2";
Toughness="2";
MultiverseID=439690;
Rulings={
	{Date="2018-01-19";Text=[=[Crafty Cutpurse’s replacement effect is applied before any other replacement effects that would also modify how the token enters the battlefield. For example, if an opponent controls Anointed Procession, your Crafty Cutpurse’s effect applies before that of Anointed Procession and you won’t get twice as many tokens.]=];};
	{Date="2018-01-19";Text=[=[Crafty Cutpurse won’t retroactively change the control of tokens that have already entered the battlefield.]=];};
	{Date="2018-01-19";Text=[=[If a token would be created tapped and attacking, but the token’s controller isn’t an attacking player, that token is created tapped but not attacking. If a token would be created blocking a creature, but the token’s controller isn’t a defending player, that token is created but isn’t blocking.]=];};
	{Date="2018-01-19";Text=[=[If the effect that creates the token also creates a delayed triggered ability, Crafty Cutpurse doesn’t change who controls that ability. For example, if your opponent activates the ability of Kiki-Jiki, Mirror Breaker, that opponent controls the delayed triggered ability. When the ability triggers, that player can’t sacrifice the token, so it remains on the battlefield.]=];};
	{Date="2018-01-19";Text=[=[On the other hand, if the effect that creates the token grants a triggered ability to the token, the player who controls the token at the time the ability triggers will be the player who controls that ability. For example, if your opponent activates the second ability of Jace, Cunning Castaway, the token has the ability. If the ability triggers, you’ll control it, so you’ll have to sacrifice the token.]=];};
	{Date="2018-01-19";Text=[=[If two or more players each have resolved Crafty Cutpurse’s triggered ability and a token would be created, the token’s would-be controller chooses one of the applicable Crafty Cutpurse effects to apply. Then the new would-be controller of the token repeats this process among the remaining Crafty Cutpurse effects, and so on, until there are no more possible such effects to apply. Each effect can be applied to the token only once this way.]=];};
	{Date="2018-01-19";Text=[=[The above procedure means that if each player in a two-player game has resolved Crafty Cutpurse’s triggered ability and one would create a token, it really will enter the battlefield under that player’s control. The token would enter the battlefield under player A’s control, so player B’s effect affects it. Now that token would enter the battlefield under player B’s control, so player A’s effect affects it. Each replacement effect has now been used, so the token will enter the battlefield under player A’s control.]=];};
};
};

{Name="Crash the Ramparts";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Target creature gets +3/+3 and gains trample until end of turn.]=];
Flavor=[=[The Legion's conquistadors could endure Ixalan's sun. Their forts could withstand a charging ceratops. But nothing can stop a ceratops strengthened by the sun.]=];
CardNumber="XLN182";
MultiverseID=435337;
};

{Name="Crashing Tide";
SetCode="RIX";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Crashing Tide has flash as long as you control a Merfolk.<br/>
Return target creature to its owner's hand.<br/>
Draw a card.]=];
CardNumber="RIX34";
MultiverseID=439691;
Rulings={
	{Date="2018-01-19";Text=[=[Once you announce that you’re casting Crashing Tide, players can’t try to remove your Merfolk to make it lose flash until you’re done casting it. If it loses flash after it’s been cast, it will still resolve if able.]=];};
	{Date="2018-01-19";Text=[=[If the target creature is an illegal target by the time Crashing Tide tries to resolve, the spell is countered. You won’t draw a card.]=];};
};
};

{Name="Crested Herdcaller";
SetCode="RIX";
Manacost="{{3}}{{G}}{{G}}";
cmc=5;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Trample<br/>
When Crested Herdcaller enters the battlefield, create a 3/3 green Dinosaur creature token with trample.]=];
Flavor=[=["Our survival, like theirs, depends on our ability to work together."<br/>
—Huatli, to Tishana]=];
CardNumber="RIX126";
Power="3";
Toughness="3";
MultiverseID=439783;
};

{Name="Crushing Canopy";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Choose one —<br/>
• Destroy target creature with flying.<br/>
• Destroy target enchantment.]=];
Flavor=[=["Do not mistake your lofty vantage point for safety."<br/>
—Shaper Tuvasa]=];
CardNumber="XLN183";
MultiverseID=435338;
};

{Name="Curious Obsession";
SetCode="RIX";
Manacost="{{U}}";
cmc=1;
Colors={"Blue"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Uncommon";
Text=[=[Enchant creature<br/>
Enchanted creature gets +1/+1 and has "Whenever this creature deals combat damage to a player, you may draw a card."<br/>
At the beginning of your end step, if you didn't attack with a creature this turn, sacrifice Curious Obsession.]=];
CardNumber="RIX35";
MultiverseID=439692;
Rulings={
	{Date="2018-01-19";Text=[=[Curious Obsession’s last ability is satisfied if any creature has attacked, similar to raid abilities. The creature it enchants doesn’t have to have attacked.]=];};
};
};

{Name="Daring Buccaneer";
SetCode="RIX";
Manacost="{{R}}";
cmc=1;
Colors={"Red"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[As an additional cost to cast Daring Buccaneer, reveal a Pirate card from your hand or pay {{2}}.]=];
Flavor=[=[No ancient lore ties the pirates of the Brazen Coalition to the Immortal Sun. But it's a powerful ancient artifact in a city of gold—what's not to covet?]=];
CardNumber="RIX98";
Power="2";
Toughness="2";
MultiverseID=439755;
Rulings={
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Daring Saboteur";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[{{2}}{{U}}: Daring Saboteur can't be blocked this turn.<br/>
Whenever Daring Saboteur deals combat damage to a player, you may draw a card. If you do, discard a card.]=];
Flavor=[=["They'll never see me coming."]=];
CardNumber="XLN49";
Power="2";
Toughness="1";
MultiverseID=435201;
Rulings={
	{Date="2017-09-29";Text=[=[Activating the first ability of Daring Saboteur after it has become blocked won’t cause it to become unblocked.]=];};
};
};

{Name="Dark Inquiry";
SetCode="RIX";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Target opponent reveals his or her hand. You choose a nonland card from it. That player discards that card.]=];
Flavor=[=["Your mind is no longer yours to waste."]=];
CardNumber="RIX65";
MultiverseID=439722;
};

{Name="Dark Nourishment";
SetCode="XLN";
Manacost="{{4}}{{B}}";
cmc=5;
Colors={"Black"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Dark Nourishment deals 3 damage to target creature or player. You gain 3 life.]=];
Flavor=[=[Demons lurk in the shadows of ancient ruins, spreading plague and corruption across the land.]=];
CardNumber="XLN97";
MultiverseID=435251;
Rulings={
	{Date="2017-09-29";Text=[=[If the target creature or player is an illegal target by the time Dark Nourishment resolves, the entire spell is countered. You won’t gain life.]=];};
};
};

{Name="Dead Man's Chest";
SetCode="RIX";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Rare";
Text=[=[Enchant creature an opponent controls<br/>
When enchanted creature dies, exile cards equal to its power from the top of its owner's library. You may cast nonland cards from among them for as long as they remain exiled, and you may spend mana as though it were mana of any type to cast those spells.]=];
CardNumber="RIX66";
MultiverseID=439723;
Rulings={
	{Date="2018-01-19";Text=[=[If you gain control of the enchanted creature, Dead Man’s Chest will be put into your graveyard.]=];};
	{Date="2018-01-19";Text=[=[If Dead Man’s Chest and the enchanted creature are both put into graveyards at the same time, the last ability of Dead Man’s Chest still triggers.]=];};
	{Date="2018-01-19";Text=[=[To determine how many cards to exile, use the enchanted creature’s power as it last existed on the battlefield.]=];};
	{Date="2018-01-19";Text=[=[You are a creature’s owner if the card representing it began the game in your deck, or if it’s a token that entered the battlefield under your control. If Dead Man’s Chest enchants a creature that you own but an opponent controls, you’ll exile cards from your library.]=];};
	{Date="2018-01-19";Text=[=[The effect of Dead Man’s Chest doesn’t change when you can cast the exiled cards. For example, if you exile a creature card without flash, you can cast it only during your main phase when the stack is empty.]=];};
	{Date="2018-01-19";Text=[=[Casting an exiled card causes it to leave exile. You can’t cast it multiple times.]=];};
	{Date="2018-01-19";Text=[=[In a multiplayer game, if a player leaves the game, all cards that player owns leave as well. If you leave the game, any spells or permanents you control from Dead Man’s Chest’s ability are exiled.]=];};
};
};

{Name="Deadeye Brawler";
SetCode="RIX";
Manacost="{{2}}{{U}}{{B}}";
cmc=4;
Colors={"Blue";"Black";};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[Deathtouch<br/>
Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Whenever Deadeye Brawler deals combat damage to a player, if you have the city's blessing, draw a card.]=];
CardNumber="RIX155";
Power="2";
Toughness="4";
MultiverseID=439812;
Rulings={
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards have triggered abilities with an intervening “if” clause that checks whether you have the city’s blessing. These are worded “[Trigger condition], if you have the city’s blessing, [effect].” You must already have the city’s blessing in order for these abilities to trigger; otherwise they do nothing. In other words, there’s no way to have the ability trigger if you don’t have the city’s blessing, even if you intend to get it in response to the triggered ability.]=];};
};
};

{Name="Deadeye Plunderers";
SetCode="XLN";
Manacost="{{3}}{{U}}{{B}}";
cmc=5;
Colors={"Blue";"Black";};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[Deadeye Plunderers gets +1/+1 for each artifact you control.<br/>
{{2}}{{U}}{{B}}: Create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=["Keep your friends close and your enemies within range."]=];
CardNumber="XLN220";
Power="3";
Toughness="3";
MultiverseID=435376;
Rulings={
	{Date="2017-09-29";Text=[=[Because damage remains marked on a creature until it’s removed as the turn ends, the damage Deadeye Plunderers takes during combat may become lethal if artifacts you control leave the battlefield later in the turn.]=];};
};
};

{Name="Deadeye Quartermaster";
SetCode="XLN";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[When Deadeye Quartermaster enters the battlefield, you may search your library for an Equipment or Vehicle card, reveal it, put it into your hand, then shuffle your library.]=];
Flavor=[=["Welcome aboard, mate! You're going to need this."]=];
CardNumber="XLN50";
Power="2";
Toughness="2";
MultiverseID=435202;
};

{Name="Deadeye Rig-Hauler";
SetCode="RIX";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[Raid — When Deadeye Rig-Hauler enters the battlefield, if you attacked with a creature this turn, you may return target creature to its owner's hand.]=];
Flavor=[=["Up you go, you soggy rat."]=];
CardNumber="RIX36";
Power="3";
Toughness="2";
MultiverseID=439693;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Deadeye Tormentor";
SetCode="XLN";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[Raid — When Deadeye Tormentor enters the battlefield, if you attacked with a creature this turn, target opponent discards a card.]=];
Flavor=[=[Despite their noble heritage, the pirates of the Deadeye Fleet are known for underhanded tactics and despicable trickery.]=];
CardNumber="XLN98";
Power="2";
Toughness="2";
MultiverseID=435252;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Deadeye Tracker";
SetCode="XLN";
Manacost="{{B}}";
cmc=1;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[{{1}}{{B}}, {{Tap}}: Exile two target cards from an opponent's graveyard. Deadeye Tracker explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
CardNumber="XLN99";
Power="1";
Toughness="1";
MultiverseID=435253;
Rulings={
	{Date="2017-09-29";Text=[=[You can’t activate Deadeye Tracker’s ability without targeting two cards in a single opponent’s graveyard.]=];};
	{Date="2017-09-29";Text=[=[If one target card is an illegal target by the time Deadeye Tracker’s ability resolves, the remaining legal target is exiled and Deadeye Tracker explores.]=];};
	{Date="2017-09-29";Text=[=[If each target card is an illegal target by the time Deadeye Tracker’s ability resolves, the entire ability is countered. Deadeye Tracker won’t explore.]=];};
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Deathgorge Scavenger";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Rare";
Text=[=[Whenever Deathgorge Scavenger enters the battlefield or attacks, you may exile target card from a graveyard. If a creature card is exiled this way, you gain 2 life. If a noncreature card is exiled this way, Deathgorge Scavenger gets +1/+1 until end of turn.]=];
CardNumber="XLN184";
Power="3";
Toughness="2";
MultiverseID=435339;
Rulings={
	{Date="2017-09-29";Text=[=[There’s no way to get both bonuses at once while Deathgorge Scavenger’s ability is resolving. If an artifact creature card is exiled this way, it’s a creature card and not a noncreature card.]=];};
};
};

{Name="Deathless Ancient";
SetCode="XLN";
Manacost="{{4}}{{B}}{{B}}";
cmc=6;
Colors={"Black"};
Type="Creature — Vampire Knight";
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Uncommon";
Text=[=[Flying<br/>
Tap three untapped Vampires you control: Return Deathless Ancient from your graveyard to your hand.]=];
Flavor=[=["Ancient one, we have reached the promised shore. The Immortal Sun is near. Drink and awake."]=];
CardNumber="XLN100";
Power="4";
Toughness="4";
MultiverseID=435254;
Rulings={
	{Date="2017-09-29";Text=[=[Deathless Ancient’s last ability can be activated only while it’s in your graveyard.]=];};
	{Date="2017-09-29";Text=[=[Once you announce that you’re activating Deathless Ancient’s last ability, no player may take other actions until the ability’s been paid for. Notably, players can’t try to stop the ability by tapping or removing Vampires you control.]=];};
	{Date="2017-09-29";Text=[=[To activate the last ability, you may tap any untapped Vampires you control, including ones you haven’t controlled continuously since the beginning of your most recent turn. (Note that tapping the creature doesn’t use {Tap} [the tap symbol].)]=];};
};
};

{Name="Deeproot Champion";
SetCode="XLN";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Creature — Merfolk Shaman";
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Rare";
Text=[=[Whenever you cast a noncreature spell, put a +1/+1 counter on Deeproot Champion.]=];
Flavor=[=["No good will come from what you seek. Turn back now or suffer an ignoble death far from your home."]=];
CardNumber="XLN185";
Power="1";
Toughness="1";
MultiverseID=435340;
Rulings={
	{Date="2017-09-29";Text=[=[Deeproot Champion’s ability resolves before the spell that caused it to trigger.]=];};
};
};

{Name="Deeproot Elite";
SetCode="RIX";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Rare";
Text=[=[Whenever another Merfolk enters the battlefield under your control, put a +1/+1 counter on target Merfolk you control.]=];
Flavor=[=["You think I stand alone? I have the forest at my call, the waters at my back. I outnumber you."]=];
CardNumber="RIX127";
Power="1";
Toughness="1";
MultiverseID=439784;
Rulings={
	{Date="2018-01-19";Text=[=[Deeproot Elite’s ability can target the Merfolk that caused it to trigger. It can also target Deeproot Elite itself.]=];};
};
};

{Name="Deeproot Warrior";
SetCode="XLN";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Common";
Text=[=[Whenever Deeproot Warrior becomes blocked, it gets +1/+1 until end of turn.]=];
Flavor=[=["We breathe from our soul and bones to give strength to the jungle. The jungle breathes from its roots and rivers to give strength to us."<br/>
—Shaper Falani]=];
CardNumber="XLN186";
Power="2";
Toughness="2";
MultiverseID=435341;
Rulings={
	{Date="2017-09-29";Text=[=[Deeproot Warrior’s ability triggers only once if multiple creatures block it.]=];};
};
};

{Name="Deeproot Waters";
SetCode="XLN";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Uncommon";
Text=[=[Whenever you cast a Merfolk spell, create a 1/1 blue Merfolk creature token with hexproof. (A creature with hexproof can't be the target of spells or abilities your opponents control.)]=];
Flavor=[=[A visit to the Deeproot Tree and its ancient spring replenishes a merfolk's connection to nature.]=];
CardNumber="XLN51";
MultiverseID=435203;
Rulings={
	{Date="2017-09-29";Text=[=[The ability of Deeproot Waters resolves before the spell that caused it to trigger.]=];};
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Demolish";
SetCode="XLN";
Manacost="{{3}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Destroy target artifact or land.]=];
Flavor=[=[What took months for human hands to carve took just seconds for the dinosaur's tail to ruin.]=];
CardNumber="XLN139";
MultiverseID=435293;
};

{Name="Demystify";
SetCode="XLN";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Destroy target enchantment.]=];
Flavor=[=["The River Heralds carve spells into jade, hoping to steer us from our course. But what right do they have to keep us from that which once was ours?"]=];
CardNumber="XLN8";
MultiverseID=435159;
};

{Name="Depths of Desire";
SetCode="XLN";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Return target creature to its owner's hand. Create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=[Pockets full of gold, lungs full of brine.]=];
CardNumber="XLN52";
MultiverseID=435204;
};

{Name="Desperate Castaways";
SetCode="XLN";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[Desperate Castaways can't attack unless you control an artifact.]=];
Flavor=[=[A pirate crew without a ship is a crew that will do anything to get one.]=];
CardNumber="XLN101";
Power="2";
Toughness="3";
MultiverseID=435255;
Rulings={
	{Date="2017-09-29";Text=[=[Once Desperate Castaways has attacked, it will remain in combat even if you no longer control an artifact.]=];};
};
};

{Name="Dinosaur Hunter";
SetCode="RIX";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[Whenever Dinosaur Hunter deals damage to a Dinosaur, destroy that creature.]=];
Flavor=[=["Aye, the foul beast chomped me, but I got away. You'd best believe when I find it again, it won't get away so easy."]=];
CardNumber="RIX67";
Power="2";
Toughness="2";
MultiverseID=439724;
Rulings={
	{Date="2018-01-19";Text=[=[If an opponent’s Dinosaur has an enrage ability and your Dinosaur Hunter deals damage to it during your turn, that ability resolves before Dinosaur Hunter’s ability destroys the Dinosaur. If it’s that opponent’s turn, the Dinosaur is destroyed first, but its enrage ability still resolves afterwards.]=];};
};
};

{Name="Dinosaur Stampede";
SetCode="XLN";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Attacking creatures get +2/+0 until end of turn. Dinosaurs you control gain trample until end of turn.]=];
Flavor=[=[If you're in the way of a ceratops charge and you're made of mere flesh and bone, then you're not really in the way.]=];
CardNumber="XLN140";
MultiverseID=435294;
Rulings={
	{Date="2017-09-29";Text=[=[In a Two-Headed Giant game, attacking creatures your teammate controls get +2/+0, but only Dinosaurs you control gain trample.]=];};
};
};

{Name="Dire Fleet Captain";
SetCode="XLN";
Manacost="{{B}}{{R}}";
cmc=2;
Colors={"Black";"Red";};
Type="Creature — Orc Pirate";
Types={"Creature"};
SubTypes={"Orc";"Pirate";};
Rarity="Uncommon";
Text=[=[Whenever Dire Fleet Captain attacks, it gets +1/+1 until end of turn for each other attacking Pirate.]=];
Flavor=[=[Orcs are happiest under captains who steer toward battle. Orcs of the Dire Fleet are downright jovial.]=];
CardNumber="XLN221";
Power="2";
Toughness="2";
MultiverseID=435377;
Rulings={
	{Date="2017-09-29";Text=[=[Count the number of other attacking Pirates as the ability resolves to determine the size of the bonus.]=];};
	{Date="2017-09-29";Text=[=[Once the ability resolves, the bonus won’t change later in the turn, even if the number of other attacking Pirates does.]=];};
	{Date="2017-09-29";Text=[=[In a Two-Headed Giant game, attacking Pirates controlled by your teammate will count for Dire Fleet Captain’s ability.]=];};
};
};

{Name="Dire Fleet Daredevil";
SetCode="RIX";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[First strike<br/>
When Dire Fleet Daredevil enters the battlefield, exile target instant or sorcery card from an opponent's graveyard. You may cast that card this turn, and you may spend mana as though it were mana of any type to cast that spell. If that card would be put into a graveyard this turn, exile it instead.]=];
CardNumber="RIX99";
Power="2";
Toughness="1";
MultiverseID=439756;
Rulings={
	{Date="2018-01-19";Text=[=[The effect of Dire Fleet Daredevil doesn’t change when you can cast the exiled card. For example, if you exile a sorcery card, you can cast it only during your main phase when the stack is empty.]=];};
	{Date="2018-01-19";Text=[=[Casting an exiled card causes it to leave exile. You can’t cast it multiple times.]=];};
};
};

{Name="Dire Fleet Hoarder";
SetCode="XLN";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[When Dire Fleet Hoarder dies, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=[Among the pirates of the Brazen Coalition, the only thing more dangerous than failure is success.]=];
CardNumber="XLN102";
Power="2";
Toughness="1";
MultiverseID=435256;
};

{Name="Dire Fleet Interloper";
SetCode="XLN";
Manacost="{{3}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[Menace<br/>
When Dire Fleet Interloper enters the battlefield, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
CardNumber="XLN103";
Power="2";
Toughness="2";
MultiverseID=435257;
Rulings={
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Dire Fleet Neckbreaker";
SetCode="RIX";
Manacost="{{2}}{{B}}{{R}}";
cmc=4;
Colors={"Black";"Red";};
Type="Creature — Orc Pirate";
Types={"Creature"};
SubTypes={"Orc";"Pirate";};
Rarity="Uncommon";
Text=[=[Attacking Pirates you control get +2/+0.]=];
Flavor=[=[The buccaneers scaled the sides of buildings as easily as they boarded enemy ships.]=];
CardNumber="RIX156";
Power="3";
Toughness="2";
MultiverseID=439813;
};

{Name="Dire Fleet Poisoner";
SetCode="RIX";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[Flash<br/>
Deathtouch<br/>
When Dire Fleet Poisoner enters the battlefield, target attacking Pirate you control gets +1/+1 and gains deathtouch until end of turn.]=];
CardNumber="RIX68";
Power="2";
Toughness="2";
MultiverseID=439725;
};

{Name="Dire Fleet Ravager";
SetCode="XLN";
Manacost="{{3}}{{B}}{{B}}";
cmc=5;
Colors={"Black"};
Type="Creature — Orc Pirate Wizard";
Types={"Creature"};
SubTypes={"Orc";"Pirate";"Wizard";};
Rarity="Mythic Rare";
Text=[=[Menace, deathtouch<br/>
When Dire Fleet Ravager enters the battlefield, each player loses a third of his or her life, rounded up.]=];
Flavor=[=[His fists fume with the decay of death, each strike a plague on the hearts of his enemies.]=];
CardNumber="XLN104";
Power="4";
Toughness="4";
MultiverseID=435258;
Rulings={
	{Date="2017-09-29";Text=[=[For example, if you have 13 life, you’ll lose 5 life.]=];};
	{Date="2017-09-29";Text=[=[If a player has 1 life, that player loses 1 life. If each player has 0 life after that, the game’s a draw.]=];};
	{Date="2017-09-29";Text=[=[In a Two-Headed Giant game, each player loses a third of the team’s life total rounded up. For example, if a team has 13 life, each player on that team loses 5 life and the team loses 10 life total.]=];};
};
};

{Name="Dive Down";
SetCode="XLN";
Manacost="{{U}}";
cmc=1;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Target creature you control gets +0/+3 and gains hexproof until end of turn. (It can't be the target of spells or abilities your opponents control.)]=];
Flavor=[=["Seeing the river is not the same as seeing the fish."]=];
CardNumber="XLN53";
MultiverseID=435205;
};

{Name="Divine Verdict";
SetCode="RIX";
Manacost="{{3}}{{W}}";
cmc=4;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Destroy target attacking or blocking creature.]=];
Flavor=[=[Cunning warriors and dim-witted beasts alike fall under the church's harsh judgment.]=];
CardNumber="RIX5";
MultiverseID=439662;
Rulings={
	{Date="2009-10-01";Text=[=[An “attacking creature” is one that has been declared as an attacker this combat, or one that was put onto the battlefield attacking this combat. Unless that creature leaves combat, it continues to be an attacking creature through the end of combat step, even if the player it was attacking has left the game, or the planeswalker it was attacking has left combat.]=];};
	{Date="2009-10-01";Text=[=[A “blocking creature” is one that has been declared as a blocker this combat, or one that was put onto the battlefield blocking this combat. Unless that creature leaves combat, it continues to be a blocking creature through the end of combat step, even if the creature or creatures it was blocking are no longer on the battlefield or have otherwise left combat.]=];};
	{Date="2012-07-01";Text=[=[Destroying a blocking creature won’t cause any of the creatures it was blocking to become unblocked. They won’t deal combat damage to the defending player or planeswalker (unless they have trample).]=];};
};
};

{Name="Dowsing Dagger";
SetCode="XLN";
Manacost="{{2}}";
cmc=2;
Type="Artifact — Equipment";
Types={"Artifact"};
SubTypes={"Equipment"};
Rarity="Rare";
Text=[=[When Dowsing Dagger enters the battlefield, target opponent creates two 0/2 green Plant creature tokens with defender.<br/>
Equipped creature gets +2/+1.<br/>
Whenever equipped creature deals combat damage to a player, you may transform Dowsing Dagger.<br/>
Equip {{2}}]=];
CardNumber="XLN235a";
MultiverseID=435392;
Rulings={
	{Date="2017-09-29";Text=[=[Attacking with an equipped creature doesn’t cause Equipment attached to it to become tapped. Dowsing Dagger will normally be untapped when it transforms into Lost Vale.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Dragonskull Summit";
SetCode="XLN";
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[Dragonskull Summit enters the battlefield tapped unless you control a Swamp or a Mountain.<br/>
{{Tap}}: Add {{B}} or {{R}} to your mana pool.]=];
Flavor=[=[When the Planeswalker Angrath called dinosaurs "dragons," the name stuck in certain pirate circles.]=];
CardNumber="XLN252";
MultiverseID=435413;
Rulings={
	{Date="2009-10-01";Text=[=[This checks for lands you control with the land type Swamp or Mountain, not for lands named Swamp or Mountain. The lands it checks for don’t have to be basic lands. For example, if you control Stomping Ground (a nonbasic land with the land types Mountain and Forest), Dragonskull Summit will enter the battlefield untapped.]=];};
	{Date="2009-10-01";Text=[=[As this is entering the battlefield, it checks for lands that are already on the battlefield. It won’t see lands that are entering the battlefield at the same time (due to Warp World, for example).]=];};
};
};

{Name="Dreamcaller Siren";
SetCode="XLN";
Manacost="{{2}}{{U}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Siren Pirate";
Types={"Creature"};
SubTypes={"Siren";"Pirate";};
Rarity="Rare";
Text=[=[Flash<br/>
Flying<br/>
Dreamcaller Siren can block only creatures with flying.<br/>
When Dreamcaller Siren enters the battlefield, if you control another Pirate, tap up to two target nonland permanents.]=];
CardNumber="XLN54";
Power="3";
Toughness="3";
MultiverseID=435206;
Rulings={
	{Date="2017-09-29";Text=[=[Dreamcaller Siren’s last ability won’t trigger if you don’t control another Pirate as it enters the battlefield. If you lose control of each other Pirate before that ability resolves, it won’t do anything.]=];};
};
};

{Name="Drover of the Mighty";
SetCode="XLN";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Creature — Human Druid";
Types={"Creature"};
SubTypes={"Human";"Druid";};
Rarity="Uncommon";
Text=[=[Drover of the Mighty gets +2/+2 as long as you control a Dinosaur.<br/>
{{Tap}}: Add one mana of any color to your mana pool.]=];
Flavor=[=["I do not lead. They do not follow. We walk together."]=];
CardNumber="XLN187";
Power="1";
Toughness="1";
MultiverseID=435342;
Rulings={
	{Date="2017-09-29";Text=[=[Because damage remains marked on a creature until it’s removed as the turn ends, the damage Drover of the Mighty takes during combat may become lethal if you no longer control a Dinosaur later in the turn.]=];};
};
};

{Name="Drowned Catacomb";
SetCode="XLN";
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[Drowned Catacomb enters the battlefield tapped unless you control an Island or a Swamp.<br/>
{{Tap}}: Add {{U}} or {{B}} to your mana pool.]=];
Flavor=[=[None can tell how many vessels are tangled up on the sea floor—or how much treasure remains unclaimed.]=];
CardNumber="XLN253";
MultiverseID=435414;
Rulings={
	{Date="2009-10-01";Text=[=[This checks for lands you control with the land type Island or Swamp, not for lands named Island or Swamp. The lands it checks for don’t have to be basic lands. For example, if you control Blood Crypt (a nonbasic land with the land types Swamp and Mountain), Drowned Catacomb will enter the battlefield untapped.]=];};
	{Date="2009-10-01";Text=[=[As this is entering the battlefield, it checks for lands that are already on the battlefield. It won’t see lands that are entering the battlefield at the same time (due to Warp World, for example).]=];};
};
};

{Name="Dual Shot";
SetCode="XLN";
Manacost="{{R}}";
cmc=1;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Dual Shot deals 1 damage to each of up to two target creatures.]=];
Flavor=[=["Through me the rage of Tilonalli burns twice as bright."]=];
CardNumber="XLN141";
MultiverseID=435295;
Rulings={
	{Date="2017-09-29";Text=[=[You can’t target the same creature twice to have Dual Shot deal 2 damage to it.]=];};
};
};

{Name="Duress";
SetCode="XLN";
Manacost="{{B}}";
cmc=1;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Target opponent reveals his or her hand. You choose a noncreature, nonland card from it. That player discards that card.]=];
Flavor=[=[Solitude and starvation are brutal punishments, but even worse is all that time to think.]=];
CardNumber="XLN105";
MultiverseID=435259;
};

{Name="Dusk Charger";
SetCode="RIX";
Manacost="{{3}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Creature — Horse";
Types={"Creature"};
SubTypes={"Horse"};
Rarity="Common";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Dusk Charger gets +2/+2 as long as you have the city's blessing.]=];
Flavor=[=[Stories say demon blood runs in its veins, making it fearless and bloodthirsty.]=];
CardNumber="RIX69";
Power="3";
Toughness="3";
MultiverseID=439726;
Rulings={
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards get power, toughness, and/or abilities once you have the city’s blessing. If another card has an ability that triggers when creatures with certain characteristics enter the battlefield (such as Mentor of the Meek or Elemental Bond do), use the entering permanent’s characteristics after you have the city’s blessing to determine whether those abilities trigger. This is true even if the entering permanent is your tenth permanent.]=];};
};
};

{Name="Dusk Legion Dreadnought";
SetCode="XLN";
Manacost="{{5}}";
cmc=5;
Type="Artifact — Vehicle";
Types={"Artifact"};
SubTypes={"Vehicle"};
Rarity="Uncommon";
Text=[=[Vigilance<br/>
Crew 2 (Tap any number of creatures you control with total power 2 or more: This Vehicle becomes an artifact creature until end of turn.)]=];
Flavor=[=[It loomed up over the horizon, silent and dark as a grave.]=];
CardNumber="XLN236";
Power="4";
Toughness="6";
MultiverseID=435394;
Rulings={
	{Date="2017-09-29";Text=[=[Each Vehicle is printed with a power and toughness, but it’s not a creature. If it becomes a creature (most likely through its crew ability), it will have that power and toughness.]=];};
	{Date="2017-09-29";Text=[=[If an effect causes a Vehicle to become an artifact creature with a specified power and toughness, that effect overwrites the Vehicle’s printed power and toughness.]=];};
	{Date="2017-09-29";Text=[=[Vehicle is an artifact type, not a creature type. A Vehicle that’s crewed won’t normally have any creature type.]=];};
	{Date="2017-09-29";Text=[=[Once a player announces that he or she is activating a crew ability, no player may take other actions until the ability has been paid for. Notably, players can’t try to stop the ability by changing a creature’s power or by removing or tapping a creature.]=];};
	{Date="2017-09-29";Text=[=[Any untapped creature you control can be tapped to pay a crew cost, even one that just came under your control.]=];};
	{Date="2017-09-29";Text=[=[You may tap more creatures than necessary to activate a crew ability.]=];};
	{Date="2017-09-29";Text=[=[Creatures that crew a Vehicle aren’t attached to it or related in any other way. Effects that affect the Vehicle, such as by destroying it or giving it a +1/+1 counter, don’t affect the creatures that crewed it.]=];};
	{Date="2017-09-29";Text=[=[Once a Vehicle becomes a creature, it behaves exactly like any other artifact creature. It can’t attack unless you’ve controlled it continuously since your turn began, it can block if it’s untapped, it can be tapped to pay a Vehicle’s crew cost, and so on.]=];};
	{Date="2017-09-29";Text=[=[You may activate a crew ability of a Vehicle even if it’s already an artifact creature. Doing so has no effect on the Vehicle. It doesn’t change its power and toughness.]=];};
	{Date="2017-09-29";Text=[=[For a Vehicle to be able to attack, it must be a creature as the declare attackers step begins, so the latest you can activate its crew ability to attack with it is during the beginning of combat step. For a Vehicle to be able to block, it must be a creature as the declare blockers step begins, so the latest you can activate its crew ability to block with it is during the declare attackers step. In either case, players may take actions after the crew ability resolves but before the Vehicle has been declared as an attacking or blocking creature.]=];};
	{Date="2017-09-29";Text=[=[When a Vehicle becomes a creature, that doesn’t count as having a creature enter the battlefield. The permanent was already on the battlefield; it only changed its types. Abilities that trigger whenever a creature enters the battlefield won’t trigger.]=];};
	{Date="2017-09-29";Text=[=[If a permanent becomes a copy of a Vehicle, the copy won’t be a creature, even if the Vehicle it’s copying has become an artifact creature.]=];};
};
};

{Name="Dusk Legion Zealot";
SetCode="RIX";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Common";
Text=[=[When Dusk Legion Zealot enters the battlefield, you draw a card and you lose 1 life.]=];
Flavor=[=[Once they reached Orazca, the Legion's explorers ransacked tombs and temples, hunting for the Immortal Sun.]=];
CardNumber="RIX70";
Power="1";
Toughness="1";
MultiverseID=439727;
};

{Name="Duskborne Skymarcher";
SetCode="XLN";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Creature — Vampire Cleric";
Types={"Creature"};
SubTypes={"Vampire";"Cleric";};
Rarity="Uncommon";
Text=[=[Flying<br/>
{{W}}, {{Tap}}: Target attacking Vampire gets +1/+1 until end of turn.]=];
Flavor=[=["The hour of Dusk is come."]=];
CardNumber="XLN9";
Power="1";
Toughness="1";
MultiverseID=435160;
};

{Name="Elaborate Firecannon";
SetCode="XLN";
Manacost="{{2}}";
cmc=2;
Type="Artifact";
Types={"Artifact"};
Rarity="Uncommon";
Text=[=[Elaborate Firecannon doesn't untap during your untap step.<br/>
{{4}}, {{Tap}}: Elaborate Firecannon deals 2 damage to target creature or player.<br/>
At the beginning of your upkeep, you may discard a card. If you do, untap Elaborate Firecannon.]=];
CardNumber="XLN237";
MultiverseID=435395;
};

{Name="Elenda, the Dusk Rose";
SetCode="RIX";
Manacost="{{2}}{{W}}{{B}}";
cmc=4;
Colors={"White";"Black";};
Type="Legendary Creature — Vampire Knight";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Mythic Rare";
Text=[=[Lifelink<br/>
Whenever another creature dies, put a +1/+1 counter on Elenda, the Dusk Rose.<br/>
When Elenda dies, create X 1/1 white Vampire creature tokens with lifelink, where X is Elenda's power.]=];
Flavor=[=[Her centuries-long search is ended.]=];
CardNumber="RIX157";
Power="1";
Toughness="1";
MultiverseID=439814;
Rulings={
	{Date="2018-01-19";Text=[=[If Elenda dies at the same time as another creature, both of its triggered abilities trigger. However, the first one won’t do anything since you can’t put a +1/+1 counter on Elenda.]=];};
	{Date="2018-01-19";Text=[=[To determine how many Vampire tokens are created, use Elenda’s power as it last existed on the battlefield.]=];};
	{Date="2018-01-19";Text=[=[If Elenda would die and it’s your commander in the Commander variant, you may put it into the command zone instead. However, if you save Elenda this way, it doesn’t die and you won’t create any Vampire tokens.]=];};
};
};

{Name="Emergent Growth";
SetCode="XLN";
Manacost="{{3}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Target creature gets +5/+5 until end of turn and must be blocked this turn if able.]=];
Flavor=[=["By accepting my smallness I am vast."]=];
CardNumber="XLN188";
MultiverseID=435343;
Rulings={
	{Date="2017-09-29";Text=[=[If the target creature attacks, the defending player must assign at least one blocker to it during the declare blockers step if that player controls any creatures that could block it. Other creatures may also block it, block other creatures, or not block at all.]=];};
};
};

{Name="Emissary of Sunrise";
SetCode="XLN";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Creature — Human Cleric";
Types={"Creature"};
SubTypes={"Human";"Cleric";};
Rarity="Uncommon";
Text=[=[First strike<br/>
When Emissary of Sunrise enters the battlefield, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
CardNumber="XLN10";
Power="2";
Toughness="1";
MultiverseID=435161;
Rulings={
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Emperor's Vanguard";
SetCode="XLN";
Manacost="{{3}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Creature — Human Scout";
Types={"Creature"};
SubTypes={"Human";"Scout";};
Rarity="Rare";
Text=[=[Whenever Emperor's Vanguard deals combat damage to a player, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
CardNumber="XLN189";
Power="4";
Toughness="3";
MultiverseID=435344;
Rulings={
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Encampment Keeper";
SetCode="XLN";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Creature — Hound";
Types={"Creature"};
SubTypes={"Hound"};
Rarity="Common";
Text=[=[First strike<br/>
{{7}}{{W}}, {{Tap}}, Sacrifice Encampment Keeper: Creatures you control get +2/+2 until end of turn.]=];
Flavor=[=[Paladins of the Sanctum Seeker order are an adventurous lot, venturing into the wilds with monstrous mastiffs at their side.]=];
CardNumber="XLN11";
Power="1";
Toughness="1";
MultiverseID=435162;
};

{Name="Enter the Unknown";
SetCode="RIX";
Manacost="{{G}}";
cmc=1;
Colors={"Green"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Target creature you control explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on the creature, then put the card back or put it into your graveyard.)<br/>
You may play an additional land this turn.]=];
CardNumber="RIX128";
MultiverseID=439785;
Rulings={
	{Date="2018-01-19";Text=[=[Enter the Unknown’s effect allows you to play an additional land during your main phase. Doing so follows the normal timing rules for playing lands.]=];};
	{Date="2018-01-19";Text=[=[The effects of multiples of Enter the Unknown in the same turn are cumulative. They’re also cumulative with other effects that let you play additional lands, such as the one from Wayward Swordtooth.]=];};
	{Date="2018-01-19";Text=[=[If you somehow manage to cast Enter the Unknown when it’s not your turn, the target creature explores when it resolves, but you won’t be able to play a land that turn.]=];};
	{Date="2018-01-19";Text=[=[If the target creature is an illegal target by the time Enter the Unknown tries to resolve, the spell is countered. It won’t explore, and you won’t be able to play an additional land.]=];};
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
};
};

{Name="Entrancing Melody";
SetCode="XLN";
Manacost="{{X}}{{U}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Rare";
Text=[=[Gain control of target creature with converted mana cost X.]=];
Flavor=[=[The stronger the will, the more bewitching the song.]=];
CardNumber="XLN55";
MultiverseID=435207;
Rulings={
	{Date="2017-09-29";Text=[=[If a permanent has {X} in its mana cost, X is considered to be 0.]=];};
	{Date="2017-09-29";Text=[=[The control-change effect of Entrancing Melody lasts indefinitely. It doesn’t wear off during the cleanup step.]=];};
	{Date="2017-09-29";Text=[=[In a multiplayer game, if a player leaves the game, all cards that player owns leave as well, and any effects that give the player control of permanents immediately end.]=];};
};
};

{Name="Etali, Primal Storm";
SetCode="RIX";
Manacost="{{4}}{{R}}{{R}}";
cmc=6;
Colors={"Red"};
Type="Legendary Creature — Elder Dinosaur";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Elder";"Dinosaur";};
Rarity="Rare";
Text=[=[Whenever Etali, Primal Storm attacks, exile the top card of each player's library, then you may cast any number of nonland cards exiled this way without paying their mana costs.]=];
Flavor=[=[The storm rages and the earth breaks.]=];
CardNumber="RIX100";
Power="6";
Toughness="6";
MultiverseID=439757;
Rulings={
	{Date="2018-01-19";Text=[=[If an exiled card has {X} in its mana cost, you must choose 0 as the value of X when casting it without paying its mana cost.]=];};
	{Date="2018-01-19";Text=[=[If you cast any of the exiled cards, you do so as part of the resolution of the triggered ability. You can’t wait to cast them later in the turn. Timing permissions based on a card’s type are ignored, and the spells resolve before blockers are declared.]=];};
	{Date="2018-01-19";Text=[=[If you cast more than one of the exiled cards, you choose the order in which to cast them. A spell you cast this way can be the target of a later spell you cast this way. However, permanent spells cast this way won’t resolve until you’re done casting spells, so the permanents they become can’t be the target of spells cast this way. For example, if you exile Twincast and Lightning Strike, you can cast Lightning Strike and then cast Twincast targeting it; but if you exile a creature card and an Aura card, you can’t cast that Aura targeting that creature.]=];};
	{Date="2018-01-19";Text=[=[If you cast a card “without paying its mana cost,” you can’t pay any alternative costs. You can, however, pay additional costs. If the card has any mandatory additional costs, such as that of Silvergill Adept, those must be paid to cast the card.]=];};
	{Date="2018-01-19";Text=[=[Any cards not cast, including land cards, remain in exile. They can’t be cast on later turns, even if Etali attacks again.]=];};
	{Date="2018-01-19";Text=[=[Because all attacking creatures are chosen at once, a creature cast this way can’t attack during the same combat as Etali, even if it has haste.]=];};
	{Date="2018-01-19";Text=[=[In a multiplayer game, if a player leaves the game, all cards that player owns leave as well. If you leave the game, any spells or permanents you control from Etali’s ability are exiled.]=];};
};
};

{Name="Everdawn Champion";
SetCode="RIX";
Manacost="{{1}}{{W}}{{W}}";
cmc=3;
Colors={"White"};
Type="Creature — Human Soldier";
Types={"Creature"};
SubTypes={"Human";"Soldier";};
Rarity="Uncommon";
Text=[=[Prevent all combat damage that would be dealt to Everdawn Champion.]=];
Flavor=[=["Undefeated in battle, she is the shining future our empire deserves."<br/>
—Huatli]=];
CardNumber="RIX6";
Power="2";
Toughness="2";
MultiverseID=439663;
Rulings={
	{Date="2018-01-19";Text=[=[Combat damage can be assigned to Everdawn Champion as normal, even though that damage will be prevented. For example, if Everdawn Champion blocks a 4/4 creature with trample, the attacking player may assign 2 of that creature’s combat damage to the player or planeswalker it’s attacking.]=];};
};
};

{Name="Evolving Wilds";
SetCode="RIX";
Type="Land";
Types={"Land"};
Rarity="Common";
Text=[=[{{Tap}}, Sacrifice Evolving Wilds: Search your library for a basic land card, put it onto the battlefield tapped, then shuffle your library.]=];
Flavor=[=[The Sun Empire bends nature—rivers, mountainsides, dinosaurs—to its unyielding will.]=];
CardNumber="RIX186";
MultiverseID=439850;
};

{Name="Expel from Orazca";
SetCode="RIX";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Return target nonland permanent to its owner's hand. If you have the city's blessing, you may put that permanent on top of its owner's library instead.]=];
CardNumber="RIX37";
MultiverseID=439694;
Rulings={
	{Date="2018-01-19";Text=[=[If you have the city’s blessing and choose not to put the target nonland permanent on top of its owner’s library, it’s returned to its owner’s hand.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
};
};

{Name="Exultant Skymarcher";
SetCode="RIX";
Manacost="{{1}}{{W}}{{W}}";
cmc=3;
Colors={"White"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Common";
Text=[=[Flying]=];
Flavor=[=["We have come at last to this holiest of holy places. What was stolen from us long ago is ours once again."]=];
CardNumber="RIX7";
Power="2";
Toughness="3";
MultiverseID=439664;
};

{Name="Famished Paladin";
SetCode="RIX";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Creature — Vampire Knight";
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Uncommon";
Text=[=[Famished Paladin doesn't untap during your untap step.<br/>
Whenever you gain life, untap Famished Paladin.]=];
Flavor=[=[Loyal to his queen, slave to his thirst.]=];
CardNumber="RIX8";
Power="3";
Toughness="3";
MultiverseID=439665;
};

{Name="Fanatical Firebrand";
SetCode="RIX";
Manacost="{{R}}";
cmc=1;
Colors={"Red"};
Type="Creature — Goblin Pirate";
Types={"Creature"};
SubTypes={"Goblin";"Pirate";};
Rarity="Common";
Text=[=[Haste<br/>
{{Tap}}, Sacrifice Fanatical Firebrand: It deals 1 damage to target creature or player.]=];
Flavor=[=["The Brazen Coalition is a firecannon pointed at our enemies. Goblins like him are the spark to its powder."<br/>
—Admiral Beckett Brass]=];
CardNumber="RIX101";
Power="1";
Toughness="1";
MultiverseID=439758;
};

{Name="Fathom Fleet Boarder";
SetCode="RIX";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Creature — Orc Pirate";
Types={"Creature"};
SubTypes={"Orc";"Pirate";};
Rarity="Common";
Text=[=[When Fathom Fleet Boarder enters the battlefield, you lose 2 life unless you control another Pirate.]=];
Flavor=[=[Without frequent raids, orcs sometimes get bored and plunder their own ships.]=];
CardNumber="RIX71";
Power="3";
Toughness="3";
MultiverseID=439728;
Rulings={
	{Date="2018-01-19";Text=[=[Fathom Fleet Boarder’s ability triggers regardless of whether you control another Pirate. Whether you control another Pirate is checked only as the ability resolves.]=];};
};
};

{Name="Fathom Fleet Captain";
SetCode="XLN";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[Menace<br/>
Whenever Fathom Fleet Captain attacks, if you control another nontoken Pirate, you may pay {{2}}. If you do, create a 2/2 black Pirate creature token with menace.]=];
Flavor=[=["Join me, and take the world for yourself!"]=];
CardNumber="XLN106";
Power="2";
Toughness="1";
MultiverseID=435260;
Rulings={
	{Date="2017-09-29";Text=[=[While resolving Fathom Fleet Captain’s triggered ability, you can’t pay {2} multiple times to create more than one Pirate token.]=];};
	{Date="2017-09-29";Text=[=[If you don’t control another nontoken Pirate at the moment Fathom Fleet Captain attacks, its triggered ability won’t trigger. If you don’t control another nontoken Pirate as that ability resolves, you can’t pay {2}.]=];};
};
};

{Name="Fathom Fleet Cutthroat";
SetCode="XLN";
Manacost="{{3}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[When Fathom Fleet Cutthroat enters the battlefield, destroy target creature an opponent controls that was dealt damage this turn.]=];
Flavor=[=["It was a bad evening for you, mate. Now it's chow time for the sharks."]=];
CardNumber="XLN107";
Power="3";
Toughness="3";
MultiverseID=435261;
};

{Name="Fathom Fleet Firebrand";
SetCode="XLN";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[{{1}}{{R}}: Fathom Fleet Firebrand gets +1/+0 until end of turn.]=];
Flavor=[=[As she charges into battle, her arcane tattoos stir and crawl like fiery serpents.]=];
CardNumber="XLN142";
Power="2";
Toughness="2";
MultiverseID=435296;
};

{Name="Favorable Winds";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Uncommon";
Text=[=[Creatures you control with flying get +1/+1.]=];
Flavor=[=["Like ribbons of wind and wisdom the coatls fly, twisting mystery into truth, shaping the clouds to suit their inscrutable will."<br/>
—Huatli]=];
CardNumber="XLN56";
MultiverseID=435208;
};

{Name="Fell Flagship";
SetCode="XLN";
Manacost="{{3}}";
cmc=3;
Type="Artifact — Vehicle";
Types={"Artifact"};
SubTypes={"Vehicle"};
Rarity="Rare";
Text=[=[Pirates you control get +1/+0.<br/>
Whenever Fell Flagship deals combat damage to a player, that player discards a card.<br/>
Crew 3 (Tap any number of creatures you control with total power 3 or more: This Vehicle becomes an artifact creature until end of turn.)]=];
CardNumber="XLN238";
Power="3";
Toughness="3";
MultiverseID=435396;
Rulings={
	{Date="2017-09-29";Text=[=[Each Vehicle is printed with a power and toughness, but it’s not a creature. If it becomes a creature (most likely through its crew ability), it will have that power and toughness.]=];};
	{Date="2017-09-29";Text=[=[If an effect causes a Vehicle to become an artifact creature with a specified power and toughness, that effect overwrites the Vehicle’s printed power and toughness.]=];};
	{Date="2017-09-29";Text=[=[Vehicle is an artifact type, not a creature type. A Vehicle that’s crewed won’t normally have any creature type.]=];};
	{Date="2017-09-29";Text=[=[Once a player announces that he or she is activating a crew ability, no player may take other actions until the ability has been paid for. Notably, players can’t try to stop the ability by changing a creature’s power or by removing or tapping a creature.]=];};
	{Date="2017-09-29";Text=[=[Any untapped creature you control can be tapped to pay a crew cost, even one that just came under your control.]=];};
	{Date="2017-09-29";Text=[=[You may tap more creatures than necessary to activate a crew ability.]=];};
	{Date="2017-09-29";Text=[=[Creatures that crew a Vehicle aren’t attached to it or related in any other way. Effects that affect the Vehicle, such as by destroying it or giving it a +1/+1 counter, don’t affect the creatures that crewed it.]=];};
	{Date="2017-09-29";Text=[=[Once a Vehicle becomes a creature, it behaves exactly like any other artifact creature. It can’t attack unless you’ve controlled it continuously since your turn began, it can block if it’s untapped, it can be tapped to pay a Vehicle’s crew cost, and so on.]=];};
	{Date="2017-09-29";Text=[=[You may activate a crew ability of a Vehicle even if it’s already an artifact creature. Doing so has no effect on the Vehicle. It doesn’t change its power and toughness.]=];};
	{Date="2017-09-29";Text=[=[For a Vehicle to be able to attack, it must be a creature as the declare attackers step begins, so the latest you can activate its crew ability to attack with it is during the beginning of combat step. For a Vehicle to be able to block, it must be a creature as the declare blockers step begins, so the latest you can activate its crew ability to block with it is during the declare attackers step. In either case, players may take actions after the crew ability resolves but before the Vehicle has been declared as an attacking or blocking creature.]=];};
	{Date="2017-09-29";Text=[=[When a Vehicle becomes a creature, that doesn’t count as having a creature enter the battlefield. The permanent was already on the battlefield; it only changed its types. Abilities that trigger whenever a creature enters the battlefield won’t trigger.]=];};
	{Date="2017-09-29";Text=[=[If a permanent becomes a copy of a Vehicle, the copy won’t be a creature, even if the Vehicle it’s copying has become an artifact creature.]=];};
};
};

{Name="Field of Ruin";
SetCode="XLN";
Type="Land";
Types={"Land"};
Rarity="Uncommon";
Text=[=[{{Tap}}: Add {{C}} to your mana pool.<br/>
{{2}}, {{Tap}}, Sacrifice Field of Ruin: Destroy target nonbasic land an opponent controls. Each player searches his or her library for a basic land card, puts it onto the battlefield, then shuffles his or her library.]=];
CardNumber="XLN254";
MultiverseID=435415;
};

{Name="Fiery Cannonade";
SetCode="XLN";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Fiery Cannonade deals 2 damage to each non-Pirate creature.]=];
Flavor=[=[Wary of the ferocious dinosaurs, the Legion of Dusk built up the walls of their fort—just in time for the pirates to burn them down.]=];
CardNumber="XLN143";
MultiverseID=435297;
};

{Name="Fire Shrine Keeper";
SetCode="XLN";
Manacost="{{R}}";
cmc=1;
Colors={"Red"};
Type="Creature — Elemental";
Types={"Creature"};
SubTypes={"Elemental"};
Rarity="Common";
Text=[=[Menace<br/>
{{7}}{{R}}, {{Tap}}, Sacrifice Fire Shrine Keeper: It deals 3 damage to each of up to two target creatures.]=];
Flavor=[=[Though grimed with the dust of centuries, the ancient shrine was not unguarded.]=];
CardNumber="XLN144";
Power="1";
Toughness="1";
MultiverseID=435298;
Rulings={
	{Date="2017-09-29";Text=[=[You can’t target the same creature twice to have Fire Shrine Keeper deal 6 damage to it.]=];};
};
};

{Name="Firecannon Blast";
SetCode="XLN";
Manacost="{{1}}{{R}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Firecannon Blast deals 3 damage to target creature.<br/>
Raid — Firecannon Blast deals 6 damage to that creature instead if you attacked with a creature this turn.]=];
Flavor=[=[Goblins' fearlessness and diminutive size make them the perfect cannoneers.]=];
CardNumber="XLN145";
MultiverseID=435299;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Fleet Swallower";
SetCode="XLN";
Manacost="{{5}}{{U}}{{U}}";
cmc=7;
Colors={"Blue"};
Type="Creature — Fish";
Types={"Creature"};
SubTypes={"Fish"};
Rarity="Rare";
Text=[=[Whenever Fleet Swallower attacks, target player puts the top half of his or her library, rounded up, into his or her graveyard.]=];
Flavor=[=["Captain, I think that island is following us."]=];
CardNumber="XLN57";
Power="6";
Toughness="6";
MultiverseID=435209;
Rulings={
	{Date="2017-09-29";Text=[=[Fleet Swallower’s triggered ability can target any player, not just the player it’s attacking.]=];};
	{Date="2017-09-29";Text=[=[If two Fleet Swallowers attack, each trigger determines the top half of that player’s library separately. For example, if the target player has fifteen cards in his or her library, that player puts the top eight cards into the graveyard, then puts the top four cards into the graveyard.]=];};
};
};

{Name="Flood of Recollection";
SetCode="RIX";
Manacost="{{U}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Return target instant or sorcery card from your graveyard to your hand. Exile Flood of Recollection.]=];
Flavor=[=[Jace tumbled down the waterfall and plunged deep into his past.]=];
CardNumber="RIX38";
MultiverseID=439695;
Rulings={
	{Date="2018-01-19";Text=[=[There are many important moments in the story, but the most crucial—called “story spotlights”—are shown on cards. These cards have the Planeswalker symbol in their text box; this symbol has no effect on gameplay. You can read more about these events in the official Magic fiction at http://www.mtgstory.com.]=];};
};
};

{Name="Forerunner of the Coalition";
SetCode="RIX";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[When Forerunner of the Coalition enters the battlefield, you may search your library for a Pirate card, reveal it, then shuffle your library and put that card on top of it.<br/>
Whenever another Pirate enters the battlefield under your control, each opponent loses 1 life.]=];
CardNumber="RIX72";
Power="2";
Toughness="2";
MultiverseID=439729;
Rulings={
	{Date="2018-01-19";Text=[=[In a Two-Headed Giant game, the last ability of Forerunner of the Coalition causes the opposing team to lose 2 life.]=];};
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Forerunner of the Empire";
SetCode="RIX";
Manacost="{{3}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Creature — Human Soldier";
Types={"Creature"};
SubTypes={"Human";"Soldier";};
Rarity="Uncommon";
Text=[=[When Forerunner of the Empire enters the battlefield, you may search your library for a Dinosaur card, reveal it, then shuffle your library and put that card on top of it.<br/>
Whenever a Dinosaur enters the battlefield under your control, you may have Forerunner of the Empire deal 1 damage to each creature.]=];
CardNumber="RIX102";
Power="1";
Toughness="3";
MultiverseID=439759;
Rulings={
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Forerunner of the Heralds";
SetCode="RIX";
Manacost="{{3}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Creature — Merfolk Scout";
Types={"Creature"};
SubTypes={"Merfolk";"Scout";};
Rarity="Uncommon";
Text=[=[When Forerunner of the Heralds enters the battlefield, you may search your library for a Merfolk card, reveal it, then shuffle your library and put that card on top of it.<br/>
Whenever another Merfolk enters the battlefield under your control, put a +1/+1 counter on Forerunner of the Heralds.]=];
CardNumber="RIX129";
Power="3";
Toughness="2";
MultiverseID=439786;
Rulings={
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Forerunner of the Legion";
SetCode="RIX";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Creature — Vampire Knight";
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Uncommon";
Text=[=[When Forerunner of the Legion enters the battlefield, you may search your library for a Vampire card, reveal it, then shuffle your library and put that card on top of it.<br/>
Whenever another Vampire enters the battlefield under your control, target creature gets +1/+1 until end of turn.]=];
CardNumber="RIX9";
Power="2";
Toughness="2";
MultiverseID=439666;
Rulings={
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Forest";
SetCode="RIX";
Type="Basic Land — Forest";
SuperTypes={"Basic"};
Types={"Land"};
SubTypes={"Forest"};
Rarity="Basic Land";
CardNumber="RIX196";
MultiverseID=439860;
};

{Name="Form of the Dinosaur";
SetCode="RIX";
Manacost="{{4}}{{R}}{{R}}";
cmc=6;
Colors={"Red"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Rare";
Text=[=[When Form of the Dinosaur enters the battlefield, your life total becomes 15.<br/>
At the beginning of your upkeep, Form of the Dinosaur deals 15 damage to target creature an opponent controls and that creature deals damage equal to its power to you.]=];
CardNumber="RIX103";
MultiverseID=439760;
Rulings={
	{Date="2018-01-19";Text=[=[For your life total to become 15, you gain or lose the appropriate amount of life. For example, if your life total is 4 when Form of the Dinosaur’s first ability resolves, it will cause you to gain 11 life; alternatively, if your life total is 40 when it resolves, it will cause you to lose 25 life. Other cards that interact with life gain or life loss will interact with this effect accordingly.]=];};
	{Date="2018-01-19";Text=[=[Form of the Dinosaur’s last ability isn’t optional. You have to pick a fight with an opponent’s creature if any are legal targets. If that creature leaves the battlefield after it becomes the target of Form of the Dinosaur’s ability but before it resolves, you won’t be dealt damage.]=];};
	{Date="2018-01-19";Text=[=[In a Two-Headed Giant game, Form of the Dinosaur’s first ability causes your team’s life total to become 15. Only you gain or lose life this way.]=];};
};
};

{Name="Forsaken Sanctuary";
SetCode="RIX";
Type="Land";
Types={"Land"};
Rarity="Uncommon";
Text=[=[Forsaken Sanctuary enters the battlefield tapped.<br/>
{{Tap}}: Add {{W}} or {{B}} to your mana pool.]=];
Flavor=[=[In the galleon's grand cathedral, conquistadors swore vows of faith. In its wreckage, they swore vows of revenge.]=];
CardNumber="RIX187";
MultiverseID=439851;
};

{Name="Foul Orchard";
SetCode="RIX";
Type="Land";
Types={"Land"};
Rarity="Uncommon";
Text=[=[Foul Orchard enters the battlefield tapped.<br/>
{{Tap}}: Add {{B}} or {{G}} to your mana pool.]=];
Flavor=[=[The stench of rotting meat lures flies, goblins, and young raptors.]=];
CardNumber="RIX188";
MultiverseID=439852;
};

{Name="Frenzied Raptor";
SetCode="XLN";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Flavor=[=[Sun Empire warriors are taught to emulate the fearless raptors that fling themselves against towers of horn and muscle a hundred times their size.]=];
CardNumber="XLN146";
Power="4";
Toughness="2";
MultiverseID=435300;
};

{Name="Frilled Deathspitter";
SetCode="RIX";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Enrage — Whenever Frilled Deathspitter is dealt damage, it deals 2 damage to target opponent.]=];
Flavor=[=[Nothing says trouble like a reedy hiss with a hint of liquid gurgle.]=];
CardNumber="RIX104";
Power="3";
Toughness="2";
MultiverseID=439761;
Rulings={
	{Date="2018-01-19";Text=[=[If your life total is brought to 0 or less at the same time that Frilled Deathspitter is dealt damage, you lose the game before its enrage ability resolves.]=];};
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Ghalta, Primal Hunger";
SetCode="RIX";
Manacost="{{10}}{{G}}{{G}}";
cmc=12;
Colors={"Green"};
Type="Legendary Creature — Elder Dinosaur";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Elder";"Dinosaur";};
Rarity="Rare";
Text=[=[Ghalta, Primal Hunger costs {{X}} less to cast, where X is the total power of creatures you control.<br/>
Trample]=];
Flavor=[=[The earth walks, strongest of all.]=];
CardNumber="RIX130";
Power="12";
Toughness="12";
MultiverseID=439787;
Rulings={
	{Date="2018-01-19";Text=[=[To determine Ghalta’s total cost, start with the mana cost (or an alternative cost if another card’s effect allows you to pay one instead), add any cost increases, then apply any cost reductions. Ghalta’s converted mana cost remains unchanged, no matter what the total cost to cast it was.]=];};
	{Date="2018-01-19";Text=[=[The total cost to cast Ghalta is locked in before you pay that cost. For example, if you control three 2/2 creatures, including one you can sacrifice to add {C} to your mana pool, the total cost of Ghalta is {4}{G}{G}. Then you can sacrifice the creature when you activate mana abilities just before paying the cost.]=];};
	{Date="2018-01-19";Text=[=[If a creature’s power is somehow less than 0, it subtracts from the total power of your other creatures. If the total power of your creatures is 0 or less, Ghalta’s cost remains {10}{G}{G}.]=];};
	{Date="2018-01-19";Text=[=[Ghalta’s first ability can’t reduce its cost below {G}{G}.]=];};
};
};

{Name="Gilded Sentinel";
SetCode="XLN";
Manacost="{{4}}";
cmc=4;
Type="Artifact Creature — Golem";
Types={"Artifact";"Creature";};
SubTypes={"Golem"};
Rarity="Common";
Flavor=[=[The River Heralds fight to keep all others from reaching the golden city. The city has its own defenses.]=];
CardNumber="XLN239";
Power="3";
Toughness="3";
MultiverseID=435397;
};

{Name="Giltgrove Stalker";
SetCode="RIX";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Common";
Text=[=[Giltgrove Stalker can't be blocked by creatures with power 2 or less.]=];
Flavor=[=["The only gold I need is the sheltering shimmer of the trees."]=];
CardNumber="RIX131";
Power="2";
Toughness="1";
MultiverseID=439788;
Rulings={
	{Date="2018-01-19";Text=[=[Once a creature with power 3 or greater has blocked this creature, changing the power of the blocking creature won’t cause this creature to become unblocked.]=];};
};
};

{Name="Gishath, Sun's Avatar";
SetCode="XLN";
Manacost="{{5}}{{R}}{{G}}{{W}}";
cmc=8;
Colors={"White";"Red";"Green";};
Type="Legendary Creature — Dinosaur Avatar";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Dinosaur";"Avatar";};
Rarity="Mythic Rare";
Text=[=[Trample, vigilance, haste<br/>
Whenever Gishath, Sun's Avatar deals combat damage to a player, reveal that many cards from the top of your library. Put any number of Dinosaur creature cards from among them onto the battlefield and the rest on the bottom of your library in a random order.]=];
CardNumber="XLN222";
Power="7";
Toughness="6";
MultiverseID=435378;
Rulings={
	{Date="2017-09-29";Text=[=[If you have fewer cards in your library than the amount of damage Gishath deals, you reveal the cards you have. Because you’re not drawing cards, you don’t lose the game.]=];};
};
};

{Name="Glacial Fortress";
SetCode="XLN";
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[Glacial Fortress enters the battlefield tapped unless you control a Plains or an Island.<br/>
{{Tap}}: Add {{W}} or {{U}} to your mana pool.]=];
Flavor=[=[Ships blown north in their voyage across the Stormwreck Sea become trapped in the unmelting ice.]=];
CardNumber="XLN255";
MultiverseID=435416;
Rulings={
	{Date="2009-10-01";Text=[=[This checks for lands you control with the land type Plains or Island, not for lands named Plains or Island. The lands it checks for don’t have to be basic lands. For example, if you control Watery Grave (a nonbasic land with the land types Island and Swamp), Glacial Fortress will enter the battlefield untapped.]=];};
	{Date="2009-10-01";Text=[=[As this is entering the battlefield, it checks for lands that are already on the battlefield. It won’t see lands that are entering the battlefield at the same time (due to Warp World, for example).]=];};
};
};

{Name="Gleaming Barrier";
SetCode="RIX";
Manacost="{{2}}";
cmc=2;
Type="Artifact Creature — Wall";
Types={"Artifact";"Creature";};
SubTypes={"Wall"};
Rarity="Common";
Text=[=[Defender<br/>
When Gleaming Barrier dies, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=["Gold without freedom might as well be lead."<br/>
—Angrath]=];
CardNumber="RIX178";
Power="0";
Toughness="4";
MultiverseID=439841;
};

{Name="Glorifier of Dusk";
SetCode="XLN";
Manacost="{{3}}{{W}}{{W}}";
cmc=5;
Colors={"White"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Uncommon";
Text=[=[Pay 2 life: Glorifier of Dusk gains flying until end of turn.<br/>
Pay 2 life: Glorifier of Dusk gains vigilance until end of turn.]=];
Flavor=[=["The blood of the enemy is a sacrament. The strength it gives is proof that our cause is just."]=];
CardNumber="XLN12";
Power="4";
Toughness="4";
MultiverseID=435163;
};

{Name="Goblin Trailblazer";
SetCode="RIX";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Goblin Pirate";
Types={"Creature"};
SubTypes={"Goblin";"Pirate";};
Rarity="Common";
Text=[=[Menace]=];
Flavor=[=["Why are we following the goblin? Can he even read that map?"<br/>
—Daphne Vail, Diremore first mate]=];
CardNumber="RIX105";
Power="2";
Toughness="1";
MultiverseID=439762;
};

{Name="Golden Demise";
SetCode="RIX";
Manacost="{{1}}{{B}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
All creatures get -2/-2 until end of turn. If you have the city's blessing, instead only creatures your opponents control get -2/-2 until end of turn.]=];
CardNumber="RIX73";
MultiverseID=439730;
Rulings={
	{Date="2018-01-19";Text=[=[Golden Demise affects only creatures that are on the battlefield at the time it resolves. Creatures that enter the battlefield later in the turn won’t get -2/-2. Similarly, if you have the city’s blessing, creatures that come under your opponents’ control later in the turn won’t get -2/-2.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
};
};

{Name="Golden Guardian";
SetCode="RIX";
Manacost="{{4}}";
cmc=4;
Type="Artifact Creature — Golem";
Types={"Artifact";"Creature";};
SubTypes={"Golem"};
Rarity="Rare";
Text=[=[Defender<br/>
{{2}}: Golden Guardian fights another target creature you control. When Golden Guardian dies this turn, return it to the battlefield transformed under your control.]=];
CardNumber="RIX179a";
Power="4";
Toughness="4";
MultiverseID=439842;
Rulings={
	{Date="2018-01-19";Text=[=[If the target of Golden Guardian’s activated ability isn’t a legal target as that ability resolves, or if Golden Guardian has left the battlefield, neither creature will deal or be dealt damage.]=];};
	{Date="2018-01-19";Text=[=[Once Golden Guardian’s activated ability has resolved, it will return to the battlefield transformed if it dies for any reason in that turn.]=];};
	{Date="2018-01-19";Text=[=[If Golden Guardian leaves the battlefield before its activated ability has resolved, it won’t be returned to the battlefield when the ability resolves.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Gold-Forge Garrison";
SetCode="RIX";
cmc=4;
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Golden Guardian.)<br/>
{{Tap}}: Add two mana of any one color to your mana pool.<br/>
{{4}}, {{Tap}}: Create a 4/4 colorless Golem artifact creature token.]=];
Flavor=[=[An army of living gold for the golden city.]=];
CardNumber="RIX179b";
MultiverseID=439843;
};

{Name="Goring Ceratops";
SetCode="XLN";
Manacost="{{5}}{{W}}{{W}}";
cmc=7;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Rare";
Text=[=[Double strike<br/>
Whenever Goring Ceratops attacks, other creatures you control gain double strike until end of turn.]=];
Flavor=[=["Follow her footsteps and she will show you the way."<br/>
—Itzama the Crested]=];
CardNumber="XLN13";
Power="3";
Toughness="3";
MultiverseID=435164;
};

{Name="Grasping Current";
SetCode="XLN";
Manacost="{{4}}{{U}}";
cmc=5;
Colors={"Blue"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Rare";
Text=[=[Return up to two target creatures to their owner's hand.<br/>
Search your library and/or graveyard for a card named Jace, Ingenious Mind-Mage, reveal it, and put it into your hand. If you searched your library this way, shuffle it.]=];
CardNumber="XLN282";
MultiverseID=435443;
Rulings={
	{Date="2017-09-29";Text=[=[You may cast Grasping Current without choosing any target creatures. You’ll just search for Jace, Ingenious Mind-Mage. However, if you choose any targets and all of those targets become illegal before Grasping Current resolves, the spell will be countered and you won’t search.]=];};
};
};

{Name="Grasping Scoundrel";
SetCode="RIX";
Manacost="{{B}}";
cmc=1;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[Grasping Scoundrel gets +1/+0 as long as it's attacking.]=];
Flavor=[=["I can hear the plunder calling. It asks for me by name."]=];
CardNumber="RIX74";
Power="1";
Toughness="1";
MultiverseID=439731;
};

{Name="Grazing Whiptail";
SetCode="XLN";
Manacost="{{2}}{{G}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Reach]=];
Flavor=[=[Often found browsing on the upper canopies of Ixalan's jungles, whiptails are known to absently bat away anything foolish enough to interrupt their meal.]=];
CardNumber="XLN190";
Power="3";
Toughness="4";
MultiverseID=435345;
};

{Name="Grim Captain's Call";
SetCode="XLN";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Return a Pirate card from your graveyard to your hand, then do the same for Vampire, Dinosaur, and Merfolk.]=];
Flavor=[=[When the battle is over, the bitterest foes at last find common ground.]=];
CardNumber="XLN108";
MultiverseID=435262;
Rulings={
	{Date="2017-09-29";Text=[=[Grim Captain’s Call doesn’t target the cards to return. You choose them while it’s resolving. No players may take actions between the time you make each choice and the time you return each card to your hand.]=];};
	{Date="2017-09-29";Text=[=[If a card in your graveyard has more than one of these types (such as a Dinosaur that’s a Vampire Dinosaur due to Arcane Adaptation’s effect), you may choose to return it for one of its types and return another card of the other type.]=];};
	{Date="2017-09-29";Text=[=[If you don’t have a card in your graveyard of one of the listed creature types, you just continue to the next listed type.]=];};
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Growing Rites of Itlimoc";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Legendary Enchantment";
SuperTypes={"Legendary"};
Types={"Enchantment"};
Rarity="Rare";
Text=[=[When Growing Rites of Itlimoc enters the battlefield, look at the top four cards of your library. You may reveal a creature card from among them and put it into your hand. Put the rest on the bottom of your library in any order.<br/>
At the beginning of your end step, if you control four or more creatures, transform Growing Rites of Itlimoc.]=];
CardNumber="XLN191a";
MultiverseID=435346;
Rulings={
	{Date="2017-09-29";Text=[=[The last ability of Growing Rites of Itlimoc doesn’t trigger if you don’t control four or more creatures as your end step begins. If you don’t control four or more creatures as it resolves, it does nothing.]=];};
	{Date="2017-09-29";Text=[=[If you control a creature that will be removed from the battlefield “at the beginning of the next end step,” you can resolve the ability of Growing Rites of Itlimoc before that creature leaves the battlefield.]=];};
	{Date="2017-09-29";Text=[=[If you gain control of a creature “until end of turn,” or if a noncreature permanent you control becomes a creature “until end of turn,” it’ll be a creature under your control through the entire end step.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Gruesome Fate";
SetCode="RIX";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Each opponent loses 1 life for each creature you control.]=];
Flavor=[=["You were keen enough to sink your fangs into us, vampire! And now you're afraid of a few little nibbles?"<br/>
—Udvil "Ratty" Ratlock]=];
CardNumber="RIX75";
MultiverseID=439732;
Rulings={
	{Date="2018-01-19";Text=[=[In a Two-Headed Giant game, Gruesome Fate causes the opposing team to lose 2 life for each creature you control.]=];};
};
};

{Name="Hadana's Climb";
SetCode="RIX";
Manacost="{{1}}{{G}}{{U}}";
cmc=3;
Colors={"Blue";"Green";};
Type="Legendary Enchantment";
SuperTypes={"Legendary"};
Types={"Enchantment"};
Rarity="Rare";
Text=[=[At the beginning of combat on your turn, put a +1/+1 counter on target creature you control. Then if that creature has three or more +1/+1 counters on it, transform Hadana's Climb.]=];
Flavor=[=[Hadana seeks power in the service of peace.]=];
CardNumber="RIX158a";
MultiverseID=439815;
Rulings={
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Hardy Veteran";
SetCode="RIX";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Creature — Human Warrior";
Types={"Creature"};
SubTypes={"Human";"Warrior";};
Rarity="Common";
Text=[=[As long as it's your turn, Hardy Veteran gets +0/+2.]=];
Flavor=[=[For the Sun Empire, the Immortal Sun is a symbol of national identity. When they reclaim it, the Empire will flourish once more.]=];
CardNumber="RIX132";
Power="2";
Toughness="2";
MultiverseID=439789;
Rulings={
	{Date="2018-01-19";Text=[=[Hardy Veteran gets +0/+2 for the entire duration of your turn. If it’s dealt damage or gets -X/-X until end of turn, those will wear off before your turn is over.]=];};
};
};

{Name="Headstrong Brute";
SetCode="XLN";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Creature — Orc Pirate";
Types={"Creature"};
SubTypes={"Orc";"Pirate";};
Rarity="Common";
Text=[=[Headstrong Brute can't block.<br/>
Headstrong Brute has menace as long as you control another Pirate.]=];
Flavor=[=["Watch your backs, keep your blades at hand, and let the orc go first!"<br/>
—Captain Brandis Thorn]=];
CardNumber="XLN147";
Power="3";
Toughness="3";
MultiverseID=435301;
};

{Name="Headwater Sentries";
SetCode="XLN";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Common";
Flavor=[=["The elders say that if the intruders discovered the secret of the golden city, it would mean an end to our people."]=];
CardNumber="XLN58";
Power="2";
Toughness="5";
MultiverseID=435210;
};

{Name="Heartless Pillage";
SetCode="XLN";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Target opponent discards two cards.<br/>
Raid — If you attacked with a creature this turn, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
CardNumber="XLN109";
MultiverseID=435263;
Rulings={
	{Date="2017-09-29";Text=[=[If you’ve attacked with a creature this turn, you’ll get a Treasure even if the target opponent discards one or zero cards.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Herald of Secret Streams";
SetCode="XLN";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Rare";
Text=[=[Creatures you control with +1/+1 counters on them can't be blocked.]=];
Flavor=[=["You might as well try to stop the waterfall."]=];
CardNumber="XLN59";
Power="2";
Toughness="3";
MultiverseID=435211;
Rulings={
	{Date="2017-09-29";Text=[=[Once a creature you control has become blocked, putting a +1/+1 counter on it won’t cause it to become unblocked.]=];};
};
};

{Name="Hierophant's Chalice";
SetCode="XLN";
Manacost="{{3}}";
cmc=3;
Type="Artifact";
Types={"Artifact"};
Rarity="Common";
Text=[=[When Hierophant's Chalice enters the battlefield, target opponent loses 1 life and you gain 1 life.<br/>
{{Tap}}: Add {{C}} to your mana pool.]=];
Flavor=[=[In the Rite of Redemption, nobles take the same vows as Elenda, the first vampire, and make the same eternal sacrifice.]=];
CardNumber="XLN240";
MultiverseID=435398;
};

{Name="Highland Lake";
SetCode="RIX";
Type="Land";
Types={"Land"};
Rarity="Uncommon";
Text=[=[Highland Lake enters the battlefield tapped.<br/>
{{Tap}}: Add {{U}} or {{R}} to your mana pool.]=];
Flavor=[=["A place like this makes me wonder if there's more to life than blood and treasure . . . Nah."<br/>
—Boyl Bucksalt, Storm Fleet swab]=];
CardNumber="RIX189";
MultiverseID=439853;
};

{Name="Hijack";
SetCode="XLN";
Manacost="{{1}}{{R}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Gain control of target artifact or creature until end of turn. Untap it. It gains haste until end of turn.]=];
Flavor=[=[Trapped on Ixalan, the Planeswalker Angrath is the only minotaur sailing the seas. No matter how many ships he captures, he cannot break free.]=];
CardNumber="XLN148";
MultiverseID=435302;
Rulings={
	{Date="2017-09-29";Text=[=[You can target and gain control of an untapped artifact or creature this way. You can also untap an artifact or creature you already control and give it haste.]=];};
};
};

{Name="Hornswoggle";
SetCode="RIX";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Counter target creature spell. You create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=[Being a merciful pirate, she saved the vampire's gold from falling overboard.]=];
CardNumber="RIX39";
MultiverseID=439696;
Rulings={
	{Date="2018-01-19";Text=[=[Hornswoggle can target a spell that can’t be countered, such as Nezahal, Primal Tide. When Hornswoggle resolves, that spell won’t be countered, but you’ll still get a Treasure.]=];};
};
};

{Name="Hostage Taker";
SetCode="XLN";
Manacost="{{2}}{{U}}{{B}}";
cmc=4;
Colors={"Blue";"Black";};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[When Hostage Taker enters the battlefield, exile another target creature or artifact until Hostage Taker leaves the battlefield. You may cast that card for as long as it remains exiled, and you may spend mana as though it were mana of any type to cast that spell.]=];
CardNumber="XLN223";
Power="2";
Toughness="3";
MultiverseID=435379;
Rulings={
	{Date="2017-09-29";Text=[=[Hostage Taker has received errata to prevent it from targeting itself. The correct Oracle wording appears above.]=];};
	{Date="2017-09-29";Text=[=[If Hostage Taker leaves the battlefield before its triggered ability resolves, the target permanent won’t be exiled.]=];};
	{Date="2017-09-29";Text=[=[Auras attached to the exiled permanent will be put into their owners’ graveyards. Any Equipment will become unattached and remain on the battlefield. Any counters on the exiled permanent will cease to exist.]=];};
	{Date="2017-09-29";Text=[=[If a token is exiled this way, it will cease to exist and won’t return to the battlefield. You can’t cast it.]=];};
	{Date="2017-09-29";Text=[=[Once you begin to cast the exiled card, it’s considered a new object. You’ll control that spell and the permanent that spell becomes even if Hostage Taker leaves the battlefield.]=];};
	{Date="2017-09-29";Text=[=[If it’s still in exile, the exiled card returns to the battlefield immediately after Hostage Taker leaves the battlefield. Nothing happens between the two events, including state-based actions.]=];};
	{Date="2017-09-29";Text=[=[In a multiplayer game, if Hostage Taker’s owner leaves the game while the card is still exiled and another player owns that card, the exiled card will return to the battlefield under its owner’s control. Because the one-shot effect that returns the card isn’t an ability that goes on the stack, it won’t cease to exist along with the leaving player’s spells and abilities on the stack.]=];};
	{Date="2017-09-29";Text=[=[In a multiplayer game, if a player leaves the game, all cards that player owns leave as well. If you leave the game, any spell or permanent cards you control from Hostage Taker’s ability are exiled.]=];};
};
};

{Name="Huatli, Dinosaur Knight";
SetCode="XLN";
Manacost="{{4}}{{R}}{{W}}";
cmc=6;
Colors={"White";"Red";};
Type="Legendary Planeswalker — Huatli";
SuperTypes={"Legendary"};
Types={"Planeswalker"};
SubTypes={"Huatli"};
Rarity="Mythic Rare";
Text=[=[+2: Put two +1/+1 counters on up to one target Dinosaur you control.<br/>
−3: Target Dinosaur you control deals damage equal to its power to target creature you don't control.<br/>
−7: Dinosaurs you control get +4/+4 until end of turn.]=];
CardNumber="XLN285";
Loyalty="4";
MultiverseID=435446;
Rulings={
	{Date="2017-09-29";Text=[=[If either creature is an illegal target as Huatli’s second ability resolves, the creature you control won’t deal damage.]=];};
	{Date="2017-09-29";Text=[=[Huatli’s last ability affects only Dinosaurs you control at the time it resolves. Dinosaurs you begin to control later in the turn or creatures that become Dinosaurs later in the turn won’t get +4/+4.]=];};
};
};

{Name="Huatli, Radiant Champion";
SetCode="RIX";
Manacost="{{2}}{{G}}{{W}}";
cmc=4;
Colors={"White";"Green";};
Type="Legendary Planeswalker — Huatli";
SuperTypes={"Legendary"};
Types={"Planeswalker"};
SubTypes={"Huatli"};
Rarity="Mythic Rare";
Text=[=[+1: Put a loyalty counter on Huatli, Radiant Champion for each creature you control.<br/>
−1: Target creature gets +X/+X until end of turn, where X is the number of creatures you control.<br/>
−8: You get an emblem with "Whenever a creature enters the battlefield under your control, you may draw a card."]=];
CardNumber="RIX159";
Loyalty="3";
MultiverseID=439817;
Rulings={
	{Date="2018-01-19";Text=[=[If you activate Huatli’s first ability while you control no creatures, she’ll get one loyalty counter from the ability’s activation cost and no others as it resolves.]=];};
	{Date="2018-01-19";Text=[=[The number of creatures you control is counted only as Huatli’s first or second ability resolves. Once her second ability resolves, the bonus won’t change, even if the number of creatures you control changes later in the turn.]=];};
};
};

{Name="Huatli, Warrior Poet";
SetCode="XLN";
Manacost="{{3}}{{R}}{{W}}";
cmc=5;
Colors={"White";"Red";};
Type="Legendary Planeswalker — Huatli";
SuperTypes={"Legendary"};
Types={"Planeswalker"};
SubTypes={"Huatli"};
Rarity="Mythic Rare";
Text=[=[+2: You gain life equal to the greatest power among creatures you control.<br/>
0: Create a 3/3 green Dinosaur creature token with trample.<br/>
−X: Huatli, Warrior Poet deals X damage divided as you choose among any number of target creatures. Creatures dealt damage this way can't block this turn.]=];
CardNumber="XLN224";
Loyalty="3";
MultiverseID=435380;
Rulings={
	{Date="2017-09-29";Text=[=[The greatest power among creatures you control is determined as Huatli’s first ability resolves. If that number is negative, you won’t gain or lose any life.]=];};
	{Date="2017-09-29";Text=[=[You can activate Huatli’s first ability even if you control no creatures. You simply won’t gain any life.]=];};
	{Date="2017-09-29";Text=[=[You divide the damage among the target creatures as you activate Huatli’s last ability. Each target must be assigned at least 1 damage. If X is 0, you can’t choose any targets.]=];};
	{Date="2017-09-29";Text=[=[If some (but not all) of the targets become illegal, the original division of damage still applies, but no damage is dealt to illegal targets. If all targets become illegal, the ability will be countered.]=];};
};
};

{Name="Huatli's Snubhorn";
SetCode="XLN";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Vigilance (Attacking doesn't cause this creature to tap.)]=];
Flavor=[=[Don't make the mistake of thinking blunt horns can't kill.]=];
CardNumber="XLN286";
Power="2";
Toughness="2";
MultiverseID=435447;
};

{Name="Huatli's Spurring";
SetCode="XLN";
Manacost="{{R}}";
cmc=1;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Target creature gets +2/+0 until end of turn. If you control a Huatli planeswalker, that creature gets +4/+0 until end of turn instead.]=];
Flavor=[=["Run like the wind, fierce one. The hunt has begun."]=];
CardNumber="XLN287";
MultiverseID=435448;
Rulings={
	{Date="2017-09-29";Text=[=[Whether you control a Huatli planeswalker is checked only as Huatli’s Spurring resolves. The creature’s power won’t change later in the turn if Huatli leaves or comes under your control.]=];};
};
};

{Name="Hunt the Weak";
SetCode="RIX";
Manacost="{{3}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Put a +1/+1 counter on target creature you control. Then that creature fights target creature you don't control. (Each deals damage equal to its power to the other.)]=];
Flavor=[=["Death lizard approaching, cap'n!"<br/>
—Brint Doobin, last words]=];
CardNumber="RIX133";
MultiverseID=439790;
Rulings={
	{Date="2018-01-19";Text=[=[You can’t cast Hunt the Weak unless you choose both a creature you control and a creature you don’t control as targets.]=];};
	{Date="2018-01-19";Text=[=[If either target is an illegal target as Hunt the Weak resolves, neither creature will deal or be dealt damage.]=];};
	{Date="2018-01-19";Text=[=[If the creature you control is an illegal target as Hunt the Weak tries to resolve, you won’t put a +1/+1 counter on it. If that creature is a legal target but the other creature isn’t, you’ll still put the counter on the creature you control.]=];};
};
};

{Name="Impale";
SetCode="RIX";
Manacost="{{2}}{{B}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Destroy target creature.]=];
Flavor=[=[Never let the glitter of gold distract you from the gleam of steel in the shadows.]=];
CardNumber="RIX76";
MultiverseID=439733;
};

{Name="Imperial Aerosaur";
SetCode="XLN";
Manacost="{{3}}{{W}}";
cmc=4;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Flying<br/>
When Imperial Aerosaur enters the battlefield, another target creature you control gets +1/+1 and gains flying until end of turn.]=];
Flavor=[=[Its assistance is unnervingly similar to its hunting technique.]=];
CardNumber="XLN14";
Power="3";
Toughness="3";
MultiverseID=435165;
};

{Name="Imperial Ceratops";
SetCode="RIX";
Manacost="{{4}}{{W}}";
cmc=5;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Enrage — Whenever Imperial Ceratops is dealt damage, you gain 2 life.]=];
Flavor=[=["The music of blades against its silver armor merely inspires it to bellow more full-throated melodies."<br/>
—Huatli]=];
CardNumber="RIX10";
Power="3";
Toughness="5";
MultiverseID=439667;
Rulings={
	{Date="2018-01-19";Text=[=[If your life total is brought to 0 or less at the same time that Imperial Ceratops is dealt damage, you lose the game before its enrage ability resolves.]=];};
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Imperial Lancer";
SetCode="XLN";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Creature — Human Knight";
Types={"Creature"};
SubTypes={"Human";"Knight";};
Rarity="Uncommon";
Text=[=[Imperial Lancer has double strike as long as you control a Dinosaur.]=];
Flavor=[=["Together my mount and I are stronger than either of us apart."]=];
CardNumber="XLN15";
Power="1";
Toughness="1";
MultiverseID=435166;
Rulings={
	{Date="2017-09-29";Text=[=[If you no longer control a Dinosaur after the first-strike combat damage step, Imperial Lancer won’t have double strike, and so it won’t deal regular combat damage.]=];};
};
};

{Name="Induced Amnesia";
SetCode="RIX";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Rare";
Text=[=[When Induced Amnesia enters the battlefield, target player exiles all cards from his or her hand face down, then draws that many cards.<br/>
When Induced Amnesia is put into a graveyard from the battlefield, return the exiled cards to their owner's hand.]=];
CardNumber="RIX40";
MultiverseID=439697;
Rulings={
	{Date="2018-01-19";Text=[=[No player may look at the exiled cards.]=];};
	{Date="2018-01-19";Text=[=[If Induced Amnesia leaves the battlefield but isn’t put into a graveyard, the exiled cards are lost forever. They won’t be returned if another Induced Amnesia is put into a graveyard, even if that Induced Amnesia is represented by the same card.]=];};
	{Date="2018-01-19";Text=[=[If Induced Amnesia leaves the battlefield before its first ability resolves, its second ability will trigger (if appropriate) and do nothing. Then its first ability will resolve, and the exiled cards will be exiled indefinitely.]=];};
	{Date="2018-01-19";Text=[=[There are many important moments in the story, but the most crucial—called “story spotlights”—are shown on cards. These cards have the Planeswalker symbol in their text box; this symbol has no effect on gameplay. You can read more about these events in the official Magic fiction at http://www.mtgstory.com.]=];};
};
};

{Name="Inspiring Cleric";
SetCode="XLN";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Creature — Vampire Cleric";
Types={"Creature"};
SubTypes={"Vampire";"Cleric";};
Rarity="Uncommon";
Text=[=[When Inspiring Cleric enters the battlefield, you gain 4 life.]=];
Flavor=[=["The Immortal Sun will bring us true eternal life to replace the everlasting shadow of undeath."]=];
CardNumber="XLN16";
Power="3";
Toughness="2";
MultiverseID=435167;
};

{Name="Island";
SetCode="RIX";
Type="Basic Land — Island";
SuperTypes={"Basic"};
Types={"Land"};
SubTypes={"Island"};
Rarity="Basic Land";
CardNumber="RIX193";
MultiverseID=439857;
};

{Name="Itlimoc, Cradle of the Sun";
SetCode="XLN";
cmc=3;
Type="Legendary Land";
SuperTypes={"Legendary"};
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Growing Rites of Itlimoc.)<br/>
{{Tap}}: Add {{G}} to your mana pool.<br/>
{{Tap}}: Add {{G}} to your mana pool for each creature you control.]=];
Flavor=[=[Before the Sun Empire was born, humans and merfolk joined their magic to invoke a blessing of fertility on the land.]=];
CardNumber="XLN191b";
MultiverseID=435347;
};

{Name="Ixalan's Binding";
SetCode="XLN";
Manacost="{{3}}{{W}}";
cmc=4;
Colors={"White"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Uncommon";
Text=[=[When Ixalan's Binding enters the battlefield, exile target nonland permanent an opponent controls until Ixalan's Binding leaves the battlefield.<br/>
Your opponents can't cast spells with the same name as the exiled card.]=];
Flavor=[=[Jace awoke to the certainty that he was lost.]=];
CardNumber="XLN17";
MultiverseID=435168;
Rulings={
	{Date="2017-09-29";Text=[=[If Ixalan’s Binding leaves the battlefield before its triggered ability resolves, the target permanent won’t be exiled.]=];};
	{Date="2017-09-29";Text=[=[Auras attached to the exiled permanent will be put into their owners’ graveyards. Any Equipment will become unattached and remain on the battlefield. Any counters on the exiled permanent will cease to exist.]=];};
	{Date="2017-09-29";Text=[=[If a token is exiled this way, it will cease to exist and won’t return to the battlefield.]=];};
	{Date="2017-09-29";Text=[=[The exiled card returns to the battlefield immediately after Ixalan’s Binding leaves the battlefield. Nothing happens between the two events, including state-based actions.]=];};
	{Date="2017-09-29";Text=[=[If the exiled card has a different name in exile than it did on the battlefield, Ixalan’s Binding stops players from casting spells with the name of that card as it exists in exile.]=];};
	{Date="2017-09-29";Text=[=[If the exiled card is a land card that’s become a nonland permanent, Ixalan’s Binding won’t stop players from playing lands with that name.]=];};
	{Date="2017-09-29";Text=[=[If there is no exiled card (perhaps because the exiled permanent was a token or was a commander that moved to the command zone in the Commander variant), Ixalan’s Binding won’t stop players from casting spells.]=];};
	{Date="2017-09-29";Text=[=[In a multiplayer game, if Ixalan’s Binding’s owner leaves the game and another player owns the exiled card, the exiled card will return to the battlefield under its owner’s control. Because the one-shot effect that returns the card isn’t an ability that goes on the stack, it won’t cease to exist along with the leaving player’s spells and abilities on the stack.]=];};
	{Date="2018-01-19";Text=[=[There are many important moments in the story, but the most crucial—called “story spotlights”—are shown on cards. These cards have the Planeswalker symbol in their text box; this symbol has no effect on gameplay. You can read more about these events in the official Magic fiction at http://www.mtgstory.com.]=];};
};
};

{Name="Ixalli's Diviner";
SetCode="XLN";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Creature — Human Druid";
Types={"Creature"};
SubTypes={"Human";"Druid";};
Rarity="Common";
Text=[=[When Ixalli's Diviner enters the battlefield, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
CardNumber="XLN192";
Power="0";
Toughness="3";
MultiverseID=435348;
Rulings={
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Ixalli's Keeper";
SetCode="XLN";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Creature — Human Shaman";
Types={"Creature"};
SubTypes={"Human";"Shaman";};
Rarity="Common";
Text=[=[{{7}}{{G}}, {{Tap}}, Sacrifice Ixalli's Keeper: Target creature gets +5/+5 and gains trample until end of turn.]=];
Flavor=[=[The people of the Sun Empire worship the sun in three aspects. Ixalli is the Verdant Sun, who fosters growth in all things.]=];
CardNumber="XLN193";
Power="2";
Toughness="2";
MultiverseID=435349;
};

{Name="Jace, Cunning Castaway";
SetCode="XLN";
Manacost="{{1}}{{U}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Legendary Planeswalker — Jace";
SuperTypes={"Legendary"};
Types={"Planeswalker"};
SubTypes={"Jace"};
Rarity="Mythic Rare";
Text=[=[+1: Whenever one or more creatures you control deal combat damage to a player this turn, draw a card, then discard a card.<br/>
−2: Create a 2/2 blue Illusion creature token with "When this creature becomes the target of a spell, sacrifice it."<br/>
−5: Create two tokens that are copies of Jace, Cunning Castaway, except they're not legendary.]=];
CardNumber="XLN60";
Loyalty="3";
MultiverseID=435212;
Rulings={
	{Date="2017-09-29";Text=[=[The delayed triggered ability created by Jace’s first ability can trigger more than once in a turn if creatures you control deal combat damage at different times in a turn (most likely because one or more has first strike) or if creatures you control deal combat damage to more than one player at once.]=];};
	{Date="2017-09-29";Text=[=[If a token created by Jace’s second ability becomes the target of a spell, its ability triggers and goes on the stack on top of that spell. The ability will resolve first (causing the token to be sacrificed). Unless the spell has another target, it will then be countered when it tries to resolve for having no legal targets.]=];};
	{Date="2017-09-29";Text=[=[The tokens from Jace’s last ability copy exactly what is printed on Jace and nothing else. They don’t copy how many counters are on him or Auras attached to him, or any non-copy effects that have changed his color or types, and so on. They’ll each enter the battlefield with three loyalty counters. You can activate one loyalty ability of each of the tokens this turn.]=];};
	{Date="2017-09-29";Text=[=[The tokens created by Jace’s last ability don’t have the legendary supertype. If another object becomes a copy of the token, that copy also won’t be legendary.]=];};
	{Date="2017-09-29";Text=[=[You can control one legendary Jace, Cunning Castaway in addition to any number of nonlegendary copies of Jace, Cunning Castaway.]=];};
};
};

{Name="Jace, Ingenious Mind-Mage";
SetCode="XLN";
Manacost="{{4}}{{U}}{{U}}";
cmc=6;
Colors={"Blue"};
Type="Legendary Planeswalker — Jace";
SuperTypes={"Legendary"};
Types={"Planeswalker"};
SubTypes={"Jace"};
Rarity="Mythic Rare";
Text=[=[+1: Draw a card.<br/>
+1: Untap all creatures you control.<br/>
−9: Gain control of up to three target creatures.]=];
CardNumber="XLN280";
Loyalty="5";
MultiverseID=435441;
Rulings={
	{Date="2017-09-29";Text=[=[The control-change effect of Jace’s last ability lasts indefinitely. It doesn’t wear off during the cleanup step or when you lose control of Jace.]=];};
	{Date="2017-09-29";Text=[=[In a multiplayer game, if a player leaves the game, all cards that player owns leave as well, and any effects that give the player control of permanents immediately end.]=];};
};
};

{Name="Jace's Sentinel";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Uncommon";
Text=[=[As long as you control a Jace planeswalker, Jace's Sentinel gets +1/+0 and can't be blocked.]=];
Flavor=[=["We drove the Sun Empire out of the forest long ago, and we will not let them return."]=];
CardNumber="XLN283";
Power="1";
Toughness="3";
MultiverseID=435444;
};

{Name="Jade Bearer";
SetCode="RIX";
Manacost="{{G}}";
cmc=1;
Colors={"Green"};
Type="Creature — Merfolk Shaman";
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Common";
Text=[=[When Jade Bearer enters the battlefield, put a +1/+1 counter on another target Merfolk you control.]=];
Flavor=[=["Sisora wore this, who defeated the tyrant of Azcanta, and before her Natena of Vuhana's band. May it bring you their strength."]=];
CardNumber="RIX134";
Power="1";
Toughness="1";
MultiverseID=439791;
};

{Name="Jade Guardian";
SetCode="XLN";
Manacost="{{3}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Creature — Merfolk Shaman";
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Common";
Text=[=[Hexproof (This creature can't be the target of spells or abilities your opponents control.)<br/>
When Jade Guardian enters the battlefield, put a +1/+1 counter on target Merfolk you control.]=];
Flavor=[=[The River Heralds believe that jade gives weight to their magic.]=];
CardNumber="XLN194";
Power="2";
Toughness="2";
MultiverseID=435350;
Rulings={
	{Date="2017-09-29";Text=[=[Jade Guardian can be the target of its own ability.]=];};
};
};

{Name="Jadecraft Artisan";
SetCode="RIX";
Manacost="{{3}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Creature — Merfolk Shaman";
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Common";
Text=[=[When Jadecraft Artisan enters the battlefield, target creature gets +2/+2 until end of turn.]=];
Flavor=[=["A blade is not fully forged until it is given."]=];
CardNumber="RIX135";
Power="3";
Toughness="3";
MultiverseID=439792;
};

{Name="Jadelight Ranger";
SetCode="RIX";
Manacost="{{1}}{{G}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Merfolk Scout";
Types={"Creature"};
SubTypes={"Merfolk";"Scout";};
Rarity="Rare";
Text=[=[When Jadelight Ranger enters the battlefield, it explores, then it explores again. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard. Then repeat this process.)]=];
CardNumber="RIX136";
Power="2";
Toughness="1";
MultiverseID=439793;
Rulings={
	{Date="2018-01-19";Text=[=[If you reveal a nonland card the first time Jadelight Ranger explores and leave it on top of your library, you’ll reveal the same card the second time it explores. If you don’t pretend to be surprised, you’ll hurt Jadelight Ranger’s feelings.]=];};
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Journey to Eternity";
SetCode="RIX";
Manacost="{{1}}{{B}}{{G}}";
cmc=3;
Colors={"Black";"Green";};
Type="Legendary Enchantment — Aura";
SuperTypes={"Legendary"};
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Rare";
Text=[=[Enchant creature you control<br/>
When enchanted creature dies, return it to the battlefield under your control, then return Journey to Eternity to the battlefield transformed under your control.]=];
Flavor=[=[Every journey has its inevitable end . . .]=];
CardNumber="RIX160a";
MultiverseID=439818;
Rulings={
	{Date="2018-01-19";Text=[=[If another player gains control of the enchanted creature, Journey to Eternity will be put into your graveyard.]=];};
	{Date="2018-01-19";Text=[=[If Journey to Eternity and the enchanted creature are both put into graveyards at the same time, Journey to Eternity’s ability will return both to the battlefield.]=];};
	{Date="2018-01-19";Text=[=[If Journey to Eternity enchants a creature you control but don’t own, the creature will return to the battlefield under your control from its owner’s graveyard when it dies. In a multiplayer game, if a player leaves the game, all cards that player owns leave as well. If you leave the game, any creatures you control from Journey to Eternity’s effect are exiled.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Jungle Creeper";
SetCode="RIX";
Manacost="{{1}}{{B}}{{G}}";
cmc=3;
Colors={"Black";"Green";};
Type="Creature — Elemental";
Types={"Creature"};
SubTypes={"Elemental"};
Rarity="Uncommon";
Text=[=[{{3}}{{B}}{{G}}: Return Jungle Creeper from your graveyard to your hand.]=];
Flavor=[=["You cannot kill it, not for long. It ripens where the ground is soaked with the blood of the slaughtered."<br/>
—Atiuru, priest of the Verdant Sun]=];
CardNumber="RIX161";
Power="3";
Toughness="3";
MultiverseID=439820;
};

{Name="Jungle Delver";
SetCode="XLN";
Manacost="{{G}}";
cmc=1;
Colors={"Green"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Common";
Text=[=[{{3}}{{G}}: Put a +1/+1 counter on Jungle Delver.]=];
Flavor=[=["There is no power too great to be used in the defense of our ancestral lands."]=];
CardNumber="XLN195";
Power="1";
Toughness="1";
MultiverseID=435351;
};

{Name="Jungleborn Pioneer";
SetCode="RIX";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Merfolk Scout";
Types={"Creature"};
SubTypes={"Merfolk";"Scout";};
Rarity="Common";
Text=[=[When Jungleborn Pioneer enters the battlefield, create a 1/1 blue Merfolk creature token with hexproof. (It can't be the target of spells or abilities your opponents control.)]=];
Flavor=[=["We fought so long to hide this place. Let us be first to learn its wonders!"]=];
CardNumber="RIX137";
Power="2";
Toughness="2";
MultiverseID=439794;
};

{Name="Kinjalli's Caller";
SetCode="XLN";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Creature — Human Cleric";
Types={"Creature"};
SubTypes={"Human";"Cleric";};
Rarity="Common";
Text=[=[Dinosaur spells you cast cost {{1}} less to cast.]=];
Flavor=[=[The people of the Sun Empire worship the sun in three aspects. Kinjalli is the Wakening Sun, who created humans from clay and baked them in the sun's warmth.]=];
CardNumber="XLN18";
Power="0";
Toughness="3";
MultiverseID=435169;
Rulings={
	{Date="2017-09-29";Text=[=[To determine the total cost of a Dinosaur spell, start with the mana cost or alternative cost you’re paying, add any cost increases, then apply any cost reductions. The converted mana cost of the creature remains unchanged, no matter what the total cost to cast it was.]=];};
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Kinjalli's Sunwing";
SetCode="XLN";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Rare";
Text=[=[Flying<br/>
Creatures your opponents control enter the battlefield tapped.]=];
Flavor=[=["There are moments when I feel I could fly like the sunwing. Far away I would soar, but always a golden gale pushes me back."<br/>
—Huatli]=];
CardNumber="XLN19";
Power="2";
Toughness="3";
MultiverseID=435170;
Rulings={
	{Date="2017-09-29";Text=[=[If a creature an opponent controls enters the battlefield at the same time that Kinjalli’s Sunwing enters the battlefield under your control, Kinjalli’s Sunwing’s effect doesn’t apply to your opponent’s creature.]=];};
};
};

{Name="Kitesail Corsair";
SetCode="RIX";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[Kitesail Corsair has flying as long as it's attacking.]=];
Flavor=[=["Why perch in the crow's nest when I can fly like the crows?"]=];
CardNumber="RIX41";
Power="2";
Toughness="1";
MultiverseID=439698;
Rulings={
	{Date="2018-01-19";Text=[=[Kitesail Corsair has flying immediately after it attacks. This means that combat restrictions on creatures with flying (such as that of Sandwurm Convergence) don’t apply, but abilities that trigger on creatures with flying attacking (such as that of Windreader Sphinx) do trigger.]=];};
	{Date="2018-01-19";Text=[=[To determine the total cost of a Dinosaur spell, start with the mana cost or alternative cost you’re paying, add any cost increases, then apply any cost reductions. The converted mana cost of the creature remains unchanged, no matter what the total cost to cast it was.]=];};
};
};

{Name="Kitesail Freebooter";
SetCode="XLN";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[Flying<br/>
When Kitesail Freebooter enters the battlefield, target opponent reveals his or her hand. You choose a noncreature, nonland card from it. Exile that card until Kitesail Freebooter leaves the battlefield.]=];
CardNumber="XLN110";
Power="1";
Toughness="2";
MultiverseID=435264;
Rulings={
	{Date="2017-09-29";Text=[=[If Kitesail Freebooter leaves the battlefield before its enters-the-battlefield ability resolves, the opponent will reveal his or her hand, but no card will be exiled.]=];};
	{Date="2017-09-29";Text=[=[The exiled card returns to its owner’s hand immediately after Kitesail Freebooter leaves the battlefield. Nothing happens between the two events, including state-based actions.]=];};
	{Date="2017-09-29";Text=[=[In a multiplayer game, if Kitesail Freebooter’s owner leaves the game, the exiled card will return to its owner’s hand. Because the one-shot effect that returns the card isn’t an ability that goes on the stack, it won’t cease to exist along with the leaving player’s spells and abilities on the stack.]=];};
};
};

{Name="Knight of the Stampede";
SetCode="RIX";
Manacost="{{3}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Creature — Human Knight";
Types={"Creature"};
SubTypes={"Human";"Knight";};
Rarity="Common";
Text=[=[Dinosaur spells you cast cost {{2}} less to cast.]=];
Flavor=[=["My whisper becomes a thousand roars."]=];
CardNumber="RIX138";
Power="2";
Toughness="4";
MultiverseID=439795;
Rulings={
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Kopala, Warden of Waves";
SetCode="XLN";
Manacost="{{1}}{{U}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Legendary Creature — Merfolk Wizard";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Merfolk";"Wizard";};
Rarity="Rare";
Text=[=[Spells your opponents cast that target a Merfolk you control cost {{2}} more to cast.<br/>
Abilities your opponents activate that target a Merfolk you control cost {{2}} more to activate.]=];
Flavor=[=["I know these waters better than you know yourselves."]=];
CardNumber="XLN61";
Power="2";
Toughness="2";
MultiverseID=435213;
Rulings={
	{Date="2017-09-29";Text=[=[To determine the total cost of an opponent’s spell that targets a Merfolk you control, start with the mana cost or alternative cost that player is paying, add any cost increases, then apply any cost reductions. The converted mana cost of the spell remains unchanged, no matter what the total cost to cast it was.]=];};
	{Date="2017-09-29";Text=[=[Activated abilities contain a colon. They’re generally written “[Cost]: [Effect].”]=];};
	{Date="2017-09-29";Text=[=[Kopala’s abilities won’t affect triggered abilities (starting with “when,” “whenever,” or “at”) that target a Merfolk you control.]=];};
	{Date="2017-09-29";Text=[=[Spells and abilities that target more than one Merfolk you control cost only {2} more to cast or activate.]=];};
};
};

{Name="Kumena, Tyrant of Orazca";
SetCode="RIX";
Manacost="{{1}}{{G}}{{U}}";
cmc=3;
Colors={"Blue";"Green";};
Type="Legendary Creature — Merfolk Shaman";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Mythic Rare";
Text=[=[Tap another untapped Merfolk you control: Kumena, Tyrant of Orazca can't be blocked this turn.<br/>
Tap three untapped Merfolk you control: Draw a card.<br/>
Tap five untapped Merfolk you control: Put a +1/+1 counter on each Merfolk you control.]=];
CardNumber="RIX162";
Power="2";
Toughness="4";
MultiverseID=439821;
Rulings={
	{Date="2018-01-19";Text=[=[To activate Kumena’s abilities, you may tap any untapped Merfolk you control, including one you haven’t controlled continuously since the beginning of your most recent turn. (Note that tapping the creature doesn’t use {Tap} [the tap symbol].) For Kumena’s second and third abilities, this includes Kumena itself.]=];};
	{Date="2018-01-19";Text=[=[Activating Kumena’s first ability after it has become blocked won’t cause it to become unblocked.]=];};
};
};

{Name="Kumena's Awakening";
SetCode="RIX";
Manacost="{{2}}{{U}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Rare";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
At the beginning of your upkeep, each player draws a card. If you have the city's blessing, instead only you draw a card.]=];
CardNumber="RIX42";
MultiverseID=439699;
Rulings={
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards have triggered abilities that check if you have the city’s blessing, but don’t use an intervening “if” clause. These abilities trigger regardless of whether you have the city’s blessing and check whether you do only as they resolve.]=];};
};
};

{Name="Kumena's Speaker";
SetCode="XLN";
Manacost="{{G}}";
cmc=1;
Colors={"Green"};
Type="Creature — Merfolk Shaman";
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Uncommon";
Text=[=[Kumena's Speaker gets +1/+1 as long as you control another Merfolk or an Island.]=];
Flavor=[=["The same power that drives the river ever onward flows through the roots and branches—to me."]=];
CardNumber="XLN196";
Power="1";
Toughness="1";
MultiverseID=435352;
Rulings={
	{Date="2017-09-29";Text=[=[Kumena’s Speaker gets only +1/+1 from its ability, no matter how many Merfolk and Islands you control.]=];};
	{Date="2017-09-29";Text=[=[Most nonbasic lands that produce blue mana aren’t Islands. For example, Glacial Fortress isn’t an Island. Some nonbasic lands (such as Irrigated Farmland from the Amonkhet set) do have basic land types printed on the type line and may be Islands.]=];};
	{Date="2017-09-29";Text=[=[Because damage remains marked on a creature until it’s removed as the turn ends, the damage Kumena’s Speaker takes during combat may become lethal if you no longer control a Merfolk or Island later in the turn.]=];};
};
};

{Name="Legion Conquistador";
SetCode="RIX";
Allsets={"RIX", "XLN"};
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Common";
Rarities={"Common", "Rare"};
Text=[=[whoop When Legion Conquistador enters the battlefield, you may search your library for any number of cards named Legion Conquistador, reveal them, put them into your hand, then shuffle your library.]=];
Flavor=[=[The Legion of Dusk sailed from Torrezon in search of glory, riches, and the Immortal Sun.]=];
CardNumber="RIX11";
Power="2";
Toughness="2";
MultiverseID=439668;
Sets={
	{Set="XLN"; Rarity="Common"; Flavor=[=[The Legion of Dusk sailed from Torrezon in search of glory, riches, and the Immortal Sun.]=];};
};
};

{Name="Legion Lieutenant";
SetCode="RIX";
Manacost="{{W}}{{B}}";
cmc=2;
Colors={"White";"Black";};
Type="Creature — Vampire Knight";
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Uncommon";
Text=[=[Other Vampires you control get +1/+1.]=];
Flavor=[=["We long ago abandoned the things that make humans weak: friendship, marriage, family. All that remains is the strength of our devotion."]=];
CardNumber="RIX163";
Power="2";
Toughness="2";
MultiverseID=439822;
Rulings={
	{Date="2018-01-19";Text=[=[Because damage remains marked on a creature until it’s removed as the turn ends, nonlethal damage dealt to another Vampire you control may become lethal if Legion Lieutenant leaves the battlefield during that turn.]=];};
};
};

{Name="Legion's Judgment";
SetCode="XLN";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Destroy target creature with power 4 or greater.]=];
Flavor=[=["My lance was once wielded by Venerable Tarrian. In his name and by his might, I cast you down!"]=];
CardNumber="XLN21";
MultiverseID=435172;
};

{Name="Legion's Landing";
SetCode="XLN";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Legendary Enchantment";
SuperTypes={"Legendary"};
Types={"Enchantment"};
Rarity="Rare";
Text=[=[When Legion's Landing enters the battlefield, create a 1/1 white Vampire creature token with lifelink.<br/>
When you attack with three or more creatures, transform Legion's Landing.]=];
Flavor=[=["I claim this land in the name of the queen."<br/>
—Adrian Adanto of Lujio]=];
CardNumber="XLN22a";
MultiverseID=435173;
Rulings={
	{Date="2017-09-29";Text=[=[Once you’ve attacked with three or more creatures, Legion’s Landing will transform even if some of those creatures leave the battlefield or are removed from combat.]=];};
	{Date="2017-09-29";Text=[=[The last ability of Legion’s Landing only counts creatures that you declare as attacking creatures. Creatures that enter the battlefield attacking won’t count.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Lightning Strike";
SetCode="XLN";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Lightning Strike deals 3 damage to target creature or player.]=];
Flavor=[=["Storm on the horizon, cap'n!"<br/>
—Grick Doobin, last words]=];
CardNumber="XLN149";
MultiverseID=435303;
};

{Name="Lightning-Rig Crew";
SetCode="XLN";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Creature — Goblin Pirate";
Types={"Creature"};
SubTypes={"Goblin";"Pirate";};
Rarity="Uncommon";
Text=[=[{{Tap}}: Lightning-Rig Crew deals 1 damage to each opponent.<br/>
Whenever you cast a Pirate spell, untap Lightning-Rig Crew.]=];
Flavor=[=[A pirate ship in battle is a storm of activity.]=];
CardNumber="XLN150";
Power="0";
Toughness="5";
MultiverseID=435304;
Rulings={
	{Date="2017-09-29";Text=[=[Lightning-Rig Crew’s second ability resolves before the spell that caused it to trigger. The ability will resolve even if that spell is countered.]=];};
	{Date="2017-09-29";Text=[=[In a Two-Headed Giant game, Lightning-Rig Crew’s activated ability causes the opposing team to lose 2 life.]=];};
};
};

{Name="Lookout's Dispersal";
SetCode="XLN";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Lookout's Dispersal costs {{1}} less to cast if you control a Pirate.<br/>
Counter target spell unless its controller pays {{4}}.]=];
Flavor=[=[Her song plucks the strings of the storm, shifting wind and storm into a harmony that will carry her ship to safety.]=];
CardNumber="XLN62";
MultiverseID=435214;
Rulings={
	{Date="2017-09-29";Text=[=[Once you announce that you’re casting Lookout’s Dispersal, no player may take other actions until the spell’s been paid for. Notably, players can’t try to raise the spell’s cost by removing your Pirates.]=];};
};
};

{Name="Looming Altisaur";
SetCode="XLN";
Manacost="{{3}}{{W}}";
cmc=4;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Flavor=[=[Nature can't be tamed, but the Sun Empire believes that humans are made stronger when they test themselves against the wild strength of the dinosaurs.]=];
CardNumber="XLN23";
Power="1";
Toughness="7";
MultiverseID=435175;
};

{Name="Lost Vale";
SetCode="XLN";
cmc=2;
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Dowsing Dagger.)<br/>
{{Tap}}: Add three mana of any one color to your mana pool.]=];
Flavor=[=[The pirates had ventured into the interior for treasure. They found something far greater.]=];
CardNumber="XLN235b";
MultiverseID=435393;
};

{Name="Luminous Bonds";
SetCode="RIX";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Common";
Text=[=[Enchant creature<br/>
Enchanted creature can't attack or block.]=];
Flavor=[=["Your part in this fight is done, vampire. Get used to your thirst."]=];
CardNumber="RIX12";
MultiverseID=439669;
};

{Name="Lurking Chupacabra";
SetCode="XLN";
Manacost="{{3}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Creature — Beast Horror";
Types={"Creature"};
SubTypes={"Beast";"Horror";};
Rarity="Uncommon";
Text=[=[Whenever a creature you control explores, target creature an opponent controls gets -2/-2 until end of turn.]=];
Flavor=[=["Shadow birthed it. The moon gave it eyes, and the jungle gave it teeth. But it was Death that taught it cruelty."<br/>
—Huatli]=];
CardNumber="XLN111";
Power="2";
Toughness="3";
MultiverseID=435265;
Rulings={
	{Date="2017-09-29";Text=[=[You don’t choose a target for Lurking Chupacabra’s ability until after your creature has finished exploring.]=];};
	{Date="2017-09-29";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. Effects that trigger when a creature you control explores, such as that of Lurking Chupacabra, trigger if appropriate.]=];};
};
};

{Name="Majestic Heliopterus";
SetCode="RIX";
Manacost="{{3}}{{W}}";
cmc=4;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Flying<br/>
Whenever Majestic Heliopterus attacks, another target Dinosaur you control gains flying until end of turn.]=];
Flavor=[=["Its rise is like the sun's, a beautiful beginning. Its descent is like the sun's, a frightful ending."<br/>
—Huatli]=];
CardNumber="RIX13";
Power="2";
Toughness="2";
MultiverseID=439670;
};

{Name="Makeshift Munitions";
SetCode="XLN";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Uncommon";
Text=[=[{{1}}, Sacrifice an artifact or creature: Makeshift Munitions deals 1 damage to target creature or player.]=];
Flavor=[=["Grease up a firecannon good and proper with dinosaur-liver oil, and it'll shoot just about anything."]=];
CardNumber="XLN151";
MultiverseID=435305;
Rulings={
	{Date="2017-09-29";Text=[=[You can’t sacrifice the same Treasure to pay both {1} and “sacrifice an artifact or creature.”]=];};
};
};

{Name="Marauding Looter";
SetCode="XLN";
Manacost="{{2}}{{U}}{{R}}";
cmc=4;
Colors={"Blue";"Red";};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[Raid — At the beginning of your end step, if you attacked with a creature this turn, you may draw a card. If you do, discard a card.]=];
Flavor=[=["I'll be taking that."]=];
CardNumber="XLN225";
Power="4";
Toughness="3";
MultiverseID=435381;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
	{Date="2018-01-19";Text=[=[Some raid abilities trigger at the beginning of your end step. These abilities trigger if you attacked with a creature that turn, even if the card with that raid ability wasn’t on the battlefield when you attacked.]=];};
};
};

{Name="March of the Drowned";
SetCode="XLN";
Manacost="{{B}}";
cmc=1;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Choose one —<br/>
• Return target creature card from your graveyard to your hand.<br/>
• Return two target Pirate cards from your graveyard to your hand.]=];
CardNumber="XLN112";
MultiverseID=435266;
Rulings={
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Mark of the Vampire";
SetCode="XLN";
Manacost="{{3}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Common";
Text=[=[Enchant creature<br/>
Enchanted creature gets +2/+2 and has lifelink.]=];
Flavor=[=["Through your sacrifice of self, you become holy. Through your strength, all will be saved."<br/>
—From the Rite of Redemption]=];
CardNumber="XLN113";
MultiverseID=435267;
Rulings={
	{Date="2017-09-29";Text=[=[Multiple instances of lifelink on the same creature are redundant.]=];};
};
};

{Name="Martyr of Dusk";
SetCode="RIX";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Common";
Text=[=[When Martyr of Dusk dies, create a 1/1 white Vampire creature token with lifelink.]=];
Flavor=[=["Should I fall, take up our standard and carry on. The Legion must always prevail."]=];
CardNumber="RIX14";
Power="2";
Toughness="1";
MultiverseID=439671;
};

{Name="Mastermind's Acquisition";
SetCode="RIX";
Manacost="{{2}}{{B}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Rare";
Text=[=[Choose one —<br/>
• Search your library for a card, put it into your hand, then shuffle your library.<br/>
• Choose a card you own from outside the game and put it into your hand.]=];
Flavor=[=[Another piece of a nefarious puzzle.]=];
CardNumber="RIX77";
MultiverseID=439734;
Rulings={
	{Date="2018-01-19";Text=[=[In a casual game, a card you choose from outside the game comes from your personal collection. In a tournament event, a card you choose from outside the game must come from your sideboard. You may look at your sideboard at any time.]=];};
	{Date="2018-01-19";Text=[=[There are many important moments in the story, but the most crucial—called “story spotlights”—are shown on cards. These cards have the Planeswalker symbol in their text box; this symbol has no effect on gameplay. You can read more about these events in the official Magic fiction at http://www.mtgstory.com.]=];};
};
};

{Name="Mausoleum Harpy";
SetCode="RIX";
Manacost="{{4}}{{B}}";
cmc=5;
Colors={"Black"};
Type="Creature — Harpy";
Types={"Creature"};
SubTypes={"Harpy"};
Rarity="Uncommon";
Text=[=[Flying<br/>
Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Whenever another creature you control dies, if you have the city's blessing, put a +1/+1 counter on Mausoleum Harpy.]=];
CardNumber="RIX78";
Power="3";
Toughness="3";
MultiverseID=439735;
Rulings={
	{Date="2018-01-19";Text=[=[If another creature you control is dealt lethal damage at the same time that Mausoleum Harpy is dealt lethal damage, Mausoleum Harpy won’t be saved by the +1/+1 counter that would have been put on it.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards have triggered abilities with an intervening “if” clause that checks whether you have the city’s blessing. These are worded “[Trigger condition], if you have the city’s blessing, [effect].” You must already have the city’s blessing in order for these abilities to trigger; otherwise they do nothing. In other words, there’s no way to have the ability trigger if you don’t have the city’s blessing, even if you intend to get it in response to the triggered ability.]=];};
};
};

{Name="Mavren Fein, Dusk Apostle";
SetCode="XLN";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Legendary Creature — Vampire Cleric";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Vampire";"Cleric";};
Rarity="Rare";
Text=[=[Whenever one or more nontoken Vampires you control attack, create a 1/1 white Vampire creature token with lifelink.]=];
Flavor=[=[In the rapture of his Blood Fast, he destroyed the navigator's tools and steered the ship to shore by faith alone.]=];
CardNumber="XLN24";
Power="2";
Toughness="2";
MultiverseID=435176;
Rulings={
	{Date="2017-09-29";Text=[=[Once you attack with one or more nontoken Vampires, Mavren Fein’s ability will create a Vampire token even if some or all of those Vampires leave the battlefield or are removed from combat.]=];};
};
};

{Name="Merfolk Branchwalker";
SetCode="XLN";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Creature — Merfolk Scout";
Types={"Creature"};
SubTypes={"Merfolk";"Scout";};
Rarity="Uncommon";
Text=[=[When Merfolk Branchwalker enters the battlefield, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
CardNumber="XLN197";
Power="2";
Toughness="1";
MultiverseID=435353;
Rulings={
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Merfolk Mistbinder";
SetCode="RIX";
Manacost="{{G}}{{U}}";
cmc=2;
Colors={"Blue";"Green";};
Type="Creature — Merfolk Shaman";
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Uncommon";
Text=[=[Other Merfolk you control get +1/+1.]=];
Flavor=[=["The mist clothes us when we are bare, hides us when we are alone, and unites us when we are together."<br/>
—Nirit of Pashona's band]=];
CardNumber="RIX164";
Power="2";
Toughness="2";
MultiverseID=439823;
Rulings={
	{Date="2018-01-19";Text=[=[Because damage remains marked on a creature until it’s removed as the turn ends, nonlethal damage dealt to another Merfolk you control may become lethal if Merfolk Mistbinder leaves the battlefield during that turn.]=];};
};
};

{Name="Metzali, Tower of Triumph";
SetCode="RIX";
cmc=2;
Type="Legendary Land";
SuperTypes={"Legendary"};
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Path of Mettle.)<br/>
{{Tap}}: Add one mana of any color to your mana pool.<br/>
{{1}}{{R}}, {{Tap}}: Metzali, Tower of Triumph deals 2 damage to each opponent.<br/>
{{2}}{{W}}, {{Tap}}: Choose a creature at random that attacked this turn. Destroy that creature.]=];
CardNumber="RIX165b";
MultiverseID=439825;
Rulings={
	{Date="2018-01-19";Text=[=[Metzali’s last ability can be activated before blockers are chosen.]=];};
	{Date="2018-01-19";Text=[=[Metzali’s last ability can be activated after combat damage has been dealt. You’ll choose a creature at random that attacked this turn and has survived combat damage.]=];};
	{Date="2018-01-19";Text=[=[A creature with indestructible can be chosen at random. It won’t be destroyed.]=];};
	{Date="2018-01-19";Text=[=[A creature with hexproof can be chosen at random. It will be destroyed.]=];};
	{Date="2018-01-19";Text=[=[A creature that was put onto the battlefield attacking didn’t attack, so it can’t be chosen at random.]=];};
	{Date="2018-01-19";Text=[=[A creature that attacked and was removed from combat (such as by Spires of Orazca) still attacked, so it can be chosen at random.]=];};
	{Date="2018-01-19";Text=[=[Players can’t take actions between choosing the creature at random and destroying it.]=];};
	{Date="2018-01-19";Text=[=[In a Two-Headed Giant game, Metzali’s second ability causes the opposing team to lose 4 life.]=];};
};
};

{Name="Mist-Cloaked Herald";
SetCode="RIX";
Manacost="{{U}}";
cmc=1;
Colors={"Blue"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Common";
Text=[=[Mist-Cloaked Herald can't be blocked.]=];
Flavor=[=[With matchless stealth, the River Heralds fought a running battle against the three enemy forces.]=];
CardNumber="RIX43";
Power="1";
Toughness="1";
MultiverseID=439700;
};

{Name="Moment of Craving";
SetCode="RIX";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Target creature gets -2/-2 until end of turn. You gain 2 life.]=];
Flavor=[=["The time of condemnation is at hand. Dusk washes over the world, and I consign you to eternal darkness!"]=];
CardNumber="RIX79";
MultiverseID=439736;
Rulings={
	{Date="2018-01-19";Text=[=[If the target creature is an illegal target by the time Moment of Craving tries to resolve, the spell is countered. You won’t gain 2 life.]=];};
	{Date="2018-01-19";Text=[=[The target creature will still be on the battlefield when you gain life, even if its toughness has been reduced to 0 or less. Any abilities it has that interact with gaining life do so as appropriate. If any abilities trigger on you gaining life, the creature will be put into its owner’s graveyard after that ability triggers but before it resolves.]=];};
};
};

{Name="Moment of Triumph";
SetCode="RIX";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Target creature gets +2/+2 until end of turn. You gain 2 life.]=];
Flavor=[=["The time of salvation is at hand. Dusk washes over the world, and the Legion will rise immortal!"]=];
CardNumber="RIX15";
MultiverseID=439672;
Rulings={
	{Date="2018-01-19";Text=[=[If the target creature is an illegal target by the time Moment of Triumph tries to resolve, the spell is countered. You won’t gain 2 life.]=];};
};
};

{Name="Mountain";
SetCode="RIX";
Type="Basic Land — Mountain";
SuperTypes={"Basic"};
Types={"Land"};
SubTypes={"Mountain"};
Rarity="Basic Land";
CardNumber="RIX195";
MultiverseID=439859;
};

{Name="Mutiny";
SetCode="RIX";
Manacost="{{R}}";
cmc=1;
Colors={"Red"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Target creature an opponent controls deals damage equal to its power to another target creature that player controls.]=];
Flavor=[=[Pirate captains rarely enjoy a peaceful retirement.]=];
CardNumber="RIX106";
MultiverseID=439763;
Rulings={
	{Date="2018-01-19";Text=[=[If either or both targets are illegal when Mutiny resolves, no creature will deal or be dealt damage.]=];};
};
};

{Name="Naturalize";
SetCode="RIX";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Destroy target artifact or enchantment.]=];
Flavor=[=["Better to let the sword go than to lose the arm with it."<br/>
—Captain Lannery Storm]=];
CardNumber="RIX139";
MultiverseID=439796;
};

{Name="Navigator's Ruin";
SetCode="XLN";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Uncommon";
Text=[=[Raid — At the beginning of your end step, if you attacked with a creature this turn, target opponent puts the top four cards of his or her library into his or her graveyard.]=];
Flavor=[=["You won't be needing this. Or this. Or these . . ."]=];
CardNumber="XLN63";
MultiverseID=435215;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
	{Date="2018-01-19";Text=[=[Some raid abilities trigger at the beginning of your end step. These abilities trigger if you attacked with a creature that turn, even if the card with that raid ability wasn’t on the battlefield when you attacked.]=];};
};
};

{Name="Needletooth Raptor";
SetCode="RIX";
Manacost="{{3}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Enrage — Whenever Needletooth Raptor is dealt damage, it deals 5 damage to target creature an opponent controls.]=];
Flavor=[=[It hatches with its ferocity fully grown.]=];
CardNumber="RIX107";
Power="2";
Toughness="2";
MultiverseID=439764;
Rulings={
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Negate";
SetCode="RIX";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Counter target noncreature spell.]=];
Flavor=[=["As one, nature lifts its voice to tell you this: ‘No.'"]=];
CardNumber="RIX44";
MultiverseID=439701;
Rulings={
	{Date="2009-10-01";Text=[=[A “creature spell” is any spell with the type creature, even if it has other types such as artifact or enchantment. Older cards of type summon are also creature spells.]=];};
};
};

{Name="Nest Robber";
SetCode="XLN";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Haste]=];
Flavor=[=["These sailors on our shores are like the dinosaurs that plunder eggs from nests. They live on the labors of others."<br/>
—Itzama the Crested]=];
CardNumber="XLN152";
Power="2";
Toughness="1";
MultiverseID=435306;
};

{Name="New Horizons";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Common";
Text=[=[Enchant land<br/>
When New Horizons enters the battlefield, put a +1/+1 counter on target creature you control.<br/>
Enchanted land has "{{Tap}}: Add two mana of any one color to your mana pool."]=];
CardNumber="XLN198";
MultiverseID=435354;
Rulings={
	{Date="2017-09-29";Text=[=[You can cast New Horizons even if you control no creatures.]=];};
	{Date="2017-09-29";Text=[=[If the land this Aura would enchant is an illegal target by the time New Horizons resolves, the entire spell is countered. It won’t enter the battlefield, so its ability won’t trigger.]=];};
};
};

{Name="Nezahal, Primal Tide";
SetCode="RIX";
Manacost="{{5}}{{U}}{{U}}";
cmc=7;
Colors={"Blue"};
Type="Legendary Creature — Elder Dinosaur";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Elder";"Dinosaur";};
Rarity="Rare";
Text=[=[Nezahal, Primal Tide can't be countered.<br/>
You have no maximum hand size.<br/>
Whenever an opponent casts a noncreature spell, draw a card.<br/>
Discard three cards: Exile Nezahal. Return it to the battlefield tapped under its owner's control at the beginning of the next end step.]=];
CardNumber="RIX45";
Power="7";
Toughness="7";
MultiverseID=439702;
Rulings={
	{Date="2018-01-19";Text=[=[Your maximum hand size is checked only during the cleanup step on your turn. If Nezahal’s last ability is activated before your turn’s end step, it will return before your next cleanup step and you’ll have no maximum hand size.]=];};
	{Date="2018-01-19";Text=[=[Nezahal’s triggered ability resolves before the noncreature spell that caused it to trigger.]=];};
	{Date="2018-01-19";Text=[=[Players can cast spells and activate abilities after Nezahal’s triggered ability resolves but before the spell that caused it to trigger does. Notably, the card you draw may be able to counter that spell or may be discarded to activate Nezahal’s last ability.]=];};
	{Date="2018-01-19";Text=[=[After Nezahal returns to the battlefield, it will be a new object with no connection to the creature that was exiled. It won’t be in combat or have any additional abilities it may have had when it was exiled. Any +1/+1 counters on it or Auras attached to it are removed, and any Equipment will no longer be attached.]=];};
};
};

{Name="Oathsworn Vampire";
SetCode="RIX";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Vampire Knight";
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Uncommon";
Text=[=[Oathsworn Vampire enters the battlefield tapped.<br/>
You may cast Oathsworn Vampire from your graveyard if you gained life this turn.]=];
Flavor=[=["My conquistadors are never slain, merely laid to rest."<br/>
—Queen Miralda the Pious]=];
CardNumber="RIX80";
Power="2";
Toughness="2";
MultiverseID=439737;
Rulings={
	{Date="2018-01-19";Text=[=[Oathsworn Vampire’s last ability cares only whether you gained life in the turn, even if Oathsworn Vampire wasn’t in your graveyard when that happened. It doesn’t care how much you gained, whether you also lost life, or even whether you lost more life than you gained.]=];};
	{Date="2018-01-19";Text=[=[Casting Oathsworn Vampire from your graveyard follows the normal rules for casting that card. You must pay its costs, and you must follow all applicable timing rules. ]=];};
};
};

{Name="Old-Growth Dryads";
SetCode="XLN";
Manacost="{{G}}";
cmc=1;
Colors={"Green"};
Type="Creature — Dryad";
Types={"Creature"};
SubTypes={"Dryad"};
Rarity="Rare";
Text=[=[When Old-Growth Dryads enters the battlefield, each opponent may search his or her library for a basic land card, put it onto the battlefield tapped, then shuffle his or her library.]=];
Flavor=[=["The jungle was here before any city. It will be here after the last city falls."]=];
CardNumber="XLN199";
Power="3";
Toughness="3";
MultiverseID=435355;
};

{Name="One With the Wind";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Common";
Text=[=[Enchant creature<br/>
Enchanted creature gets +2/+2 and has flying.]=];
Flavor=[=["River and sea, jungle and sky. Water flows freely between the two halves of the world. We are creatures of the water."<br/>
—Shaper Tuvasa]=];
CardNumber="XLN64";
MultiverseID=435216;
};

{Name="Opt";
SetCode="XLN";
Manacost="{{U}}";
cmc=1;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Scry 1. (Look at the top card of your library. You may put that card on the bottom of your library.)<br/>
Draw a card.]=];
Flavor=[=["It's easy to anticipate Captain Storm's orders: take the more dangerous route."]=];
CardNumber="XLN65";
MultiverseID=435217;
};

{Name="Orazca Frillback";
SetCode="RIX";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Flavor=[=[The frillbacks of Orazca soak up the sun on their tall spinal fins. They look slow and sleepy—until they catch the scent of prey.]=];
CardNumber="RIX140";
Power="4";
Toughness="2";
MultiverseID=439797;
};

{Name="Orazca Raptor";
SetCode="RIX";
Manacost="{{2}}{{R}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Flavor=[=["If you come across a raptor in the city, stay perfectly still. At least then you'll be well rested when you die."<br/>
—Captain Brandis Thorn]=];
CardNumber="RIX108";
Power="3";
Toughness="4";
MultiverseID=439765;
};

{Name="Orazca Relic";
SetCode="RIX";
Manacost="{{3}}";
cmc=3;
Type="Artifact";
Types={"Artifact"};
Rarity="Common";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
{{Tap}}: Add {{C}} to your mana pool.<br/>
{{Tap}}, Sacrifice Orazca Relic: You gain 3 life and draw a card. Activate this ability only if you have the city's blessing.]=];
CardNumber="RIX181";
MultiverseID=439845;
Rulings={
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
};
};

{Name="Otepec Huntmaster";
SetCode="XLN";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Human Shaman";
Types={"Creature"};
SubTypes={"Human";"Shaman";};
Rarity="Uncommon";
Text=[=[Dinosaur spells you cast cost {{1}} less to cast.<br/>
{{Tap}}: Target Dinosaur gains haste until end of turn.]=];
Flavor=[=["Forward! Let the Burning Sun's light guide you to deserving prey!"]=];
CardNumber="XLN153";
Power="1";
Toughness="2";
MultiverseID=435307;
Rulings={
	{Date="2017-09-29";Text=[=[To determine the total cost of a Dinosaur spell, start with the mana cost or alternative cost you’re paying, add any cost increases, then apply any cost reductions. The converted mana cost of the creature remains unchanged, no matter what the total cost to cast it was.]=];};
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Overflowing Insight";
SetCode="XLN";
Manacost="{{4}}{{U}}{{U}}{{U}}";
cmc=7;
Colors={"Blue"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Mythic Rare";
Text=[=[Target player draws seven cards.]=];
Flavor=[=[The truth came to Kumena like the Great River's torrent: the only way to keep his enemies away from the hidden city was to claim its power for himself.]=];
CardNumber="XLN66";
MultiverseID=435218;
};

{Name="Overgrown Armasaur";
SetCode="RIX";
Manacost="{{3}}{{G}}{{G}}";
cmc=5;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Enrage — Whenever Overgrown Armasaur is dealt damage, create a 1/1 green Saproling creature token.]=];
Flavor=[=[It embodies the riotous growth of the jungle, where creatures crowd upon creatures, where roots sprawl and vines swarm.]=];
CardNumber="RIX141";
Power="4";
Toughness="4";
MultiverseID=439798;
Rulings={
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Paladin of Atonement";
SetCode="RIX";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Creature — Vampire Knight";
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Rare";
Text=[=[At the beginning of each upkeep, if you lost life last turn, put a +1/+1 counter on Paladin of Atonement.<br/>
When Paladin of Atonement dies, you gain life equal to its toughness.]=];
Flavor=[=[For every wound there is a blessing; for every death, a reckoning.]=];
CardNumber="RIX16";
Power="1";
Toughness="1";
MultiverseID=439673;
Rulings={
	{Date="2018-01-19";Text=[=[Paladin of Atonement’s first ability cares only whether you lost life last turn, even if Paladin of Atonement wasn’t on the battlefield when that happened. It doesn’t care how much you lost, whether you also gained life, or even whether you gained more life than you lost.]=];};
	{Date="2018-01-19";Text=[=[To determine how much life you gain for the last ability, use Paladin of Atonement’s toughness as it last existed on the battlefield. If its toughness was less than 0, you won’t gain life. (You also won’t lose life.).]=];};
};
};

{Name="Paladin of the Bloodstained";
SetCode="XLN";
Manacost="{{3}}{{W}}";
cmc=4;
Colors={"White"};
Type="Creature — Vampire Knight";
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Common";
Text=[=[When Paladin of the Bloodstained enters the battlefield, create a 1/1 white Vampire creature token with lifelink.]=];
Flavor=[=[Closely linked to the Church of Dusk, the paladins of the Bloodstained order are devout to the point of fanaticism.]=];
CardNumber="XLN25";
Power="3";
Toughness="2";
MultiverseID=435177;
};

{Name="Path of Discovery";
SetCode="RIX";
Manacost="{{3}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Rare";
Text=[=[Whenever a creature enters the battlefield under your control, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on the creature, then put the card back or put it into your graveyard.)]=];
CardNumber="RIX142";
MultiverseID=439799;
Rulings={
	{Date="2018-01-19";Text=[=[Path of Discovery’s triggered ability triggers along with any other abilities that say that the creature explores when it enters the battlefield, including abilities that come from the creature itself or from multiples of Path of Discovery. You may take actions between each resolving ability’s exploration.]=];};
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Path of Mettle";
SetCode="RIX";
Manacost="{{R}}{{W}}";
cmc=2;
Colors={"White";"Red";};
Type="Legendary Enchantment";
SuperTypes={"Legendary"};
Types={"Enchantment"};
Rarity="Rare";
Text=[=[When Path of Mettle enters the battlefield, it deals 1 damage to each creature that doesn't have first strike, double strike, vigilance, or haste.<br/>
Whenever you attack with at least two creatures that have first strike, double strike, vigilance, and/or haste, transform Path of Mettle.]=];
CardNumber="RIX165a";
MultiverseID=439824;
Rulings={
	{Date="2018-01-19";Text=[=[Path of Mettle’s first ability deals 1 damage to each creature that doesn’t have any of the four listed abilities. It doesn’t deal 1 damage to each creature for each ability that creature doesn’t have.]=];};
	{Date="2018-01-19";Text=[=[For Path of Mettle’s last ability to trigger, any two attacking creatures you control need to each have any one of the four listed abilities. They don’t need to share one of those abilities. For example, attacking with Sun Sentinel (a creature with vigilance) and Fanatical Firebrand (a creature with haste) will cause Path of Mettle’s ability to trigger, as will attacking with two Sun Sentinels.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Perilous Voyage";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Return target nonland permanent you don't control to its owner's hand. If its converted mana cost was 2 or less, scry 2.]=];
Flavor=[=[For the first time in her life, Vraska tried to prevent death.]=];
CardNumber="XLN67";
MultiverseID=435219;
Rulings={
	{Date="2017-09-29";Text=[=[If the target permanent is an illegal target by the time Perilous Voyage resolves, the entire spell is countered. You won’t scry.]=];};
	{Date="2017-09-29";Text=[=[Use the permanent’s converted mana cost as it existed on the battlefield to determine whether you scry.]=];};
	{Date="2017-09-29";Text=[=[If a permanent has {X} in its mana cost, X is considered to be 0.]=];};
	{Date="2018-01-19";Text=[=[There are many important moments in the story, but the most crucial—called “story spotlights”—are shown on cards. These cards have the Planeswalker symbol in their text box; this symbol has no effect on gameplay. You can read more about these events in the official Magic fiction at http://www.mtgstory.com.]=];};
};
};

{Name="Pillar of Origins";
SetCode="XLN";
Manacost="{{2}}";
cmc=2;
Type="Artifact";
Types={"Artifact"};
Rarity="Uncommon";
Text=[=[As Pillar of Origins enters the battlefield, choose a creature type.<br/>
{{Tap}}: Add one mana of any color to your mana pool. Spend this mana only to cast a creature spell of the chosen type.]=];
CardNumber="XLN241";
MultiverseID=435399;
Rulings={
	{Date="2018-01-19";Text=[=[To choose a creature type, you must choose an existing creature type, such as Vampire or Knight. You can’t choose multiple creature types, such as “Vampire Knight.” Card types such as artifact can’t be chosen, nor can subtypes that aren’t creature types, such as Jace, Vehicle, or Treasure.]=];};
};
};

{Name="Pious Interdiction";
SetCode="XLN";
Manacost="{{3}}{{W}}";
cmc=4;
Colors={"White"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Common";
Text=[=[Enchant creature<br/>
When Pious Interdiction enters the battlefield, you gain 2 life.<br/>
Enchanted creature can't attack or block.]=];
Flavor=[=["Ours is the true and righteous path. You will bow before our might."]=];
CardNumber="XLN26";
MultiverseID=435178;
Rulings={
	{Date="2017-09-29";Text=[=[If the creature this Aura would enchant is an illegal target by the time Pious Interdiction resolves, the entire spell is countered. It won’t enter the battlefield, so its ability won’t trigger.]=];};
};
};

{Name="Pirate's Cutlass";
SetCode="XLN";
Manacost="{{3}}";
cmc=3;
Type="Artifact — Equipment";
Types={"Artifact"};
SubTypes={"Equipment"};
Rarity="Common";
Text=[=[When Pirate's Cutlass enters the battlefield, attach it to target Pirate you control.<br/>
Equipped creature gets +2/+1.<br/>
Equip {{2}} ({{2}}: Attach to target creature you control. Equip only as a sorcery.)]=];
CardNumber="XLN242";
MultiverseID=435400;
Rulings={
	{Date="2017-09-29";Text=[=[You can cast Pirate’s Cutlass even if you control no Pirates.]=];};
};
};

{Name="Pirate's Pillage";
SetCode="RIX";
Manacost="{{3}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[As an additional cost to cast Pirate's Pillage, discard a card.<br/>
Draw two cards and create two colorless Treasure artifact tokens with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=[Goblins can carry their body weight in loot.]=];
CardNumber="RIX109";
MultiverseID=439766;
};

{Name="Pirate's Prize";
SetCode="XLN";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Draw two cards. Create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=[Nothing warms the heart like plunder.]=];
CardNumber="XLN68";
MultiverseID=435220;
};

{Name="Pitiless Plunderer";
SetCode="RIX";
Manacost="{{3}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[Whenever another creature you control dies, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=["Shame to let good gold go to the grave."]=];
CardNumber="RIX81";
Power="1";
Toughness="4";
MultiverseID=439738;
Rulings={
	{Date="2018-01-19";Text=[=[If another creature you control dies at the same time as Pitiless Plunderer does, you’ll get a Treasure.]=];};
};
};

{Name="Plains";
SetCode="RIX";
Type="Basic Land — Plains";
SuperTypes={"Basic"};
Types={"Land"};
SubTypes={"Plains"};
Rarity="Basic Land";
CardNumber="RIX192";
MultiverseID=439856;
};

{Name="Plummet";
SetCode="RIX";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Destroy target creature with flying.]=];
Flavor=[=["Still, the pterodon chasing the clouds from its skies must bow to the great forest below."<br/>
—Mahuiz, Sun Empire archer]=];
CardNumber="RIX143";
MultiverseID=439800;
};

{Name="Polyraptor";
SetCode="RIX";
Manacost="{{6}}{{G}}{{G}}";
cmc=8;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Mythic Rare";
Text=[=[Enrage — Whenever Polyraptor is dealt damage, create a token that's a copy of Polyraptor.]=];
Flavor=[=[An innumerable pack is concealed in a single reflection.]=];
CardNumber="RIX144";
Power="5";
Toughness="5";
MultiverseID=439801;
Rulings={
	{Date="2018-01-19";Text=[=[The token will have Polyraptor’s ability. It will also be able to create copies of itself.]=];};
	{Date="2018-01-19";Text=[=[The token won’t copy counters or damage marked on Polyraptor, nor will it copy other effects that have changed Polyraptor’s power, toughness, types, color, or so on. Normally, this means the token will simply be a Polyraptor. But if any copy effects have affected that Polyraptor, they’re taken into account.]=];};
	{Date="2018-01-19";Text=[=[If Polyraptor leaves the battlefield before its triggered ability resolves, most likely because it was dealt lethal damage, the token will still enter the battlefield as a copy of Polyraptor, using Polyraptor’s copiable values from when it was last on the battlefield.]=];};
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Pounce";
SetCode="XLN";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Target creature you control fights target creature you don't control. (Each deals damage equal to its power to the other.)]=];
Flavor=[=[The drive to hunt and feed is raw instinct for dinosaurs. The trick is simply to channel it in the right direction.]=];
CardNumber="XLN200";
MultiverseID=435356;
Rulings={
	{Date="2017-09-29";Text=[=[If either or both targets are illegal when Pounce tries to resolve, no creature will deal or be dealt damage.]=];};
};
};

{Name="Pride of Conquerors";
SetCode="RIX";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Creatures you control get +1/+1 until end of turn. If you have the city's blessing, those creatures get +2/+2 until end of turn instead.]=];
CardNumber="RIX17";
MultiverseID=439674;
Rulings={
	{Date="2018-01-19";Text=[=[Pride of Conquerors affects only creatures you control at the time it resolves. Creatures you begin to control later in the turn won’t get a bonus.]=];};
	{Date="2018-01-19";Text=[=[How Pride of Conquerors affects your creatures is determined at the time it resolves. If you don’t get the city’s blessing until later in the turn, your creatures still only get +1/+1.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
};
};

{Name="Priest of the Wakening Sun";
SetCode="XLN";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Creature — Human Cleric";
Types={"Creature"};
SubTypes={"Human";"Cleric";};
Rarity="Rare";
Text=[=[At the beginning of your upkeep, you may reveal a Dinosaur card from your hand. If you do, you gain 2 life.<br/>
{{3}}{{W}}{{W}}, Sacrifice Priest of the Wakening Sun: Search your library for a Dinosaur card, reveal it, put it into your hand, then shuffle your library.]=];
CardNumber="XLN27";
Power="1";
Toughness="1";
MultiverseID=435179;
Rulings={
	{Date="2017-09-29";Text=[=[You don’t choose whether to reveal a Dinosaur card from your hand until the triggered ability of Priest of the Wakening Sun resolves. You may respond to the triggered ability by taking an action to get a Dinosaur card into your hand, such as activating its second ability.]=];};
	{Date="2017-09-29";Text=[=[While resolving Priest of the Wakening Sun’s triggered ability, you can’t reveal multiple Dinosaur cards to gain more life.]=];};
	{Date="2017-09-29";Text=[=[You can reveal the same Dinosaur card for multiple Priests of the Wakening Sun or for the same one over multiple turns.]=];};
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Primal Amulet";
SetCode="XLN";
Manacost="{{4}}";
cmc=4;
Type="Artifact";
Types={"Artifact"};
Rarity="Rare";
Text=[=[Instant and sorcery spells you cast cost {{1}} less to cast.<br/>
Whenever you cast an instant or sorcery spell, put a charge counter on Primal Amulet. Then if there are four or more charge counters on it, you may remove those counters and transform it.]=];
CardNumber="XLN243a";
MultiverseID=435401;
Rulings={
	{Date="2017-09-29";Text=[=[To determine the total cost of a spell, start with the mana cost or alternative cost you’re paying, add any cost increases, then apply any cost reductions. The converted mana cost of the spell remains unchanged, no matter what the total cost to cast it was.]=];};
	{Date="2017-09-29";Text=[=[Effects that reduce the generic mana cost of a spell can’t reduce that spell’s colored mana requirements.]=];};
	{Date="2017-09-29";Text=[=[Primal Amulet’s last ability triggers once you’ve completed casting a spell. Notably, you can’t use Primal Wellspring to pay for the spell that gives Primal Amulet its fourth counter.]=];};
	{Date="2017-09-29";Text=[=[If a fourth charge counter is put on Primal Amulet by something other than the resolution of its ability (as modified by any applicable replacement effects), you won’t be able to remove those counters and transform it yet. You’ll have to wait until you cast an instant or sorcery spell again.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Primal Wellspring";
SetCode="XLN";
cmc=4;
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Primal Amulet.)<br/>
{{Tap}}: Add one mana of any color to your mana pool. When that mana is spent to cast an instant or sorcery spell, copy that spell and you may choose new targets for the copy.]=];
CardNumber="XLN243b";
MultiverseID=435402;
Rulings={
	{Date="2017-09-29";Text=[=[The mana produced by Primal Wellspring can be spent on anything, not just an instant or sorcery spell.]=];};
	{Date="2017-09-29";Text=[=[Any instant or sorcery spell you spend the mana on will be copied, not just one that requires targets.]=];};
	{Date="2017-09-29";Text=[=[The delayed triggered ability from Primal Wellspring’s mana ability will trigger even if Primal Wellspring leaves the battlefield before that mana is spent.]=];};
	{Date="2017-09-29";Text=[=[If more than one mana produced by a Primal Wellspring is spent to cast a single instant or sorcery spell, the delayed triggered ability associated with each mana spent will trigger. That many copies will be created. It doesn’t matter if this mana was produced by one Primal Wellspring or by multiple Primal Wellsprings.]=];};
	{Date="2017-09-29";Text=[=[Primal Wellspring’s delayed triggered ability can copy the spell even if that spell is countered before the ability resolves.]=];};
	{Date="2017-09-29";Text=[=[If a copy is created, you control the copy. That copy is created on the stack, so it’s not “cast.” Abilities that trigger when a player casts a spell won’t trigger. The copy will then resolve like a normal spell, after players get a chance to cast spells and activate abilities.]=];};
	{Date="2017-09-29";Text=[=[The copy will have the same targets as the spell it’s copying unless you choose new ones. You may change any number of the targets, including all of them or none of them. If, for one of the targets, you can’t choose a new legal target, then it remains unchanged (even if the current target is illegal).]=];};
	{Date="2017-09-29";Text=[=[If the copied spell is modal (that is, it says “Choose one —” or the like), the copy will have the same mode. You can’t choose a different one.]=];};
	{Date="2017-09-29";Text=[=[If the copied spell has an X whose value was determined as it was cast, the copy has the same value of X.]=];};
	{Date="2017-09-29";Text=[=[You can’t choose to pay any additional costs for the copy. However, effects based on any additional costs that were paid for the original spell are copied as though those same costs were paid for the copy too. For example, if you sacrifice a 3/3 creature to cast Fling, and you copy it, the copy of Fling will also deal 3 damage to its target.]=];};
};
};

{Name="Profane Procession";
SetCode="RIX";
Manacost="{{1}}{{W}}{{B}}";
cmc=3;
Colors={"White";"Black";};
Type="Legendary Enchantment";
SuperTypes={"Legendary"};
Types={"Enchantment"};
Rarity="Rare";
Text=[=[{{3}}{{W}}{{B}}: Exile target creature. Then if there are three or more cards exiled with Profane Procession, transform it.]=];
Flavor=[=[Vona sought a conqueror. Mavren sought a savior. Both found what they sought . . .]=];
CardNumber="RIX166a";
MultiverseID=439826;
Rulings={
	{Date="2018-01-19";Text=[=[Profane Procession’s ability can exile token creatures. They won’t count towards the number of cards exiled with it.]=];};
	{Date="2018-01-19";Text=[=[If you have enough mana, you can activate Profane Procession’s ability multiple times before any activation resolves. It will be transformed if one activation exiles the third card. Further activations waiting to resolve won’t cause Tomb of the Dusk Rose to transform back into Profane Procession, but they will exile creatures that Tomb of the Dusk Rose can bring back.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Prosperous Pirates";
SetCode="XLN";
Manacost="{{4}}{{U}}";
cmc=5;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[When Prosperous Pirates enters the battlefield, create two colorless Treasure artifact tokens with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=[The floating city of High and Dry hasn't yet sunk under the weight of gold, but it's not for want of trying.]=];
CardNumber="XLN69";
Power="3";
Toughness="4";
MultiverseID=435221;
};

{Name="Protean Raider";
SetCode="RIX";
Manacost="{{1}}{{U}}{{R}}";
cmc=3;
Colors={"Blue";"Red";};
Type="Creature — Shapeshifter Pirate";
Types={"Creature"};
SubTypes={"Shapeshifter";"Pirate";};
Rarity="Rare";
Text=[=[Raid — If you attacked with a creature this turn, you may have Protean Raider enter the battlefield as a copy of any creature on the battlefield.]=];
Flavor=[=[Imitation is the sincerest form of piracy.]=];
CardNumber="RIX167";
Power="2";
Toughness="2";
MultiverseID=439828;
Rulings={
	{Date="2018-01-19";Text=[=[Protean Raider copies exactly what was printed on the original creature (unless that creature is copying something else or is a token; see below). It doesn’t copy whether that creature is tapped or untapped, whether it has any counters on it or Auras attached to it, or any non-copy effects that have changed its power, toughness, types, color, or so on.]=];};
	{Date="2018-01-19";Text=[=[If the chosen creature has {X} in its mana cost, X is considered to be 0.]=];};
	{Date="2018-01-19";Text=[=[If the chosen creature is copying something else (for example, if the chosen creature is another Protean Raider), then Protean Raider enters the battlefield as whatever the chosen creature copied.]=];};
	{Date="2018-01-19";Text=[=[If the chosen creature is a token, Protean Raider copies the original characteristics of that token as stated by the effect that created the token. Protean Raider is not a token in this case.]=];};
	{Date="2018-01-19";Text=[=[Any enters-the-battlefield abilities of the copied creature will trigger when Protean Raider enters the battlefield. Any “as [this creature] enters the battlefield” or “[this creature] enters the battlefield with” abilities of the chosen creature will also work.]=];};
	{Date="2018-01-19";Text=[=[If Protean Raider somehow enters the battlefield at the same time as another creature, Protean Raider can’t become a copy of that creature. You may choose only a creature that’s already on the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Prying Blade";
SetCode="XLN";
Manacost="{{1}}";
cmc=1;
Type="Artifact — Equipment";
Types={"Artifact"};
SubTypes={"Equipment"};
Rarity="Common";
Text=[=[Equipped creature gets +1/+0.<br/>
Whenever equipped creature deals combat damage to a player, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."<br/>
Equip {{2}} ({{2}}: Attach to target creature you control. Equip only as a sorcery.)]=];
CardNumber="XLN244";
MultiverseID=435403;
};

{Name="Pterodon Knight";
SetCode="XLN";
Manacost="{{3}}{{W}}";
cmc=4;
Colors={"White"};
Type="Creature — Human Knight";
Types={"Creature"};
SubTypes={"Human";"Knight";};
Rarity="Common";
Text=[=[Pterodon Knight has flying as long as you control a Dinosaur.]=];
Flavor=[=["To rise like the sun—there is no greater feeling."]=];
CardNumber="XLN28";
Power="3";
Toughness="3";
MultiverseID=435180;
};

{Name="Queen's Agent";
SetCode="XLN";
Manacost="{{5}}{{B}}";
cmc=6;
Colors={"Black"};
Type="Creature — Vampire Scout";
Types={"Creature"};
SubTypes={"Vampire";"Scout";};
Rarity="Common";
Text=[=[Lifelink<br/>
When Queen's Agent enters the battlefield, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
CardNumber="XLN114";
Power="3";
Toughness="3";
MultiverseID=435268;
Rulings={
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Queen's Bay Soldier";
SetCode="XLN";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Common";
Flavor=[=[The soldiers of the Legion of Dusk have come to the colonies at Queen's Bay in search of glory and riches. They are veterans of centuries of warfare, and they thirst for conquest.]=];
CardNumber="XLN115";
Power="2";
Toughness="2";
MultiverseID=435269;
};

{Name="Queen's Commission";
SetCode="XLN";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Create two 1/1 white Vampire creature tokens with lifelink.]=];
Flavor=[=["Let the blood of the impure flow through you. Only the blessings of the golden city will purge its acrid taste from your mouth."<br/>
—High Marshal Arguel]=];
CardNumber="XLN29";
MultiverseID=435181;
};

{Name="Radiant Destiny";
SetCode="RIX";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Rare";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
As Radiant Destiny enters the battlefield, choose a creature type.<br/>
Creatures you control of the chosen type get +1/+1. As long as you have the city's blessing, they also have vigilance.]=];
CardNumber="RIX18";
MultiverseID=439675;
Rulings={
	{Date="2018-01-19";Text=[=[Gaining vigilance any time after the moment you choose to attack with a creature won’t cause that creature to become untapped, and losing vigilance after that time won’t cause it to become tapped.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards get power, toughness, and/or abilities once you have the city’s blessing. If another card has an ability that triggers when creatures with certain characteristics enter the battlefield (such as Mentor of the Meek or Elemental Bond do), use the entering permanent’s characteristics after you have the city’s blessing to determine whether those abilities trigger. This is true even if the entering permanent is your tenth permanent.]=];};
	{Date="2018-01-19";Text=[=[To choose a creature type, you must choose an existing creature type, such as Vampire or Knight. You can’t choose multiple creature types, such as “Vampire Knight.” Card types such as artifact can’t be chosen, nor can subtypes that aren’t creature types, such as Jace, Vehicle, or Treasure.]=];};
};
};

{Name="Raging Regisaur";
SetCode="RIX";
Manacost="{{2}}{{R}}{{G}}";
cmc=4;
Colors={"Red";"Green";};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Whenever Raging Regisaur attacks, it deals 1 damage to target creature or player.]=];
Flavor=[=[Its breath is a gale. Its roar is a volcano. Its anger tears soul from flesh.]=];
CardNumber="RIX168";
Power="4";
Toughness="4";
MultiverseID=439829;
Rulings={
	{Date="2018-01-19";Text=[=[Damage dealt by Raging Regisaur’s triggered ability isn’t combat damage.]=];};
};
};

{Name="Raging Swordtooth";
SetCode="XLN";
Manacost="{{3}}{{R}}{{G}}";
cmc=5;
Colors={"Red";"Green";};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Trample<br/>
When Raging Swordtooth enters the battlefield, it deals 1 damage to each other creature.]=];
Flavor=[=[Carnivorous dinosaurs developed a taste for undead flesh, tracking the vampires by the scent of blood on their breath.]=];
CardNumber="XLN226";
Power="5";
Toughness="5";
MultiverseID=435382;
};

{Name="Raiders' Wake";
SetCode="XLN";
Manacost="{{3}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Uncommon";
Text=[=[Whenever an opponent discards a card, that player loses 2 life.<br/>
Raid — At the beginning of your end step, if you attacked with a creature this turn, target opponent discards a card.]=];
Flavor=[=[One was spared to tell the gruesome tale.]=];
CardNumber="XLN116";
MultiverseID=435270;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
	{Date="2018-01-19";Text=[=[Some raid abilities trigger at the beginning of your end step. These abilities trigger if you attacked with a creature that turn, even if the card with that raid ability wasn’t on the battlefield when you attacked.]=];};
};
};

{Name="Rallying Roar";
SetCode="XLN";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Creatures you control get +1/+1 until end of turn. Untap them.]=];
Flavor=[=["The sun's strength sings in our hearts! I have never been more proud of my home and my people."<br/>
—Huatli]=];
CardNumber="XLN30";
MultiverseID=435182;
Rulings={
	{Date="2017-09-29";Text=[=[Rallying Roar affects only creatures you control at the time it resolves. Creatures you begin to control later in the turn won’t get +1/+1.]=];};
	{Date="2017-09-29";Text=[=[Untapped creatures you control get +1/+1 even though Rallying Roar doesn’t untap them.]=];};
};
};

{Name="Rampaging Ferocidon";
SetCode="XLN";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Rare";
Text=[=[Menace<br/>
Players can't gain life.<br/>
Whenever another creature enters the battlefield, Rampaging Ferocidon deals 1 damage to that creature's controller.]=];
Flavor=[=[All raptors are aggressive, but ferocidons seem to enjoy their prey's pain.]=];
CardNumber="XLN154";
Power="3";
Toughness="3";
MultiverseID=435308;
Rulings={
	{Date="2017-09-29";Text=[=[Spells and abilities that cause players to gain life still resolve while Rampaging Ferocidon is on the battlefield. No player will gain life, but any other effects of that spell or ability will happen.]=];};
	{Date="2017-09-29";Text=[=[If an effect says to set a player’s life total to a number that’s higher than the player’s current life total while Rampaging Ferocidon is on the battlefield, the player’s life total doesn’t change.]=];};
	{Date="2017-09-29";Text=[=[Rampaging Ferocidon’s last ability triggers whenever any player has a creature enter the battlefield, including you.]=];};
	{Date="2017-09-29";Text=[=[If another creature enters the battlefield at the same time as Rampaging Ferocidon, its last ability triggers.]=];};
};
};

{Name="Ranging Raptors";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Enrage — Whenever Ranging Raptors is dealt damage, you may search your library for a basic land card, put it onto the battlefield tapped, then shuffle your library.]=];
Flavor=[=[They cover their territory like a tide of teeth and claws.]=];
CardNumber="XLN201";
Power="2";
Toughness="3";
MultiverseID=435357;
Rulings={
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Raptor Companion";
SetCode="RIX";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Flavor=[=[The abundance of foes in Orazca means the raptors no longer need any orders.]=];
CardNumber="RIX19";
Power="3";
Toughness="1";
MultiverseID=439676;
};

{Name="Raptor Hatchling";
SetCode="XLN";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Enrage — Whenever Raptor Hatchling is dealt damage, create a 3/3 green Dinosaur creature token with trample.]=];
Flavor=[=["Every little hatchling has a parent's claws to guard it."<br/>
—Sun Empire saying]=];
CardNumber="XLN155";
Power="1";
Toughness="1";
MultiverseID=435309;
Rulings={
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Ravenous Chupacabra";
SetCode="RIX";
Manacost="{{2}}{{B}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Creature — Beast Horror";
Types={"Creature"};
SubTypes={"Beast";"Horror";};
Rarity="Uncommon";
Text=[=[When Ravenous Chupacabra enters the battlefield, destroy target creature an opponent controls.]=];
Flavor=[=[Opening Orazca unleashed more horrors than just the Immortal Sun.]=];
CardNumber="RIX82";
Power="2";
Toughness="2";
MultiverseID=439739;
};

{Name="Ravenous Daggertooth";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Enrage — Whenever Ravenous Daggertooth is dealt damage, you gain 2 life.]=];
Flavor=[=[A daggertooth's triumphant roar makes all the sounds of jungle life fall silent.]=];
CardNumber="XLN202";
Power="3";
Toughness="2";
MultiverseID=435358;
Rulings={
	{Date="2017-09-29";Text=[=[If your life total is brought to 0 or less at the same time that Ravenous Daggertooth is dealt damage, you lose the game before its enrage ability resolves.]=];};
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Reaver Ambush";
SetCode="RIX";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Exile target creature with power 3 or less.]=];
Flavor=[=[Onora knew with sudden, grim certainty he would never see the Great River again.]=];
CardNumber="RIX83";
MultiverseID=439740;
};

{Name="Reckless Rage";
SetCode="RIX";
Manacost="{{R}}";
cmc=1;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Reckless Rage deals 4 damage to target creature you don't control and 2 damage to target creature you control.]=];
Flavor=[=["Hard to starboard! Starb— Abandon ship! Abandon ship!"]=];
CardNumber="RIX110";
MultiverseID=439767;
Rulings={
	{Date="2018-01-19";Text=[=[You can’t cast Reckless Rage unless you choose both a creature you control and a creature you don’t control as targets.]=];};
	{Date="2018-01-19";Text=[=[If either target is an illegal target as Reckless Rage resolves, the other will still be dealt damage.]=];};
};
};

{Name="Recover";
SetCode="RIX";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Return target creature card from your graveyard to your hand.<br/>
Draw a card.]=];
Flavor=[=["No more fear of death's oblivion—is this not the greatest treasure of all?"<br/>
—Gurezan, Legion resurrectionist]=];
CardNumber="RIX84";
MultiverseID=439741;
};

{Name="Regisaur Alpha";
SetCode="XLN";
Manacost="{{3}}{{R}}{{G}}";
cmc=5;
Colors={"Red";"Green";};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Rare";
Text=[=[Other Dinosaurs you control have haste.<br/>
When Regisaur Alpha enters the battlefield, create a 3/3 green Dinosaur creature token with trample.]=];
Flavor=[=["Seeing a pack of these monsters hunt together, I'm at a loss to imagine the size of their prey."<br/>
—Adrian Adanto of Lujio]=];
CardNumber="XLN227";
Power="4";
Toughness="4";
MultiverseID=435383;
};

{Name="Rekindling Phoenix";
SetCode="RIX";
Manacost="{{2}}{{R}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Creature — Phoenix";
Types={"Creature"};
SubTypes={"Phoenix"};
Rarity="Mythic Rare";
Text=[=[Flying<br/>
When Rekindling Phoenix dies, create a 0/1 red Elemental creature token with "At the beginning of your upkeep, sacrifice this creature and return target card named Rekindling Phoenix from your graveyard to the battlefield. It gains haste until end of turn."]=];
CardNumber="RIX111";
Power="4";
Toughness="3";
MultiverseID=439768;
Rulings={
	{Date="2018-01-19";Text=[=[If you don’t have a card named Rekindling Phoenix in your graveyard, the Elemental token’s ability is immediately removed from the stack after it triggers and you won’t sacrifice the token. If that target becomes illegal after the ability has triggered but before it resolves, you also won’t sacrifice the Elemental token. In either case, it will trigger again during your next upkeep.]=];};
	{Date="2018-01-19";Text=[=[If another card copies Rekindling Phoenix (such as Protean Raider may), the Elemental token’s triggered ability will look for a card named Rekindling Phoenix, not one with the other card’s name. This is true even if the card copying Rekindling Phoenix keeps its name while it’s copying Rekindling Phoenix (such as Lazav, Dimir Mastermind does).]=];};
};
};

{Name="Release to the Wind";
SetCode="RIX";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Rare";
Text=[=[Exile target nonland permanent. For as long as that card remains exiled, its owner may cast it without paying its mana cost.]=];
Flavor=[=["Here and gone like a fleeting breeze."]=];
CardNumber="RIX46";
MultiverseID=439703;
Rulings={
	{Date="2018-01-19";Text=[=[If a token is exiled this way, it can’t be cast.]=];};
	{Date="2018-01-19";Text=[=[If an exiled card has {X} in its mana cost, you must choose 0 as the value of X when casting it without paying its mana cost.]=];};
	{Date="2018-01-19";Text=[=[Casting the exiled card follows the normal timing rules for casting that card. For example, if the card is a creature card, you can cast that card only during your main phase while the stack is empty.]=];};
	{Date="2018-01-19";Text=[=[If you cast a card “without paying its mana cost,” you can’t pay any alternative costs. You can, however, pay additional costs. If the card has any mandatory additional costs, such as that of Silvergill Adept, those must be paid to cast the card.]=];};
};
};

{Name="Relentless Raptor";
SetCode="RIX";
Manacost="{{R}}{{W}}";
cmc=2;
Colors={"White";"Red";};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Vigilance<br/>
Relentless Raptor attacks or blocks each combat if able.]=];
Flavor=[=[As the battle for Orazca unfolded, the contenders discovered that others had already staked a claim.]=];
CardNumber="RIX169";
Power="3";
Toughness="3";
MultiverseID=439830;
Rulings={
	{Date="2018-01-19";Text=[=[If the defending player somehow gains control of Relentless Raptor after it attacks, it must also block if able.]=];};
};
};

{Name="Repeating Barrage";
SetCode="XLN";
Manacost="{{1}}{{R}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Rare";
Text=[=[Repeating Barrage deals 3 damage to target creature or player.<br/>
Raid — {{3}}{{R}}{{R}}: Return Repeating Barrage from your graveyard to your hand. Activate this ability only if you attacked with a creature this turn.]=];
CardNumber="XLN156";
MultiverseID=435310;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Resplendent Griffin";
SetCode="RIX";
Manacost="{{1}}{{W}}{{U}}";
cmc=3;
Colors={"White";"Blue";};
Type="Creature — Griffin";
Types={"Creature"};
SubTypes={"Griffin"};
Rarity="Uncommon";
Text=[=[Flying<br/>
Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Whenever Resplendent Griffin attacks, if you have the city's blessing, put a +1/+1 counter on it.]=];
CardNumber="RIX170";
Power="2";
Toughness="2";
MultiverseID=439831;
Rulings={
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards have triggered abilities with an intervening “if” clause that checks whether you have the city’s blessing. These are worded “[Trigger condition], if you have the city’s blessing, [effect].” You must already have the city’s blessing in order for these abilities to trigger; otherwise they do nothing. In other words, there’s no way to have the ability trigger if you don’t have the city’s blessing, even if you intend to get it in response to the triggered ability.]=];};
};
};

{Name="Revel in Riches";
SetCode="XLN";
Manacost="{{4}}{{B}}";
cmc=5;
Colors={"Black"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Rare";
Text=[=[Whenever a creature an opponent controls dies, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."<br/>
At the beginning of your upkeep, if you control ten or more Treasures, you win the game.]=];
CardNumber="XLN117";
MultiverseID=435271;
Rulings={
	{Date="2017-09-29";Text=[=[If you don’t control ten Treasures as your upkeep begins, the second ability of Revel in Riches won’t trigger. You can’t take any actions during your turn before your upkeep begins.]=];};
	{Date="2017-09-29";Text=[=[If you don’t control ten Treasures as the second ability of Revel in Riches resolves, you won’t win the game.]=];};
	{Date="2017-09-29";Text=[=[If an opponent’s creature dies at the same time that Revel in Riches is destroyed, you’ll get a Treasure.]=];};
	{Date="2017-09-29";Text=[=[If the second ability of Revel in Riches causes you to win the game, please refrain from throwing your Treasure tokens into the air as this may distract or injure other players.]=];};
};
};

{Name="Rigging Runner";
SetCode="XLN";
Manacost="{{R}}";
cmc=1;
Colors={"Red"};
Type="Creature — Goblin Pirate";
Types={"Creature"};
SubTypes={"Goblin";"Pirate";};
Rarity="Uncommon";
Text=[=[First strike<br/>
Raid — Rigging Runner enters the battlefield with a +1/+1 counter on it if you attacked with a creature this turn.]=];
Flavor=[=[The hook makes him feel brave, and the hat makes him feel fancy.]=];
CardNumber="XLN157";
Power="1";
Toughness="1";
MultiverseID=435311;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Rile";
SetCode="XLN";
Manacost="{{R}}";
cmc=1;
Colors={"Red"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Rile deals 1 damage to target creature you control. That creature gains trample until end of turn.<br/>
Draw a card.]=];
Flavor=[=[The enormous can still be at the mercy of the small.]=];
CardNumber="XLN158";
MultiverseID=435312;
Rulings={
	{Date="2017-09-29";Text=[=[If Rile targets a creature with 1 toughness, that creature won’t be destroyed until after you’ve drawn a card. Its abilities may affect that draw or trigger on that draw if appropriate.]=];};
	{Date="2017-09-29";Text=[=[If the damage that would be dealt by Rile is prevented, the creature still gains trample until end of turn.]=];};
	{Date="2017-09-29";Text=[=[If the target creature is an illegal target by the time Rile resolves, the entire spell is countered. You won’t draw a card.]=];};
};
};

{Name="Ripjaw Raptor";
SetCode="XLN";
Manacost="{{2}}{{G}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Rare";
Text=[=[Enrage — Whenever Ripjaw Raptor is dealt damage, draw a card.]=];
Flavor=[=[Raptors are clever enough to tear away a hard metal shell to get at the tasty morsel inside.]=];
CardNumber="XLN203";
Power="4";
Toughness="5";
MultiverseID=435359;
Rulings={
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Ritual of Rejuvenation";
SetCode="XLN";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[You gain 4 life.<br/>
Draw a card.]=];
Flavor=[=["Nothing is more sacred than the gift of blood. Blessed are the vein that empties and the heart that is renewed."]=];
CardNumber="XLN32";
MultiverseID=435184;
};

{Name="River Darter";
SetCode="RIX";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Common";
Text=[=[River Darter can't be blocked by Dinosaurs.]=];
Flavor=[=["Don't make splashes. Make progress."<br/>
—Tishana]=];
CardNumber="RIX47";
Power="2";
Toughness="3";
MultiverseID=439704;
};

{Name="River Heralds' Boon";
SetCode="XLN";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Put a +1/+1 counter on target creature and a +1/+1 counter on up to one target Merfolk.]=];
Flavor=[=["We are kin to the trees, and their strength is our own."]=];
CardNumber="XLN204";
MultiverseID=435360;
Rulings={
	{Date="2017-09-29";Text=[=[You can choose one Merfolk creature as both targets for River Heralds’ Boon. You can also choose two different Merfolk creatures.]=];};
};
};

{Name="River Sneak";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Uncommon";
Text=[=[River Sneak can't be blocked.<br/>
Whenever another Merfolk enters the battlefield under your control, River Sneak gets +1/+1 until end of turn.]=];
Flavor=[=[No ripples, no splashes, no warning.]=];
CardNumber="XLN70";
Power="1";
Toughness="1";
MultiverseID=435222;
};

{Name="River's Rebuke";
SetCode="XLN";
Manacost="{{4}}{{U}}{{U}}";
cmc=6;
Colors={"Blue"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Rare";
Text=[=[Return all nonland permanents target player controls to their owner's hand.]=];
Flavor=[=[Carefully following the thaumatic compass Bolas had given her, Vraska blundered straight into the River Heralds' trap.]=];
CardNumber="XLN71";
MultiverseID=435223;
Rulings={
	{Date="2018-01-19";Text=[=[There are many important moments in the story, but the most crucial—called “story spotlights”—are shown on cards. These cards have the Planeswalker symbol in their text box; this symbol has no effect on gameplay. You can read more about these events in the official Magic fiction at http://www.mtgstory.com.]=];};
};
};

{Name="Riverwise Augur";
SetCode="RIX";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Merfolk Wizard";
Types={"Creature"};
SubTypes={"Merfolk";"Wizard";};
Rarity="Uncommon";
Text=[=[When Riverwise Augur enters the battlefield, draw three cards, then put two cards from your hand on top of your library in any order.]=];
Flavor=[=["Time flows as the rivers do, toward an unknown sea. The wise know to look downstream."]=];
CardNumber="RIX48";
Power="2";
Toughness="2";
MultiverseID=439705;
Rulings={
	{Date="2018-01-19";Text=[=[You draw three cards and put two cards back all while Riverwise Augur’s ability is resolving. Nothing can happen between the two, and no player may choose to take actions.]=];};
};
};

{Name="Rootbound Crag";
SetCode="XLN";
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[Rootbound Crag enters the battlefield tapped unless you control a Mountain or a Forest.<br/>
{{Tap}}: Add {{R}} or {{G}} to your mana pool.]=];
Flavor=[=[Cliffs echo and branches quake at the roar of life.]=];
CardNumber="XLN256";
MultiverseID=435417;
Rulings={
	{Date="2009-10-01";Text=[=[This checks for lands you control with the land type Mountain or Forest, not for lands named Mountain or Forest. The lands it checks for don’t have to be basic lands. For example, if you control Temple Garden (a nonbasic land with the land types Forest and Plains), Rootbound Crag will enter the battlefield untapped.]=];};
	{Date="2009-10-01";Text=[=[As this is entering the battlefield, it checks for lands that are already on the battlefield. It won’t see lands that are entering the battlefield at the same time (due to Warp World, for example).]=];};
};
};

{Name="Rowdy Crew";
SetCode="XLN";
Manacost="{{2}}{{R}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Mythic Rare";
Text=[=[Trample<br/>
When Rowdy Crew enters the battlefield, draw three cards, then discard two cards at random. If two cards that share a card type are discarded this way, put two +1/+1 counters on Rowdy Crew.]=];
CardNumber="XLN159";
Power="3";
Toughness="3";
MultiverseID=435313;
Rulings={
	{Date="2017-09-29";Text=[=[Once Rowdy Crew’s triggered ability begins to resolve, no player may take other actions until it’s done. Notably, you can’t discard or cast any of the cards you draw to try to rig the results of the random discard.]=];};
	{Date="2017-09-29";Text=[=[The card types that can appear on the discarded cards are artifact, creature, enchantment, instant, land, planeswalker, sorcery, and tribal (a card type that appears on some older cards). Legendary is a supertype, not a card type.]=];};
	{Date="2017-09-29";Text=[=[The discarded cards just need to share one card type. For example, Rowdy Crew will get two +1/+1 counters if you discard an artifact creature and an enchantment creature.]=];};
	{Date="2017-09-29";Text=[=[Rowdy Crew doesn’t get more than two +1/+1 counters if the discarded cards happen to share more than one card type.]=];};
};
};

{Name="Ruin Raider";
SetCode="XLN";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Creature — Orc Pirate";
Types={"Creature"};
SubTypes={"Orc";"Pirate";};
Rarity="Rare";
Text=[=[Raid — At the beginning of your end step, if you attacked with a creature this turn, reveal the top card of your library and put that card into your hand. You lose life equal to the card's converted mana cost.]=];
CardNumber="XLN118";
Power="3";
Toughness="2";
MultiverseID=435272;
Rulings={
	{Date="2017-09-29";Text=[=[If the mana cost of the revealed card includes {X}, X is considered to be 0.]=];};
	{Date="2017-09-29";Text=[=[If the revealed card doesn’t have a mana cost (because it’s a land card, for example), its converted mana cost is 0.]=];};
	{Date="2017-09-29";Text=[=[The converted mana cost of a split card, such as cards with aftermath from the Amonkhet block, is based on the combined mana cost of its two halves.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
	{Date="2018-01-19";Text=[=[Some raid abilities trigger at the beginning of your end step. These abilities trigger if you attacked with a creature that turn, even if the card with that raid ability wasn’t on the battlefield when you attacked.]=];};
};
};

{Name="Rummaging Goblin";
SetCode="XLN";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Creature — Goblin Rogue";
Types={"Creature"};
SubTypes={"Goblin";"Rogue";};
Rarity="Common";
Text=[=[{{Tap}}, Discard a card: Draw a card.]=];
Flavor=[=[Goblins' eager curiosity leads them to scavenging, petty theft, and the rigging of sleek pirate ships. Some stop at scavenging.]=];
CardNumber="XLN160";
Power="1";
Toughness="1";
MultiverseID=435314;
Rulings={
	{Date="2012-07-01";Text=[=[Discarding a card is part of the cost to activate Rummaging Goblin’s ability. If you don’t have a card in your hand, you can’t pay this part of the cost and you can’t activate the ability.]=];};
};
};

{Name="Run Aground";
SetCode="XLN";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Put target artifact or creature on top of its owner's library.]=];
Flavor=[=["That's the first time I've seen the ground do the running."<br/>
—Captain Brinely Rage]=];
CardNumber="XLN72";
MultiverseID=435224;
};

{Name="Ruthless Knave";
SetCode="XLN";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Creature — Orc Pirate";
Types={"Creature"};
SubTypes={"Orc";"Pirate";};
Rarity="Uncommon";
Text=[=[{{2}}{{B}}, Sacrifice a creature: Create two colorless Treasure artifact tokens with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."<br/>
Sacrifice three Treasures: Draw a card.]=];
Flavor=[=["This scum is barely worth the trouble."]=];
CardNumber="XLN119";
Power="3";
Toughness="2";
MultiverseID=435273;
Rulings={
	{Date="2017-09-29";Text=[=[You can sacrifice Ruthless Knave to pay the cost for its first ability.]=];};
	{Date="2017-09-29";Text=[=[The Treasures you sacrifice to activate Ruthless Knave’s last ability can’t also be sacrificed for mana.]=];};
};
};

{Name="Sadistic Skymarcher";
SetCode="RIX";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Uncommon";
Text=[=[As an additional cost to cast Sadistic Skymarcher, reveal a Vampire card from your hand or pay {{1}}.<br/>
Flying, lifelink]=];
Flavor=[=["I will catch you, child of the sun. I will drink your life and leave you a husk, discarded in the shadows."]=];
CardNumber="RIX85";
Power="2";
Toughness="2";
MultiverseID=439742;
Rulings={
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Sailor of Means";
SetCode="RIX";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[When Sailor of Means enters the battlefield, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=[The rising tide of Orazca's plunder lifted all ships.]=];
CardNumber="RIX49";
Power="1";
Toughness="4";
MultiverseID=439706;
};

{Name="Sanctum of the Sun";
SetCode="RIX";
cmc=2;
Type="Legendary Land";
SuperTypes={"Legendary"};
Types={"Land"};
Rarity="Mythic Rare";
Text=[=[(Transforms from Azor's Gateway.)<br/>
{{Tap}}: Add X mana of any one color to your mana pool, where X is your life total.]=];
Flavor=[=[As soon as Jace laid eyes on the great sphinx's chamber, the shards of memory began sliding into place.]=];
CardNumber="RIX176b";
MultiverseID=439839;
Rulings={
	{Date="2018-01-19";Text=[=[The ability of Sanctum of the Sun is a mana ability. It doesn’t use the stack and can’t be responded to.]=];};
};
};

{Name="Sanctum Seeker";
SetCode="XLN";
Manacost="{{2}}{{B}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Creature — Vampire Knight";
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Rare";
Text=[=[Whenever a Vampire you control attacks, each opponent loses 1 life and you gain 1 life.]=];
Flavor=[=[The Sanctum Seekers were the first of the knightly orders to cross the sea and are still the most zealous.]=];
CardNumber="XLN120";
Power="3";
Toughness="4";
MultiverseID=435274;
Rulings={
	{Date="2017-09-29";Text=[=[In a Two-Headed Giant game, Sanctum Seeker’s ability causes the opposing team to lose 2 life and you to gain 1 life.]=];};
};
};

{Name="Sanguine Glorifier";
SetCode="RIX";
Manacost="{{3}}{{W}}";
cmc=4;
Colors={"White"};
Type="Creature — Vampire Cleric";
Types={"Creature"};
SubTypes={"Vampire";"Cleric";};
Rarity="Common";
Text=[=[When Sanguine Glorifier enters the battlefield, put a +1/+1 counter on another target Vampire you control.]=];
Flavor=[=[For the Legion of Dusk, the Immortal Sun is a source of eternal life. When they reclaim it, they will no longer be forced to subsist on the blood of the wicked.]=];
CardNumber="RIX20";
Power="3";
Toughness="3";
MultiverseID=439677;
};

{Name="Sanguine Sacrament";
SetCode="XLN";
Manacost="{{X}}{{W}}{{W}}";
cmc=2;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Rare";
Text=[=[You gain twice X life. Put Sanguine Sacrament on the bottom of its owner's library.]=];
Flavor=[=["As the sun sets to make way for dawn, so we turn to darkness to bring about the coming salvation."]=];
CardNumber="XLN33";
MultiverseID=435185;
Rulings={
	{Date="2017-09-29";Text=[=[Sanguine Sacrament causes you to gain an amount of life equal to twice the number chosen for X as a single life-gain event. An ability that triggers “Whenever you gain life” will trigger only once.]=];};
};
};

{Name="Savage Stomp";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Savage Stomp costs {{2}} less to cast if it targets a Dinosaur you control.<br/>
Put a +1/+1 counter on target creature you control. Then that creature fights target creature you don't control. (Each deals damage equal to its power to the other.)]=];
CardNumber="XLN205";
MultiverseID=435361;
Rulings={
	{Date="2017-09-29";Text=[=[You can’t cast Savage Stomp unless you choose both a creature you control and a creature you don’t control as targets.]=];};
	{Date="2017-09-29";Text=[=[If either target is an illegal target as Savage Stomp resolves, neither creature will deal or be dealt damage.]=];};
	{Date="2017-09-29";Text=[=[If the creature you control is an illegal target as Savage Stomp tries to resolve, you won’t put a +1/+1 counter on it. If that creature is a legal target but the other creature isn’t, you’ll still put the counter on the creature you control.]=];};
};
};

{Name="Sea Legs";
SetCode="RIX";
Manacost="{{U}}";
cmc=1;
Colors={"Blue"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Common";
Text=[=[Flash<br/>
Enchant creature<br/>
Enchanted creature gets +0/+2 as long as it's a Pirate. Otherwise, it gets -2/-0.]=];
Flavor=[=["When the waves pick up, either you find your feet or you lose your lunch."]=];
CardNumber="RIX50";
MultiverseID=439707;
};

{Name="Seafloor Oracle";
SetCode="RIX";
Manacost="{{2}}{{U}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Merfolk Wizard";
Types={"Creature"};
SubTypes={"Merfolk";"Wizard";};
Rarity="Rare";
Text=[=[Whenever a Merfolk you control deals combat damage to a player, draw a card.]=];
Flavor=[=[Where the light falls dim and blue on broken ships, secrets lie unclaimed.]=];
CardNumber="RIX51";
Power="2";
Toughness="3";
MultiverseID=439708;
Rulings={
	{Date="2018-01-19";Text=[=[If Seafloor Oracle is dealt lethal damage at the same time a Merfolk you control deals combat damage to a player, you’ll draw a card.]=];};
};
};

{Name="Search for Azcanta";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Legendary Enchantment";
SuperTypes={"Legendary"};
Types={"Enchantment"};
Rarity="Rare";
Text=[=[At the beginning of your upkeep, look at the top card of your library. You may put it into your graveyard. Then if you have seven or more cards in your graveyard, you may transform Search for Azcanta.]=];
Flavor=[=[The Sunken Ruin houses all the learning of a long-forgotten age.]=];
CardNumber="XLN74a";
MultiverseID=435226;
Rulings={
	{Date="2017-09-29";Text=[=[If a seventh card is put into your graveyard by something other than resolving Search for Azcanta’s triggered ability, you won’t transform it yet. You’ll have to wait until your next upkeep.]=];};
	{Date="2017-09-29";Text=[=[If you have seven or more cards in your graveyard, you may transform Search for Azcanta while resolving its triggered ability even if you choose not to put the top card of your library into your graveyard.]=];};
	{Date="2017-09-29";Text=[=[If you don’t put the top card of your library into your graveyard while resolving Search for Azcanta’s triggered ability, you’ll leave it on top of your library (and probably draw it during your draw step).]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Secrets of the Golden City";
SetCode="RIX";
Manacost="{{1}}{{U}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Draw two cards. If you have the city's blessing, draw three cards instead.]=];
Flavor=[=[Stolen knowledge can never be stolen back.]=];
CardNumber="RIX52";
MultiverseID=439709;
Rulings={
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
};
};

{Name="See Red";
SetCode="RIX";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Uncommon";
Text=[=[Enchant creature<br/>
Enchanted creature gets +2/+1 and has first strike.<br/>
At the beginning of your end step, if you didn't attack with a creature this turn, sacrifice See Red.]=];
CardNumber="RIX112";
MultiverseID=439769;
Rulings={
	{Date="2018-01-19";Text=[=[See Red’s last ability is satisfied if any creature has attacked, similar to raid abilities. The creature it enchants doesn’t have to have attacked.]=];};
};
};

{Name="Seekers' Squire";
SetCode="XLN";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Human Scout";
Types={"Creature"};
SubTypes={"Human";"Scout";};
Rarity="Uncommon";
Text=[=[When Seekers' Squire enters the battlefield, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
Flavor=[=[Dusk follows the light.]=];
CardNumber="XLN121";
Power="1";
Toughness="2";
MultiverseID=435275;
Rulings={
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Sentinel Totem";
SetCode="XLN";
Manacost="{{1}}";
cmc=1;
Type="Artifact";
Types={"Artifact"};
Rarity="Uncommon";
Text=[=[When Sentinel Totem enters the battlefield, scry 1. (Look at the top card of your library. You may put that card on the bottom of your library.)<br/>
{{Tap}}, Exile Sentinel Totem: Exile all cards from all graveyards.]=];
CardNumber="XLN245";
MultiverseID=435404;
};

{Name="Settle the Wreckage";
SetCode="XLN";
Manacost="{{2}}{{W}}{{W}}";
cmc=4;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Rare";
Text=[=[Exile all attacking creatures target player controls. That player may search his or her library for that many basic land cards, put those cards onto the battlefield tapped, then shuffle his or her library.]=];
CardNumber="XLN34";
MultiverseID=435186;
Rulings={
	{Date="2017-09-29";Text=[=[Settle the Wreckage targets only the player. Creatures with hexproof that player controls will be exiled as this spell resolves.]=];};
	{Date="2017-09-29";Text=[=[That player can find fewer basic land cards than the number of exiled creatures, whether because he or she wants to or because he or she doesn’t have that many basic land cards left.]=];};
	{Date="2017-09-29";Text=[=[The number of lands that player may find is the number of attacking creatures that were exiled, even if some of those creatures were tokens, weren’t creature cards, or didn’t end up in exile (most likely because one was that player’s commander in the Commander variant).]=];};
};
};

{Name="Shadowed Caravel";
SetCode="XLN";
Manacost="{{2}}";
cmc=2;
Type="Artifact — Vehicle";
Types={"Artifact"};
SubTypes={"Vehicle"};
Rarity="Rare";
Text=[=[Whenever a creature you control explores, put a +1/+1 counter on Shadowed Caravel.<br/>
Crew 2 (Tap any number of creatures you control with total power 2 or more: This Vehicle becomes an artifact creature until end of turn.)]=];
CardNumber="XLN246";
Power="2";
Toughness="2";
MultiverseID=435405;
Rulings={
	{Date="2017-09-29";Text=[=[Noncreature permanents such as Shadowed Caravel can have +1/+1 counters put on them. Those counters remain on it while it’s not a creature, and will apply if it becomes a creature.]=];};
	{Date="2017-09-29";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. Effects that trigger when a creature you control explores, such as that of Shadowed Caravel, trigger if appropriate.]=];};
	{Date="2017-09-29";Text=[=[Each Vehicle is printed with a power and toughness, but it’s not a creature. If it becomes a creature (most likely through its crew ability), it will have that power and toughness.]=];};
	{Date="2017-09-29";Text=[=[If an effect causes a Vehicle to become an artifact creature with a specified power and toughness, that effect overwrites the Vehicle’s printed power and toughness.]=];};
	{Date="2017-09-29";Text=[=[Vehicle is an artifact type, not a creature type. A Vehicle that’s crewed won’t normally have any creature type.]=];};
	{Date="2017-09-29";Text=[=[Once a player announces that he or she is activating a crew ability, no player may take other actions until the ability has been paid for. Notably, players can’t try to stop the ability by changing a creature’s power or by removing or tapping a creature.]=];};
	{Date="2017-09-29";Text=[=[Any untapped creature you control can be tapped to pay a crew cost, even one that just came under your control.]=];};
	{Date="2017-09-29";Text=[=[You may tap more creatures than necessary to activate a crew ability.]=];};
	{Date="2017-09-29";Text=[=[Creatures that crew a Vehicle aren’t attached to it or related in any other way. Effects that affect the Vehicle, such as by destroying it or giving it a +1/+1 counter, don’t affect the creatures that crewed it.]=];};
	{Date="2017-09-29";Text=[=[Once a Vehicle becomes a creature, it behaves exactly like any other artifact creature. It can’t attack unless you’ve controlled it continuously since your turn began, it can block if it’s untapped, it can be tapped to pay a Vehicle’s crew cost, and so on.]=];};
	{Date="2017-09-29";Text=[=[You may activate a crew ability of a Vehicle even if it’s already an artifact creature. Doing so has no effect on the Vehicle. It doesn’t change its power and toughness.]=];};
	{Date="2017-09-29";Text=[=[For a Vehicle to be able to attack, it must be a creature as the declare attackers step begins, so the latest you can activate its crew ability to attack with it is during the beginning of combat step. For a Vehicle to be able to block, it must be a creature as the declare blockers step begins, so the latest you can activate its crew ability to block with it is during the declare attackers step. In either case, players may take actions after the crew ability resolves but before the Vehicle has been declared as an attacking or blocking creature.]=];};
	{Date="2017-09-29";Text=[=[When a Vehicle becomes a creature, that doesn’t count as having a creature enter the battlefield. The permanent was already on the battlefield; it only changed its types. Abilities that trigger whenever a creature enters the battlefield won’t trigger.]=];};
	{Date="2017-09-29";Text=[=[If a permanent becomes a copy of a Vehicle, the copy won’t be a creature, even if the Vehicle it’s copying has become an artifact creature.]=];};
};
};

{Name="Shake the Foundations";
SetCode="RIX";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Shake the Foundations deals 1 damage to each creature without flying.<br/>
Draw a card.]=];
Flavor=[=[A threefold calamity with a single will.]=];
CardNumber="RIX113";
MultiverseID=439770;
};

{Name="Shaper Apprentice";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Creature — Merfolk Wizard";
Types={"Creature"};
SubTypes={"Merfolk";"Wizard";};
Rarity="Common";
Text=[=[Shaper Apprentice has flying as long as you control another Merfolk.]=];
Flavor=[=[The River Heralds would wreck a thousand ships to keep intruders from finding the golden city.]=];
CardNumber="XLN75";
Power="2";
Toughness="1";
MultiverseID=435228;
};

{Name="Shapers of Nature";
SetCode="XLN";
Manacost="{{1}}{{G}}{{U}}";
cmc=3;
Colors={"Blue";"Green";};
Type="Creature — Merfolk Shaman";
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Uncommon";
Text=[=[{{3}}{{G}}: Put a +1/+1 counter on target creature.<br/>
{{2}}{{U}}, Remove a +1/+1 counter from a creature you control: Draw a card.]=];
Flavor=[=[Shapers adapt nature to fit their needs and then return it to the way it was, leaving no trace of their passing.]=];
CardNumber="XLN228";
Power="3";
Toughness="3";
MultiverseID=435384;
};

{Name="Shapers' Sanctuary";
SetCode="XLN";
Manacost="{{G}}";
cmc=1;
Colors={"Green"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Rare";
Text=[=[Whenever a creature you control becomes the target of a spell or ability an opponent controls, you may draw a card.]=];
Flavor=[=[Protection is woven into every vine and branch.]=];
CardNumber="XLN206";
MultiverseID=435362;
Rulings={
	{Date="2017-09-29";Text=[=[The triggered ability of Shapers’ Sanctuary resolves before the spell or ability that caused it to trigger.]=];};
	{Date="2017-09-29";Text=[=[Players can cast spells and activate abilities after the triggered ability of Shapers’ Sanctuary resolves but before the spell or ability that caused it to trigger does. Notably, the card you draw may be able to counter that spell or ability.]=];};
};
};

{Name="Shatter";
SetCode="RIX";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Destroy target artifact.]=];
Flavor=[=[Today it's a miracle of architecture, a marvel of stained glass, a symbol of the Legion's power. Tomorrow, driftwood.]=];
CardNumber="RIX114";
MultiverseID=439771;
Rulings={
	{Date="2004-10-04";Text=[=[Regenerating artifacts can regenerate from this.]=];};
};
};

{Name="Sheltering Light";
SetCode="XLN";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Target creature gains indestructible until end of turn. Scry 1. (Damage and effects that say "destroy" don't destroy the creature.)]=];
Flavor=[=[Those who wield the power of the sun protect the Empire from darkness.]=];
CardNumber="XLN35";
MultiverseID=435187;
};

{Name="Shining Aerosaur";
SetCode="XLN";
Manacost="{{4}}{{W}}";
cmc=5;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Flying]=];
Flavor=[=["The invaders cloak themselves in the shadows of dusk. Aerosaurs hide in the brilliance of the noonday sun."<br/>
—Caparocti Sunborn]=];
CardNumber="XLN36";
Power="3";
Toughness="4";
MultiverseID=435188;
};

{Name="Shipwreck Looter";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[Raid — When Shipwreck Looter enters the battlefield, if you attacked with a creature this turn, you may draw a card. If you do, discard a card.]=];
Flavor=[=[One pirate's wreck is another's reward.]=];
CardNumber="XLN76";
Power="2";
Toughness="1";
MultiverseID=435229;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Shore Keeper";
SetCode="XLN";
Manacost="{{U}}";
cmc=1;
Colors={"Blue"};
Type="Creature — Trilobite";
Types={"Creature"};
SubTypes={"Trilobite"};
Rarity="Common";
Text=[=[{{7}}{{U}}, {{Tap}}, Sacrifice Shore Keeper: Draw three cards.]=];
Flavor=[=[Over their long life spans, the larger trilobites accumulate vast treasure troves in their guts.]=];
CardNumber="XLN77";
Power="0";
Toughness="3";
MultiverseID=435230;
};

{Name="Siegehorn Ceratops";
SetCode="RIX";
Manacost="{{G}}{{W}}";
cmc=2;
Colors={"White";"Green";};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Rare";
Text=[=[Enrage — Whenever Siegehorn Ceratops is dealt damage, put two +1/+1 counters on it. (It must survive the damage to get the counters.)]=];
Flavor=[=[To a siegehorn, there is no such thing as a dead end.]=];
CardNumber="RIX171";
Power="2";
Toughness="2";
MultiverseID=439832;
Rulings={
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Silent Gravestone";
SetCode="RIX";
Manacost="{{1}}";
cmc=1;
Type="Artifact";
Types={"Artifact"};
Rarity="Rare";
Text=[=[Cards in graveyards can't be the targets of spells or abilities.<br/>
{{4}}, {{Tap}}: Exile Silent Gravestone and all cards from all graveyards. Draw a card.]=];
Flavor=[=[Made to ward off the Grim Captain and silence the lure of undeath.]=];
CardNumber="RIX182";
MultiverseID=439846;
Rulings={
	{Date="2018-01-19";Text=[=[Only spells and abilities that target cards in graveyards will be affected. Spells and abilities that affect cards in graveyards without targeting them (such as Extract from Darkness) can still affect those cards.]=];};
	{Date="2018-01-19";Text=[=[Silent Gravestone isn’t exiled until its activated ability resolves.]=];};
};
};

{Name="Silverclad Ferocidons";
SetCode="RIX";
Manacost="{{5}}{{R}}{{R}}";
cmc=7;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Rare";
Text=[=[Enrage — Whenever Silverclad Ferocidons is dealt damage, each opponent sacrifices a permanent.]=];
Flavor=[=["Control them? No. I gird them in armor and let them loose."<br/>
—Yacha, Otepec huntmaster]=];
CardNumber="RIX115";
Power="8";
Toughness="5";
MultiverseID=439772;
Rulings={
	{Date="2018-01-19";Text=[=[If creatures an opponent controls are dealt lethal damage at the same time that Silverclad Ferocidons is dealt damage, those creatures will be destroyed before that player chooses a permanent to sacrifice.]=];};
	{Date="2018-01-19";Text=[=[When Silverclad Ferocidons’s triggered ability resolves, first the player whose turn it is (if that player is an opponent) chooses which permanent he or she will sacrifice, then each other opponent in turn order does the same, then all chosen permanents are sacrificed at the same time. Players will know choices made by earlier players when making their choices.]=];};
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Silvergill Adept";
SetCode="RIX";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Creature — Merfolk Wizard";
Types={"Creature"};
SubTypes={"Merfolk";"Wizard";};
Rarity="Uncommon";
Text=[=[As an additional cost to cast Silvergill Adept, reveal a Merfolk card from your hand or pay {{3}}.<br/>
When Silvergill Adept enters the battlefield, draw a card.]=];
Flavor=[=["If you keep to the shallows, you'll never learn the secrets of the depths."]=];
CardNumber="RIX53";
Power="2";
Toughness="1";
MultiverseID=439710;
};

{Name="Siren Lookout";
SetCode="XLN";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Creature — Siren Pirate";
Types={"Creature"};
SubTypes={"Siren";"Pirate";};
Rarity="Common";
Text=[=[Flying<br/>
When Siren Lookout enters the battlefield, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
CardNumber="XLN78";
Power="1";
Toughness="2";
MultiverseID=435231;
Rulings={
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Siren Reaver";
SetCode="RIX";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Siren Pirate";
Types={"Creature"};
SubTypes={"Siren";"Pirate";};
Rarity="Uncommon";
Text=[=[Raid — Siren Reaver costs {{1}} less to cast if you attacked with a creature this turn.<br/>
Flying]=];
Flavor=[=["Prepare to be boarded."]=];
CardNumber="RIX54";
Power="3";
Toughness="2";
MultiverseID=439711;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Siren Stormtamer";
SetCode="XLN";
Manacost="{{U}}";
cmc=1;
Colors={"Blue"};
Type="Creature — Siren Pirate Wizard";
Types={"Creature"};
SubTypes={"Siren";"Pirate";"Wizard";};
Rarity="Uncommon";
Text=[=[Flying<br/>
{{U}}, Sacrifice Siren Stormtamer: Counter target spell or ability that targets you or a creature you control.]=];
Flavor=[=[He's the calm that hides the coming storm.]=];
CardNumber="XLN79";
Power="1";
Toughness="1";
MultiverseID=435232;
Rulings={
	{Date="2017-09-29";Text=[=[Siren Stormtamer’s activated ability can target a spell or ability that has multiple targets, as long as at least one of those targets is you or a creature you control.]=];};
};
};

{Name="Siren's Ruse";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Exile target creature you control, then return that card to the battlefield under its owner's control. If a Pirate was exiled this way, draw a card.]=];
Flavor=[=[Deception and misdirection are the heart of the pirate's arsenal.]=];
CardNumber="XLN80";
MultiverseID=435233;
Rulings={
	{Date="2017-09-29";Text=[=[Once the exiled creature returns, it’s considered a new object with no relation to the object that it was. Auras attached to the exiled creature will be put into their owners’ graveyards. Equipment attached to the exiled creature will become unattached and remain on the battlefield. Any counters on the exiled creature will cease to exist.]=];};
	{Date="2017-09-29";Text=[=[The returned creature won’t be the target of any spells or abilities that targeted it before. Any spells that don’t target it, such as Star of Extinction, will still affect it.]=];};
	{Date="2017-09-29";Text=[=[If a token is exiled this way, it will cease to exist and won’t return to the battlefield.]=];};
	{Date="2017-09-29";Text=[=[You’ll draw a card if the creature was a Pirate as it was exiled, even if it doesn’t return to the battlefield (most likely because it’s a token) or if it returns to the battlefield but isn’t a Pirate anymore (most likely because it’s copying something else).]=];};
};
};

{Name="Skittering Heartstopper";
SetCode="XLN";
Manacost="{{B}}";
cmc=1;
Colors={"Black"};
Type="Creature — Insect";
Types={"Creature"};
SubTypes={"Insect"};
Rarity="Common";
Text=[=[{{B}}: Skittering Heartstopper gains deathtouch until end of turn.]=];
Flavor=[=[It flows like water over the forest floor, as deadly as the swiftest current.]=];
CardNumber="XLN122";
Power="1";
Toughness="2";
MultiverseID=435276;
};

{Name="Skulduggery";
SetCode="XLN";
Manacost="{{B}}";
cmc=1;
Colors={"Black"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Until end of turn, target creature you control gets +1/+1 and target creature an opponent controls gets -1/-1.]=];
Flavor=[=["They're so much more willing to parley once they're hanging from a boom by the ankle!"]=];
CardNumber="XLN123";
MultiverseID=435277;
Rulings={
	{Date="2017-09-29";Text=[=[You can’t cast Skulduggery unless you choose both a creature you control and a creature you don’t control as targets.]=];};
	{Date="2017-09-29";Text=[=[If either target becomes illegal after you cast Skulduggery but before it resolves, the other is still affected as appropriate.]=];};
};
};

{Name="Sky Terror";
SetCode="XLN";
Manacost="{{R}}{{W}}";
cmc=2;
Colors={"White";"Red";};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Flying, menace]=];
Flavor=[=["Wherever the Threefold Sun shines, great wings may go."<br/>
—Emperor Apatzec Intli III]=];
CardNumber="XLN229";
Power="2";
Toughness="2";
MultiverseID=435385;
};

{Name="Skyblade of the Legion";
SetCode="XLN";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Common";
Text=[=[Flying]=];
Flavor=[=[Vampires call the gift of flight "exultation." For their enemies, it brings only sorrow.]=];
CardNumber="XLN37";
Power="1";
Toughness="3";
MultiverseID=435189;
};

{Name="Skymarch Bloodletter";
SetCode="XLN";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Common";
Text=[=[Flying<br/>
When Skymarch Bloodletter enters the battlefield, target opponent loses 1 life and you gain 1 life.]=];
Flavor=[=[From the perpetual shadowsmoke that hung above the ship, a silent form emerged, lips curled with malice and anticipation.]=];
CardNumber="XLN124";
Power="2";
Toughness="2";
MultiverseID=435278;
};

{Name="Skymarcher Aspirant";
SetCode="RIX";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Uncommon";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Skymarcher Aspirant has flying as long as you have the city's blessing.]=];
Flavor=[=["I was born to glory."]=];
CardNumber="RIX21";
Power="2";
Toughness="1";
MultiverseID=439678;
Rulings={
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards get power, toughness, and/or abilities once you have the city’s blessing. If another card has an ability that triggers when creatures with certain characteristics enter the battlefield (such as Mentor of the Meek or Elemental Bond do), use the entering permanent’s characteristics after you have the city’s blessing to determine whether those abilities trigger. This is true even if the entering permanent is your tenth permanent.]=];};
};
};

{Name="Slash of Talons";
SetCode="XLN";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Slash of Talons deals 2 damage to target attacking or blocking creature.]=];
Flavor=[=["The amber sun smokes with fury, gazing on foes that gather like ants invading our home. We are ready! Blade and claw strike as one."<br/>
—Huatli]=];
CardNumber="XLN38";
MultiverseID=435190;
};

{Name="Slaughter the Strong";
SetCode="RIX";
Manacost="{{1}}{{W}}{{W}}";
cmc=3;
Colors={"White"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Rare";
Text=[=[Each player chooses any number of creatures he or she controls with total power 4 or less, then sacrifices all other creatures he or she controls.]=];
Flavor=[=["Cut the beasts out from under them and their strength is nothing."<br/>
—Vona of Iedo, Butcher of Magan]=];
CardNumber="RIX22";
MultiverseID=439679;
Rulings={
	{Date="2018-01-19";Text=[=[Slaughter the Strong has each player choose any number of creatures and then checks that the total power of creatures each player chose this way is 4 or less. For example, you could save two 2/2 creatures, or a 1/1 and a 3/3 creature, but not all four of those creatures.]=];};
	{Date="2018-01-19";Text=[=[If a creature’s power is somehow less than 0, it subtracts from the total power of the other creatures its controller chooses. This can cause creatures with power 5 or greater to survive.]=];};
	{Date="2018-01-19";Text=[=[Starting with the player whose turn it is, each player in turn order chooses the appropriate number of creatures. Then the remaining creatures are sacrificed simultaneously. Players will know choices made by earlier players when making their choices.]=];};
};
};

{Name="Sleek Schooner";
SetCode="XLN";
Manacost="{{3}}";
cmc=3;
Type="Artifact — Vehicle";
Types={"Artifact"};
SubTypes={"Vehicle"};
Rarity="Uncommon";
Text=[=[Crew 1 (Tap any number of creatures you control with total power 1 or more: This Vehicle becomes an artifact creature until end of turn.)]=];
Flavor=[=[The pirates had left the open sea behind, but they were still in their element: reckless adventure.]=];
CardNumber="XLN247";
Power="4";
Toughness="3";
MultiverseID=435406;
Rulings={
	{Date="2017-09-29";Text=[=[Each Vehicle is printed with a power and toughness, but it’s not a creature. If it becomes a creature (most likely through its crew ability), it will have that power and toughness.]=];};
	{Date="2017-09-29";Text=[=[If an effect causes a Vehicle to become an artifact creature with a specified power and toughness, that effect overwrites the Vehicle’s printed power and toughness.]=];};
	{Date="2017-09-29";Text=[=[Vehicle is an artifact type, not a creature type. A Vehicle that’s crewed won’t normally have any creature type.]=];};
	{Date="2017-09-29";Text=[=[Once a player announces that he or she is activating a crew ability, no player may take other actions until the ability has been paid for. Notably, players can’t try to stop the ability by changing a creature’s power or by removing or tapping a creature.]=];};
	{Date="2017-09-29";Text=[=[Any untapped creature you control can be tapped to pay a crew cost, even one that just came under your control.]=];};
	{Date="2017-09-29";Text=[=[You may tap more creatures than necessary to activate a crew ability.]=];};
	{Date="2017-09-29";Text=[=[Creatures that crew a Vehicle aren’t attached to it or related in any other way. Effects that affect the Vehicle, such as by destroying it or giving it a +1/+1 counter, don’t affect the creatures that crewed it.]=];};
	{Date="2017-09-29";Text=[=[Once a Vehicle becomes a creature, it behaves exactly like any other artifact creature. It can’t attack unless you’ve controlled it continuously since your turn began, it can block if it’s untapped, it can be tapped to pay a Vehicle’s crew cost, and so on.]=];};
	{Date="2017-09-29";Text=[=[You may activate a crew ability of a Vehicle even if it’s already an artifact creature. Doing so has no effect on the Vehicle. It doesn’t change its power and toughness.]=];};
	{Date="2017-09-29";Text=[=[For a Vehicle to be able to attack, it must be a creature as the declare attackers step begins, so the latest you can activate its crew ability to attack with it is during the beginning of combat step. For a Vehicle to be able to block, it must be a creature as the declare blockers step begins, so the latest you can activate its crew ability to block with it is during the declare attackers step. In either case, players may take actions after the crew ability resolves but before the Vehicle has been declared as an attacking or blocking creature.]=];};
	{Date="2017-09-29";Text=[=[When a Vehicle becomes a creature, that doesn’t count as having a creature enter the battlefield. The permanent was already on the battlefield; it only changed its types. Abilities that trigger whenever a creature enters the battlefield won’t trigger.]=];};
	{Date="2017-09-29";Text=[=[If a permanent becomes a copy of a Vehicle, the copy won’t be a creature, even if the Vehicle it’s copying has become an artifact creature.]=];};
};
};

{Name="Slice in Twain";
SetCode="XLN";
Manacost="{{2}}{{G}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Destroy target artifact or enchantment.<br/>
Draw a card.]=];
Flavor=[=[The magic of the River Heralds is so great that even a single shaman can fend off a pirate landing party.]=];
CardNumber="XLN207";
MultiverseID=435363;
Rulings={
	{Date="2017-09-29";Text=[=[If the target artifact or enchantment is an illegal target by the time Slice in Twain resolves, the entire spell is countered. You won’t draw a card. If, on the other hand, the target is a legal target but isn’t destroyed (most likely because it has indestructible), you’ll draw a card.]=];};
};
};

{Name="Slippery Scoundrel";
SetCode="RIX";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
As long as you have the city's blessing, Slippery Scoundrel has hexproof and can't be blocked.]=];
Flavor=[=["I'd rather be caught red-handed than leave empty-handed!"]=];
CardNumber="RIX55";
Power="2";
Toughness="2";
MultiverseID=439712;
Rulings={
	{Date="2018-01-19";Text=[=[Once Slippery Scoundrel has become blocked, getting the city’s blessing won’t cause it to become unblocked.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards get power, toughness, and/or abilities once you have the city’s blessing. If another card has an ability that triggers when creatures with certain characteristics enter the battlefield (such as Mentor of the Meek or Elemental Bond do), use the entering permanent’s characteristics after you have the city’s blessing to determine whether those abilities trigger. This is true even if the entering permanent is your tenth permanent.]=];};
};
};

{Name="Snapping Sailback";
SetCode="XLN";
Manacost="{{4}}{{G}}";
cmc=5;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Flash<br/>
Enrage — Whenever Snapping Sailback is dealt damage, put a +1/+1 counter on it. (It must survive the damage to get the counter.)]=];
Flavor=[=[Lurking beneath the murky waters of Ixalan's rivers, sailbacks can rip a meal off the shore in the blink of an eye.]=];
CardNumber="XLN208";
Power="4";
Toughness="4";
MultiverseID=435364;
Rulings={
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Snubhorn Sentry";
SetCode="RIX";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Snubhorn Sentry gets +3/+0 as long as you have the city's blessing.]=];
Flavor=[=[They're fun to train—if you like stubborn, aggressive, and fiercely territorial.]=];
CardNumber="RIX23";
Power="0";
Toughness="3";
MultiverseID=439680;
Rulings={
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards get power, toughness, and/or abilities once you have the city’s blessing. If another card has an ability that triggers when creatures with certain characteristics enter the battlefield (such as Mentor of the Meek or Elemental Bond do), use the entering permanent’s characteristics after you have the city’s blessing to determine whether those abilities trigger. This is true even if the entering permanent is your tenth permanent.]=];};
};
};

{Name="Sorcerous Spyglass";
SetCode="XLN";
Manacost="{{2}}";
cmc=2;
Type="Artifact";
Types={"Artifact"};
Rarity="Rare";
Text=[=[As Sorcerous Spyglass enters the battlefield, look at an opponent's hand, then choose any card name.<br/>
Activated abilities of sources with the chosen name can't be activated unless they're mana abilities.]=];
CardNumber="XLN248";
MultiverseID=435407;
Rulings={
	{Date="2017-09-29";Text=[=[You can choose any card name, even if that card doesn’t normally have an activated ability. You’re not limited to the names of cards you saw in the opponent’s hand.]=];};
	{Date="2017-09-29";Text=[=[You can’t choose the name of a token unless that token has the same name as a card.]=];};
	{Date="2017-09-29";Text=[=[Activated abilities contain a colon. They’re generally written “[Cost]: [Effect].” Some keyword abilities (such as equip and crew) are activated abilities and will have colons in their reminder text. Triggered abilities (starting with “when,” “whenever,” or “at”) are unaffected by the last ability of Sorcerous Spyglass.]=];};
	{Date="2017-09-29";Text=[=[An activated mana ability is one that produces mana as it resolves, not one that costs mana to activate.]=];};
	{Date="2017-09-29";Text=[=[Sorcerous Spyglass affects cards regardless of what zone they’re in. This includes cards in hand, cards in the graveyard, and exiled cards.]=];};
};
};

{Name="Soul of the Rapids";
SetCode="RIX";
Manacost="{{3}}{{U}}{{U}}";
cmc=5;
Colors={"Blue"};
Type="Creature — Elemental";
Types={"Creature"};
SubTypes={"Elemental"};
Rarity="Common";
Text=[=[Flying<br/>
Hexproof (This creature can't be the target of spells or abilities your opponents control.)]=];
Flavor=[=[With Kumena in control of the Immortal Sun, the rapids rose from their riverbeds and the waterfalls took flight.]=];
CardNumber="RIX56";
Power="3";
Toughness="2";
MultiverseID=439713;
};

{Name="Spell Pierce";
SetCode="XLN";
Manacost="{{U}}";
cmc=1;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Counter target noncreature spell unless its controller pays {{2}}.]=];
Flavor=[=["A fool's fire is quickly quenched."<br/>
—Shaper Kumena]=];
CardNumber="XLN81";
MultiverseID=435234;
};

{Name="Spell Swindle";
SetCode="XLN";
Manacost="{{3}}{{U}}{{U}}";
cmc=5;
Colors={"Blue"};
Type="Instant";
Types={"Instant"};
Rarity="Rare";
Text=[=[Counter target spell. Create X colorless Treasure artifact tokens, where X is that spell's converted mana cost. They have "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
CardNumber="XLN82";
MultiverseID=435235;
Rulings={
	{Date="2017-09-29";Text=[=[For spells with {X} in their mana costs, use the value chosen for X to determine the spell’s converted mana cost.]=];};
	{Date="2017-09-29";Text=[=[You may target a spell that can’t be countered. When Spell Swindle resolves, the target spell will be unaffected, but you’ll still get Treasures.]=];};
};
};

{Name="Sphinx's Decree";
SetCode="RIX";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Rare";
Text=[=[Each opponent can't cast instant or sorcery spells during that player's next turn.]=];
Flavor=[=["Be still."<br/>
—Azor]=];
CardNumber="RIX24";
MultiverseID=439681;
Rulings={
	{Date="2018-01-19";Text=[=[If multiple effects say that an opponent can’t cast instant or sorcery spells during that player’s next turn, they all apply to the same turn.]=];};
};
};

{Name="Spike-Tailed Ceratops";
SetCode="XLN";
Manacost="{{4}}{{G}}";
cmc=5;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Spike-Tailed Ceratops can block an additional creature each combat.]=];
Flavor=[=[The conquistadors surrounded the dinosaur only to find that it had outflanked them.]=];
CardNumber="XLN209";
Power="4";
Toughness="4";
MultiverseID=435365;
};

{Name="Spire Winder";
SetCode="RIX";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Snake";
Types={"Creature"};
SubTypes={"Snake"};
Rarity="Common";
Text=[=[Flying<br/>
Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Spire Winder gets +1/+1 as long as you have the city's blessing.]=];
CardNumber="RIX57";
Power="2";
Toughness="3";
MultiverseID=439714;
Rulings={
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards get power, toughness, and/or abilities once you have the city’s blessing. If another card has an ability that triggers when creatures with certain characteristics enter the battlefield (such as Mentor of the Meek or Elemental Bond do), use the entering permanent’s characteristics after you have the city’s blessing to determine whether those abilities trigger. This is true even if the entering permanent is your tenth permanent.]=];};
};
};

{Name="Spires of Orazca";
SetCode="XLN";
cmc=2;
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Thaumatic Compass.)<br/>
{{Tap}}: Add {{C}} to your mana pool.<br/>
{{Tap}}: Untap target attacking creature an opponent controls and remove it from combat.]=];
Flavor=[=[". . . a cryptic objective."<br/>
—Jace Beleren]=];
CardNumber="XLN249b";
MultiverseID=435409;
Rulings={
	{Date="2017-09-29";Text=[=[Removing a creature from combat doesn’t change the fact that it attacked, even though it’s no longer an attacking creature. Notably, raid abilities will still be satisfied if every attacking creature is removed from combat.]=];};
};
};

{Name="Spitfire Bastion";
SetCode="XLN";
cmc=4;
Type="Legendary Land";
SuperTypes={"Legendary"};
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Vance's Blasting Cannons.)<br/>
{{Tap}}: Add {{R}} to your mana pool.<br/>
{{2}}{{R}}, {{Tap}}: Spitfire Bastion deals 3 damage to target creature or player.]=];
Flavor=[=[Now instead of a ship, Ripley Vance commands a fortress.]=];
CardNumber="XLN173b";
MultiverseID=435328;
};

{Name="Spreading Rot";
SetCode="XLN";
Manacost="{{4}}{{B}}";
cmc=5;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Common";
Text=[=[Destroy target land. Its controller loses 2 life.]=];
Flavor=[=["What is this foul presence that defies the sun's cleansing rays?"<br/>
—Itzama the Crested]=];
CardNumber="XLN125";
MultiverseID=435279;
};

{Name="Squire's Devotion";
SetCode="RIX";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Common";
Text=[=[Enchant creature<br/>
Enchanted creature gets +1/+1 and has lifelink.<br/>
When Squire's Devotion enters the battlefield, create a 1/1 white Vampire creature token with lifelink.]=];
CardNumber="RIX25";
MultiverseID=439682;
Rulings={
	{Date="2018-01-19";Text=[=[You need a creature for Squire’s Devotion to target as you cast it. There’s no way to have it enter the battlefield attached to the Vampire token it’ll create.]=];};
	{Date="2018-01-19";Text=[=[If the creature this Aura would enchant is an illegal target by the time Squire’s Devotion tries to resolve, the Aura spell is countered. It won’t enter the battlefield, so its ability won’t trigger.]=];};
};
};

{Name="Stampeding Horncrest";
SetCode="RIX";
Manacost="{{4}}{{R}}";
cmc=5;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Stampeding Horncrest has haste as long as you control another Dinosaur.]=];
Flavor=[=[When the golden city opened, the dinosaurs inside were eager to greet the new visitors.]=];
CardNumber="RIX116";
Power="4";
Toughness="4";
MultiverseID=439773;
Rulings={
	{Date="2018-01-19";Text=[=[If it’s the turn Stampeding Horncrest comes under your control, and it loses haste after being declared as an attacker, it will continue to attack. It won’t be removed from combat. On the other hand, if it loses haste before your declare attackers step, it won’t be able to attack.]=];};
};
};

{Name="Star of Extinction";
SetCode="XLN";
Manacost="{{5}}{{R}}{{R}}";
cmc=7;
Colors={"Red"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Mythic Rare";
Text=[=[Destroy target land. Star of Extinction deals 20 damage to each creature and each planeswalker.]=];
Flavor=[=["The visions haunt me. I see the end of the world, brought on by the search for the Immortal Sun."<br/>
—Shaper Pashona]=];
CardNumber="XLN161";
MultiverseID=435315;
};

{Name="Steadfast Armasaur";
SetCode="XLN";
Manacost="{{3}}{{W}}";
cmc=4;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Vigilance<br/>
{{1}}{{W}}, {{Tap}}: Steadfast Armasaur deals damage equal to its toughness to target creature blocking or blocked by it.]=];
Flavor=[=["Like the mighty armasaur, we will defend against all who invade our shores."<br/>
—Itzama the Crested]=];
CardNumber="XLN39";
Power="2";
Toughness="3";
MultiverseID=435191;
Rulings={
	{Date="2017-09-29";Text=[=[Tapping an attacking or blocking creature doesn’t remove it from combat. If the target of Steadfast Armasaur’s ability survives the damage, Steadfast Armasaur will deal combat damage to and be dealt combat damage by that creature as normal.]=];};
	{Date="2017-09-29";Text=[=[If Steadfast Armasaur is no longer on the battlefield as its ability resolves, use its toughness as it last existed on the battlefield to determine how damage is dealt.]=];};
};
};

{Name="Stone Quarry";
SetCode="RIX";
Type="Land";
Types={"Land"};
Rarity="Uncommon";
Text=[=[Stone Quarry enters the battlefield tapped.<br/>
{{Tap}}: Add {{R}} or {{W}} to your mana pool.]=];
Flavor=[=[The Sun Empire's cities are built from the bones of the earth.]=];
CardNumber="RIX190";
MultiverseID=439854;
};

{Name="Storm Fleet Aerialist";
SetCode="XLN";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[Flying<br/>
Raid — Storm Fleet Aerialist enters the battlefield with a +1/+1 counter on it if you attacked with a creature this turn.]=];
Flavor=[=["Only one thing beats the freedom of the sea: the freedom of the sky."]=];
CardNumber="XLN83";
Power="1";
Toughness="2";
MultiverseID=435236;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Storm Fleet Arsonist";
SetCode="XLN";
Manacost="{{4}}{{R}}";
cmc=5;
Colors={"Red"};
Type="Creature — Orc Pirate";
Types={"Creature"};
SubTypes={"Orc";"Pirate";};
Rarity="Uncommon";
Text=[=[Raid — When Storm Fleet Arsonist enters the battlefield, if you attacked with a creature this turn, target opponent sacrifices a permanent.]=];
Flavor=[=["Go ahead, build another. I'll burn that down as well."]=];
CardNumber="XLN162";
Power="4";
Toughness="4";
MultiverseID=435316;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Storm Fleet Pyromancer";
SetCode="XLN";
Manacost="{{4}}{{R}}";
cmc=5;
Colors={"Red"};
Type="Creature — Human Pirate Wizard";
Types={"Creature"};
SubTypes={"Human";"Pirate";"Wizard";};
Rarity="Common";
Text=[=[Raid — When Storm Fleet Pyromancer enters the battlefield, if you attacked with a creature this turn, Storm Fleet Pyromancer deals 2 damage to target creature or player.]=];
CardNumber="XLN163";
Power="3";
Toughness="2";
MultiverseID=435317;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Storm Fleet Sprinter";
SetCode="RIX";
Manacost="{{1}}{{U}}{{R}}";
cmc=3;
Colors={"Blue";"Red";};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[Haste<br/>
Storm Fleet Sprinter can't be blocked.]=];
Flavor=[=["Charge like a red-hot cannonball straight to your target. You slow down, you sink."<br/>
—Captain Lannery Storm]=];
CardNumber="RIX172";
Power="2";
Toughness="2";
MultiverseID=439833;
};

{Name="Storm Fleet Spy";
SetCode="XLN";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[Raid — When Storm Fleet Spy enters the battlefield, if you attacked with a creature this turn, draw a card.]=];
Flavor=[=["They're searching in the same direction we are. And for the same thing, I'll wager."]=];
CardNumber="XLN84";
Power="2";
Toughness="2";
MultiverseID=435237;
Rulings={
	{Date="2018-01-19";Text=[=[Raid abilities care only that you attacked with a creature. It doesn’t matter how many creatures you attacked with, or which opponent or planeswalker controlled by an opponent those creatures attacked.]=];};
	{Date="2018-01-19";Text=[=[Raid abilities evaluate the entire turn to see if you attacked with a creature. That creature doesn’t have to still be on the battlefield. Similarly, the player or planeswalker it attacked doesn’t have to still be in the game or on the battlefield, respectively.]=];};
};
};

{Name="Storm Fleet Swashbuckler";
SetCode="RIX";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Storm Fleet Swashbuckler has double strike as long as you have the city's blessing.]=];
Flavor=[=["A bolt to the eye, a blade to the neck. That's the way to clear the deck!"]=];
CardNumber="RIX117";
Power="2";
Toughness="2";
MultiverseID=439774;
Rulings={
	{Date="2018-01-19";Text=[=[If Storm Fleet Swashbuckler gains double strike after it has dealt regular combat damage, it won’t go back and deal first-strike combat damage. On the other hand, if it gains first strike somehow and then it gains double strike after dealing first-strike combat damage, it will also deal regular combat damage.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards get power, toughness, and/or abilities once you have the city’s blessing. If another card has an ability that triggers when creatures with certain characteristics enter the battlefield (such as Mentor of the Meek or Elemental Bond do), use the entering permanent’s characteristics after you have the city’s blessing to determine whether those abilities trigger. This is true even if the entering permanent is your tenth permanent.]=];};
};
};

{Name="Storm Sculptor";
SetCode="XLN";
Manacost="{{3}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Merfolk Wizard";
Types={"Creature"};
SubTypes={"Merfolk";"Wizard";};
Rarity="Common";
Text=[=[Storm Sculptor can't be blocked.<br/>
When Storm Sculptor enters the battlefield, return a creature you control to its owner's hand.]=];
Flavor=[=[In his hands, the wind can become a weapon or a means of escape.]=];
CardNumber="XLN85";
Power="3";
Toughness="2";
MultiverseID=435238;
Rulings={
	{Date="2017-09-29";Text=[=[Storm Sculptor’s last ability doesn’t target the creature you’ll return to hand. You choose one as the ability resolves. No player may take actions between the time you choose a creature to return and the time you do so.]=];};
	{Date="2017-09-29";Text=[=[Storm Sculptor’s last ability isn’t optional. If Storm Sculptor is the only creature you control when the ability resolves, you’ll have to return it to its owner’s hand.]=];};
};
};

{Name="Storm the Vault";
SetCode="RIX";
Manacost="{{2}}{{U}}{{R}}";
cmc=4;
Colors={"Blue";"Red";};
Type="Legendary Enchantment";
SuperTypes={"Legendary"};
Types={"Enchantment"};
Rarity="Rare";
Text=[=[Whenever one or more creatures you control deal combat damage to a player, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."<br/>
At the beginning of your end step, if you control five or more artifacts, transform Storm the Vault.]=];
CardNumber="RIX173a";
MultiverseID=439834;
Rulings={
	{Date="2018-01-19";Text=[=[Storm the Vault’s first ability can trigger more than once in a turn if creatures you control deal combat damage at different times in a turn (most likely because one or more has first strike) or if creatures you control deal combat damage to more than one player at once.]=];};
	{Date="2018-01-19";Text=[=[The last ability of Storm the Vault doesn’t trigger if you don’t control five or more artifacts as your end step begins. If it does trigger but you don’t control five or more artifacts as it resolves, it does nothing.]=];};
	{Date="2018-01-19";Text=[=[In a Two-Headed Giant game, if you control more than one attacking creature, you may have your creatures deal damage to different opponents so that Storm the Vault’s first ability triggers twice.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Strength of the Pack";
SetCode="RIX";
Manacost="{{4}}{{G}}{{G}}";
cmc=6;
Colors={"Green"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Put two +1/+1 counters on each creature you control.]=];
Flavor=[=[The pack that ambushes, eviscerates, and devours together stays together.]=];
CardNumber="RIX145";
MultiverseID=439802;
};

{Name="Strider Harness";
SetCode="RIX";
Manacost="{{3}}";
cmc=3;
Type="Artifact — Equipment";
Types={"Artifact"};
SubTypes={"Equipment"};
Rarity="Common";
Text=[=[Equipped creature gets +1/+1 and has haste.<br/>
Equip {{1}} ({{1}}: Attach to target creature you control. Equip only as a sorcery.)]=];
Flavor=[=["Because the giant, implacable death lizard wasn't scary enough already."<br/>
—Captain Brinely Rage]=];
CardNumber="RIX183";
MultiverseID=439847;
Rulings={
	{Date="2018-01-19";Text=[=[If a creature enters the battlefield under your control and gains haste, but then loses it before attacking, it won’t be able to attack that turn. This means that you can’t use one Strider Harness to allow two new creatures to attack in the same turn.]=];};
};
};

{Name="Sun Sentinel";
SetCode="RIX";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Creature — Human Soldier";
Types={"Creature"};
SubTypes={"Human";"Soldier";};
Rarity="Common";
Text=[=[Vigilance]=];
Flavor=[=["I will not sleep until Orazca is ours once more."]=];
CardNumber="RIX26";
Power="2";
Toughness="2";
MultiverseID=439683;
};

{Name="Sunbird's Invocation";
SetCode="XLN";
Manacost="{{5}}{{R}}";
cmc=6;
Colors={"Red"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Rare";
Text=[=[Whenever you cast a spell from your hand, reveal the top X cards of your library, where X is that spell's converted mana cost. You may cast a card revealed this way with converted mana cost X or less without paying its mana cost. Put the rest on the bottom of your library in a random order.]=];
CardNumber="XLN165";
MultiverseID=435319;
Rulings={
	{Date="2017-09-29";Text=[=[Casting Sunbird’s Invocation won’t cause its own ability to trigger.]=];};
	{Date="2017-09-29";Text=[=[The ability of Sunbird’s Invocation resolves before the spell that caused it to trigger. It will resolve even if that spell is countered. If you cast a spell as part of the resolution of the ability, that spell resolves before the spell that caused the ability to trigger.]=];};
	{Date="2017-09-29";Text=[=[For spells with {X} in their mana costs, use the value chosen for X to determine the spell’s converted mana cost.]=];};
	{Date="2017-09-29";Text=[=[If the spell’s converted mana cost is 0, you do nothing as the ability of Sunbird’s Invocation resolves.]=];};
	{Date="2017-09-29";Text=[=[If a revealed card in your library has {X} in its mana cost, you must choose 0 as the value of X when casting it without paying its mana cost.]=];};
	{Date="2017-09-29";Text=[=[If you cast one of the revealed cards, you do so as part of the resolution of the triggered ability. You can’t wait to cast it later in the turn. Timing permissions based on the card’s type are ignored, but other restrictions (such as “Cast [this card] only during combat”) are not.]=];};
	{Date="2017-09-29";Text=[=[If you cast a card “without paying its mana cost,” you can’t pay any alternative costs. You can, however, pay additional costs. If the card has any mandatory additional costs, such as that of Costly Plunder, those must be paid to cast the card.]=];};
	{Date="2017-09-29";Text=[=[The converted mana cost of a split card, such as cards with aftermath from the Amonkhet block, is based on the combined mana cost of its two halves. The converted mana cost of the resulting spell is based only on the half you cast.]=];};
};
};

{Name="Sun-Blessed Mount";
SetCode="XLN";
Manacost="{{3}}{{R}}{{W}}";
cmc=5;
Colors={"White";"Red";};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Rare";
Text=[=[When Sun-Blessed Mount enters the battlefield, you may search your library and/or graveyard for a card named Huatli, Dinosaur Knight, reveal it, then put it into your hand. If you searched your library this way, shuffle it.]=];
Flavor=[=[When Huatli chooses a mount, its eyes glow with the flames of the sun.]=];
CardNumber="XLN288";
Power="4";
Toughness="4";
MultiverseID=435449;
};

{Name="Sun-Collared Raptor";
SetCode="RIX";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Trample<br/>
{{2}}{{R}}: Sun-Collared Raptor gets +3/+0 until end of turn.]=];
Flavor=[=["With Tilonalli's gifts, even the smallest of us can become great."<br/>
—Huatli]=];
CardNumber="RIX118";
Power="1";
Toughness="2";
MultiverseID=439775;
};

{Name="Sun-Crested Pterodon";
SetCode="RIX";
Manacost="{{4}}{{W}}";
cmc=5;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Flying<br/>
Sun-Crested Pterodon has vigilance as long as you control another Dinosaur.]=];
Flavor=[=["Pterodons tolerate no intrusion into their skies. Even the clouds must ask permission."<br/>
—Mahuiz, Sun Empire archer]=];
CardNumber="RIX27";
Power="2";
Toughness="5";
MultiverseID=439684;
Rulings={
	{Date="2018-01-19";Text=[=[Gaining vigilance any time after the moment you choose to attack with Sun-Crested Pterodon won’t cause it to become untapped, and losing vigilance after that time won’t cause it to become tapped.]=];};
};
};

{Name="Sun-Crowned Hunters";
SetCode="XLN";
Manacost="{{4}}{{R}}{{R}}";
cmc=6;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Enrage — Whenever Sun-Crowned Hunters is dealt damage, it deals 3 damage to target opponent.]=];
Flavor=[=[One alone is dangerous, and they are never alone.]=];
CardNumber="XLN164";
Power="5";
Toughness="4";
MultiverseID=435318;
Rulings={
	{Date="2017-09-29";Text=[=[If your life total is brought to 0 or less at the same time that Sun-Crowned Hunters is dealt damage, you lose the game before its enrage ability resolves.]=];};
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Sunpetal Grove";
SetCode="XLN";
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[Sunpetal Grove enters the battlefield tapped unless you control a Forest or a Plains.<br/>
{{Tap}}: Add {{G}} or {{W}} to your mana pool.]=];
Flavor=[=[To the Sun Empire, any place where daylight brightens the jungle floor is sacred ground.]=];
CardNumber="XLN257";
MultiverseID=435418;
Rulings={
	{Date="2009-10-01";Text=[=[This checks for lands you control with the land type Forest or Plains, not for lands named Forest or Plains. The lands it checks for don’t have to be basic lands. For example, if you control Hallowed Fountain (a nonbasic land with the land types Plains and Island), Sunpetal Grove will enter the battlefield untapped.]=];};
	{Date="2009-10-01";Text=[=[As this is entering the battlefield, it checks for lands that are already on the battlefield. It won’t see lands that are entering the battlefield at the same time (due to Warp World, for example).]=];};
};
};

{Name="Sunrise Seeker";
SetCode="XLN";
Manacost="{{4}}{{W}}";
cmc=5;
Colors={"White"};
Type="Creature — Human Scout";
Types={"Creature"};
SubTypes={"Human";"Scout";};
Rarity="Common";
Text=[=[Vigilance<br/>
When Sunrise Seeker enters the battlefield, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
CardNumber="XLN40";
Power="3";
Toughness="3";
MultiverseID=435192;
Rulings={
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Sure Strike";
SetCode="XLN";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Target creature gets +3/+0 and gains first strike until end of turn.]=];
Flavor=[=["Everyone has a weak spot."]=];
CardNumber="XLN166";
MultiverseID=435320;
};

{Name="Swab Goblin";
SetCode="RIX";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Goblin Pirate";
Types={"Creature"};
SubTypes={"Goblin";"Pirate";};
Rarity="Common";
Flavor=[=[Though small, goblins can hold their own in a fight. Foolhardy confidence goes a long way.]=];
CardNumber="RIX203";
Power="2";
Toughness="2";
MultiverseID=441897;
};

{Name="Swaggering Corsair";
SetCode="RIX";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Common";
Text=[=[Raid — Swaggering Corsair enters the battlefield with a +1/+1 counter on it if you attacked with a creature this turn.]=];
Flavor=[=["I'm about to make you famous. From the golden city to High and Dry, they'll talk about how fast you died!"]=];
CardNumber="RIX119";
Power="2";
Toughness="2";
MultiverseID=439776;
};

{Name="Swamp";
SetCode="RIX";
Type="Basic Land — Swamp";
SuperTypes={"Basic"};
Types={"Land"};
SubTypes={"Swamp"};
Rarity="Basic Land";
CardNumber="RIX194";
MultiverseID=439858;
};

{Name="Swashbuckling";
SetCode="XLN";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Common";
Text=[=[Enchant creature<br/>
Enchanted creature gets +2/+2 and has haste.]=];
Flavor=[=[The pirates of the Brazen Coalition are the descendants of those displaced by the Legion of Dusk, and they are eager for vengeance.]=];
CardNumber="XLN167";
MultiverseID=435321;
};

{Name="Swift Warden";
SetCode="RIX";
Manacost="{{1}}{{G}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Uncommon";
Text=[=[Flash<br/>
When Swift Warden enters the battlefield, target Merfolk you control gains hexproof until end of turn. (It can't be the target of spells or abilities your opponents control.)]=];
Flavor=[=[A warning shout would take too long.]=];
CardNumber="RIX146";
Power="3";
Toughness="3";
MultiverseID=439803;
};

{Name="Sword-Point Diplomacy";
SetCode="XLN";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Rare";
Text=[=[Reveal the top three cards of your library. For each of those cards, put that card into your hand unless any opponent pays 3 life. Then exile the rest.]=];
Flavor=[=["Take my blood if you want. Just don't take my gold!"]=];
CardNumber="XLN126";
MultiverseID=435280;
Rulings={
	{Date="2017-09-29";Text=[=[You reveal all three cards before opponents choose whether to pay life for any of them.]=];};
	{Date="2017-09-29";Text=[=[In a multiplayer game, each opponent in turn order chooses whether to pay life for one card before proceeding to the next card. You choose the order to perform this process for the cards, but opponents may discuss them before making any choices. Opponents will then know choices made by earlier opponents when making their choices.]=];};
};
};

{Name="Sworn Guardian";
SetCode="RIX";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Creature — Merfolk Warrior";
Types={"Creature"};
SubTypes={"Merfolk";"Warrior";};
Rarity="Common";
Flavor=[=[For the River Heralds, the Immortal Sun is an object of terror and devastation. The idea that anyone would retrieve it for their own use is utterly abhorrent.]=];
CardNumber="RIX58";
Power="1";
Toughness="3";
MultiverseID=439715;
};

{Name="Tempest Caller";
SetCode="XLN";
Manacost="{{2}}{{U}}{{U}}";
cmc=4;
Colors={"Blue"};
Type="Creature — Merfolk Wizard";
Types={"Creature"};
SubTypes={"Merfolk";"Wizard";};
Rarity="Uncommon";
Text=[=[When Tempest Caller enters the battlefield, tap all creatures target opponent controls.]=];
Flavor=[=["I am the storm."]=];
CardNumber="XLN86";
Power="2";
Toughness="3";
MultiverseID=435239;
Rulings={
	{Date="2017-09-29";Text=[=[Tempest Caller’s ability targets only the player. Creatures with hexproof that player controls will be tapped as that ability resolves.]=];};
};
};

{Name="Temple Altisaur";
SetCode="RIX";
Manacost="{{4}}{{W}}";
cmc=5;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Rare";
Text=[=[If a source would deal damage to another Dinosaur you control, prevent all but 1 of that damage.]=];
Flavor=[=["Kinjalli sculpted humans from clay, but the dinosaurs were carved from unyielding stone."<br/>
—Itzama the Crested]=];
CardNumber="RIX28";
Power="3";
Toughness="4";
MultiverseID=439685;
Rulings={
	{Date="2018-01-19";Text=[=[Combat damage can be assigned to other Dinosaurs you control as normal, but most of that damage will be prevented. For example, if a 3/3 Dinosaur you control blocks a 5/5 creature with trample, the attacking player may assign 2 of that creature’s combat damage to the player or planeswalker it’s attacking and Temple Altisaur will prevent 2 of the 3 damage assigned to the defending Dinosaur.]=];};
	{Date="2018-01-19";Text=[=[If multiple sources would deal damage to another Dinosaur you control, all but 1 damage from each of those sources is prevented.]=];};
	{Date="2018-01-19";Text=[=[The effects of two Temple Altisaurs won’t reduce the damage from one source below 1 damage.]=];};
	{Date="2018-01-19";Text=[=[If multiple replacement and/or prevention effects could apply to a Dinosaur you control, you choose the order in which to apply those effects. For example, if another effect will prevent 1 damage that would be dealt to a Dinosaur, you may apply Temple Altisaur’s effect to prevent all but 1 of that damage and then apply the other effect to prevent that 1 damage.]=];};
};
};

{Name="Temple of Aclazotz";
SetCode="XLN";
cmc=2;
Type="Legendary Land";
SuperTypes={"Legendary"};
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Arguel's Blood Fast.)<br/>
{{Tap}}: Add {{B}} to your mana pool.<br/>
{{Tap}}, Sacrifice a creature: You gain life equal to the sacrificed creature's toughness.]=];
Flavor=[=[. . . to the lost temple of a bat-god of night, eternal enemy to the Threefold Sun.]=];
CardNumber="XLN90b";
MultiverseID=435244;
Rulings={
	{Date="2017-09-29";Text=[=[Once you’ve announced the last ability of Temple of Aclazotz, it’s too late for anyone to interrupt you by trying to remove the creature you sacrifice.]=];};
	{Date="2017-09-29";Text=[=[For the last ability of Temple of Aclazotz, use the creature’s toughness as it last existed on the battlefield to determine how much life you gain.]=];};
};
};

{Name="Tendershoot Dryad";
SetCode="RIX";
Manacost="{{4}}{{G}}";
cmc=5;
Colors={"Green"};
Type="Creature — Dryad";
Types={"Creature"};
SubTypes={"Dryad"};
Rarity="Rare";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
At the beginning of each upkeep, create a 1/1 green Saproling creature token.<br/>
Saprolings you control get +2/+2 as long as you have the city's blessing.]=];
CardNumber="RIX147";
Power="2";
Toughness="2";
MultiverseID=439804;
Rulings={
	{Date="2018-01-19";Text=[=[Because damage remains marked on a creature until it’s removed as the turn ends, nonlethal damage dealt to a Saproling you control may become lethal if Tendershoot Dryad leaves the battlefield during that turn.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards get power, toughness, and/or abilities once you have the city’s blessing. If another card has an ability that triggers when creatures with certain characteristics enter the battlefield (such as Mentor of the Meek or Elemental Bond do), use the entering permanent’s characteristics after you have the city’s blessing to determine whether those abilities trigger. This is true even if the entering permanent is your tenth permanent.]=];};
};
};

{Name="Territorial Hammerskull";
SetCode="XLN";
Manacost="{{2}}{{W}}";
cmc=3;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[Whenever Territorial Hammerskull attacks, tap target creature an opponent controls.]=];
Flavor=[=[From the eyes up, it's solid bone and stubbornness.]=];
CardNumber="XLN41";
Power="2";
Toughness="3";
MultiverseID=435193;
};

{Name="Tetzimoc, Primal Death";
SetCode="RIX";
Manacost="{{4}}{{B}}{{B}}";
cmc=6;
Colors={"Black"};
Type="Legendary Creature — Elder Dinosaur";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Elder";"Dinosaur";};
Rarity="Rare";
Text=[=[Deathtouch<br/>
{{B}}, Reveal Tetzimoc, Primal Death from your hand: Put a prey counter on target creature. Activate this ability only during your turn.<br/>
When Tetzimoc enters the battlefield, destroy each creature your opponents control with a prey counter on it.]=];
CardNumber="RIX86";
Power="6";
Toughness="6";
MultiverseID=439743;
Rulings={
	{Date="2018-01-19";Text=[=[You can activate Tetzimoc’s activated ability more than once during your turn.]=];};
	{Date="2018-01-19";Text=[=[Tetzimoc’s triggered ability doesn’t care how a prey counter got onto a creature an opponent controls or whose Tetzimoc put that counter on the creature. Tetzimoc is happy to eat all the opponent’s prey it can see.]=];};
};
};

{Name="Thaumatic Compass";
SetCode="XLN";
Manacost="{{2}}";
cmc=2;
Type="Artifact";
Types={"Artifact"};
Rarity="Rare";
Text=[=[{{3}}, {{Tap}}: Search your library for a basic land card, reveal it, put it into your hand, then shuffle your library.<br/>
At the beginning of your end step, if you control seven or more lands, transform Thaumatic Compass.]=];
Flavor=[=["Clearly, it indicates the aetheric azimuth of . . ."<br/>
—Jace Beleren]=];
CardNumber="XLN249a";
MultiverseID=435408;
Rulings={
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
	{Date="2018-01-19";Text=[=[There are many important moments in the story, but the most crucial—called “story spotlights”—are shown on cards. These cards have the Planeswalker symbol in their text box; this symbol has no effect on gameplay. You can read more about these events in the official Magic fiction at http://www.mtgstory.com.]=];};
};
};

{Name="The Immortal Sun";
SetCode="RIX";
Manacost="{{6}}";
cmc=6;
Type="Legendary Artifact";
SuperTypes={"Legendary"};
Types={"Artifact"};
Rarity="Mythic Rare";
Text=[=[Players can't activate planeswalkers' loyalty abilities.<br/>
At the beginning of your draw step, draw an additional card.<br/>
Spells you cast cost {{1}} less to cast.<br/>
Creatures you control get +1/+1.]=];
CardNumber="RIX180";
MultiverseID=439844;
Rulings={
	{Date="2018-01-19";Text=[=[To determine the total cost of a spell, start with the mana cost or alternative cost you’re paying, add any cost increases, then apply any cost reductions. The converted mana cost of the spell remains unchanged, no matter what the total cost to cast it was.]=];};
};
};

{Name="Thrash of Raptors";
SetCode="XLN";
Manacost="{{3}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Common";
Text=[=[As long as you control another Dinosaur, Thrash of Raptors gets +2/+0 and has trample.]=];
Flavor=[=[They glide through the undergrowth, drawn to sounds of disturbance. They attack in unison and all share in the kill. And then they move on.]=];
CardNumber="XLN168";
Power="3";
Toughness="3";
MultiverseID=435322;
};

{Name="Thrashing Brontodon";
SetCode="RIX";
Manacost="{{1}}{{G}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[{{1}}, Sacrifice Thrashing Brontodon: Destroy target artifact or enchantment.]=];
Flavor=[=[It cares more about preserving the herd's territory than about preserving itself.]=];
CardNumber="RIX148";
Power="3";
Toughness="4";
MultiverseID=439805;
};

{Name="Thunderherd Migration";
SetCode="RIX";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[As an additional cost to cast Thunderherd Migration, reveal a Dinosaur card from your hand or pay {{1}}.<br/>
Search your library for a basic land card, put it onto the battlefield tapped, then shuffle your library.]=];
Flavor=[=[The herds follow as new growth arises.]=];
CardNumber="RIX149";
MultiverseID=439806;
Rulings={
	{Date="2018-01-19";Text=[=[If an effect refers to a “[subtype] spell” or “[subtype] card,” it refers only to a spell or card that has that subtype. For example, March of the Drowned is a card that benefits Pirates and features Pirates in its illustration, but it isn’t a Pirate card.]=];};
};
};

{Name="Thundering Spineback";
SetCode="XLN";
Manacost="{{5}}{{G}}{{G}}";
cmc=7;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Uncommon";
Text=[=[Other Dinosaurs you control get +1/+1.<br/>
{{5}}{{G}}: Create a 3/3 green Dinosaur creature token with trample.]=];
Flavor=[=["It appears that nature has risen against us."<br/>
—Captain Brinely Rage]=];
CardNumber="XLN210";
Power="5";
Toughness="5";
MultiverseID=435366;
};

{Name="Tilonalli's Crown";
SetCode="RIX";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Common";
Text=[=[Enchant creature<br/>
When Tilonalli's Crown enters the battlefield, it deals 1 damage to enchanted creature.<br/>
Enchanted creature gets +3/+0 and has trample.]=];
CardNumber="RIX120";
MultiverseID=439777;
};

{Name="Tilonalli's Knight";
SetCode="XLN";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Human Knight";
Types={"Creature"};
SubTypes={"Human";"Knight";};
Rarity="Common";
Text=[=[Whenever Tilonalli's Knight attacks, if you control a Dinosaur, Tilonalli's Knight gets +1/+1 until end of turn.]=];
Flavor=[=[The people of the Sun Empire worship the sun in three aspects. Tilonalli is the Burning Sun, associated with ferocity, fire, and passion.]=];
CardNumber="XLN169";
Power="2";
Toughness="2";
MultiverseID=435323;
Rulings={
	{Date="2017-09-29";Text=[=[If you don’t control a Dinosaur as Tilonalli’s Knight attacks, its ability won’t trigger at all. If you don’t control a Dinosaur as the ability of Tilonalli’s Knight resolves, that ability has no effect.]=];};
	{Date="2017-09-29";Text=[=[Once the ability of Tilonalli’s Knight resolves while you control one or more Dinosaurs, Tilonalli’s Knight gets +1/+1 for the rest of the turn even if you no longer control a Dinosaur later in the turn.]=];};
};
};

{Name="Tilonalli's Skinshifter";
SetCode="XLN";
Manacost="{{2}}{{R}}";
cmc=3;
Colors={"Red"};
Type="Creature — Human Shaman";
Types={"Creature"};
SubTypes={"Human";"Shaman";};
Rarity="Rare";
Text=[=[Haste<br/>
Whenever Tilonalli's Skinshifter attacks, it becomes a copy of another target nonlegendary attacking creature until end of turn.]=];
Flavor=[=["I am the ferocity of the Burning Sun. I am hide and feather, fang and claw."]=];
CardNumber="XLN170";
Power="0";
Toughness="1";
MultiverseID=435324;
Rulings={
	{Date="2017-09-29";Text=[=[If the target of the ability of Tilonalli’s Skinshifter becomes an illegal target, Tilonalli’s Skinshifter won’t become a copy of anything. It will remain a 0/1 attacking creature.]=];};
	{Date="2017-09-29";Text=[=[Tilonalli’s Skinshifter copies the printed values of the target creature, plus any copy effects that have been applied to it. It won’t copy counters on that creature or effects that have changed its power, toughness, types, color, or so on.]=];};
	{Date="2017-09-29";Text=[=[Notably, Tilonalli’s Skinshifter won’t copy effects that make a noncreature permanent become a creature. If this causes Tilonalli’s Skinshifter to stop being a creature, it’s removed from combat.]=];};
	{Date="2017-09-29";Text=[=[If Tilonalli’s Skinshifter copies a creature that’s copying something else, it will become whatever the target is copying.]=];};
	{Date="2017-09-29";Text=[=[If an effect from a resolving spell or ability, such as that of Rallying Roar, begins to apply to Tilonalli’s Skinshifter before it becomes a copy of another creature, that effect will continue to apply.]=];};
	{Date="2017-09-29";Text=[=[Because attackers have already been declared, any abilities Tilonalli’s Skinshifter copies that trigger when it or other creatures attack won’t trigger.]=];};
	{Date="2017-09-29";Text=[=[Once the ability of Tilonalli’s Skinshifter resolves, its new characteristics don’t change if the characteristics of the copied creature change or if the copied creature leaves the battlefield.]=];};
	{Date="2017-09-29";Text=[=[Tilonalli’s Skinshifter remains a copy of the creature through the end step. Damage is removed from it at the same time that it stops being a copy.]=];};
};
};

{Name="Tilonalli's Summoner";
SetCode="RIX";
Manacost="{{1}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Human Shaman";
Types={"Creature"};
SubTypes={"Human";"Shaman";};
Rarity="Rare";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Whenever Tilonalli's Summoner attacks, you may pay {{X}}{{R}}. If you do, create X 1/1 red Elemental creature tokens that are tapped and attacking. At the beginning of the next end step, exile those tokens unless you have the city's blessing.]=];
CardNumber="RIX121";
Power="1";
Toughness="1";
MultiverseID=439778;
Rulings={
	{Date="2018-01-19";Text=[=[As each Elemental token enters the battlefield, you choose which opponent or opposing planeswalker it’s attacking. It doesn’t have to attack the same player or planeswalker that Tilonalli’s Summoner is attacking.]=];};
	{Date="2018-01-19";Text=[=[Whether you have the city’s blessing is checked only as the delayed triggered ability resolves during the end step. The tokens you create can help you ascend.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards have triggered abilities that check if you have the city’s blessing, but don’t use an intervening “if” clause. These abilities trigger regardless of whether you have the city’s blessing and check whether you do only as they resolve.]=];};
};
};

{Name="Timestream Navigator";
SetCode="RIX";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Creature — Human Pirate Wizard";
Types={"Creature"};
SubTypes={"Human";"Pirate";"Wizard";};
Rarity="Mythic Rare";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
{{2}}{{U}}{{U}}, {{Tap}}, Put Timestream Navigator on the bottom of its owner's library: Take an extra turn after this one. Activate this ability only if you have the city's blessing.]=];
CardNumber="RIX59";
Power="1";
Toughness="1";
MultiverseID=439716;
Rulings={
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
};
};

{Name="Tishana, Voice of Thunder";
SetCode="XLN";
Manacost="{{5}}{{G}}{{U}}";
cmc=7;
Colors={"Blue";"Green";};
Type="Legendary Creature — Merfolk Shaman";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Mythic Rare";
Text=[=[Tishana, Voice of Thunder's power and toughness are each equal to the number of cards in your hand.<br/>
You have no maximum hand size.<br/>
When Tishana enters the battlefield, draw a card for each creature you control.]=];
CardNumber="XLN230";
Power="*";
Toughness="*";
MultiverseID=435386;
Rulings={
	{Date="2017-09-29";Text=[=[The number of creatures you control is counted only as Tishana’s last ability resolves. If Tishana is still on the battlefield, it’ll count itself.]=];};
	{Date="2017-09-29";Text=[=[If Tishana enters the battlefield while you have no cards in hand, it will be put into your graveyard for having 0 toughness before its triggered ability resolves.]=];};
	{Date="2017-09-29";Text=[=[Because damage remains marked on a creature until it’s removed as the turn ends, the damage Tishana takes during combat may become lethal if cards leave your hand later in the turn, such as by casting them in your postcombat main phase.]=];};
};
};

{Name="Tishana's Wayfinder";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Merfolk Scout";
Types={"Creature"};
SubTypes={"Merfolk";"Scout";};
Rarity="Common";
Text=[=[When Tishana's Wayfinder enters the battlefield, it explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
Flavor=[=["There is always another way."]=];
CardNumber="XLN211";
Power="2";
Toughness="2";
MultiverseID=435367;
Rulings={
	{Date="2018-01-19";Text=[=[Once an ability that causes a creature to explore begins to resolve, no player may take any other actions until it’s done. Notably, opponents can’t try to remove the exploring creature after you reveal a nonland card but before it receives a counter.]=];};
	{Date="2018-01-19";Text=[=[If no card is revealed, most likely because that player’s library is empty, the exploring creature receives a +1/+1 counter.]=];};
	{Date="2018-01-19";Text=[=[If a resolving spell or ability instructs a specific creature to explore but that creature has left the battlefield, the creature still explores. If you reveal a nonland card this way, you won’t put a +1/+1 counter on anything, but you may put the revealed card into your graveyard. Effects that trigger “whenever a creature you control explores” trigger if appropriate.]=];};
};
};

{Name="Tocatli Honor Guard";
SetCode="XLN";
Manacost="{{1}}{{W}}";
cmc=2;
Colors={"White"};
Type="Creature — Human Soldier";
Types={"Creature"};
SubTypes={"Human";"Soldier";};
Rarity="Rare";
Text=[=[Creatures entering the battlefield don't cause abilities to trigger.]=];
Flavor=[=[The glorious city of Pachatupa is the center of the Sun Empire, and Tocatli, the emperor's palace, is its glowing heart.]=];
CardNumber="XLN42";
Power="1";
Toughness="3";
MultiverseID=435194;
Rulings={
	{Date="2017-09-29";Text=[=[Triggered abilities use the word “when,” “whenever,” or “at.” They’re usually written as “[Trigger condition], [effect].”]=];};
	{Date="2017-09-29";Text=[=[Replacement effects, such as a permanent entering the battlefield tapped or with counters on it, are unaffected. Abilities that apply “as [this creature] enters the battlefield” are replacement effects.]=];};
	{Date="2017-09-29";Text=[=[Tocatli Honor Guard’s ability stops a creature’s own enters-the-battlefield triggered abilities as well as other triggered abilities that would trigger when a creature enters the battlefield. This includes abilities that would trigger when Tocatli Honor Guard itself enters the battlefield.]=];};
	{Date="2017-09-29";Text=[=[The trigger event doesn’t have to specify “creatures” entering the battlefield. For example, Contraband Kingpin has an ability that says “Whenever an artifact enters the battlefield under your control, scry 1.” If an artifact creature enters the battlefield under your control, that ability won’t trigger. If a noncreature artifact enters the battlefield under your control, the ability will trigger.]=];};
	{Date="2017-09-29";Text=[=[Look at the permanent as it exists on the battlefield, taking into account continuous effects, to determine whether any triggered abilities will trigger. For example, if you control March of the Machines, which says, in part, “Each noncreature artifact is an artifact creature,” each artifact will be a creature at the time it enters the battlefield and will not cause triggered abilities to trigger.]=];};
	{Date="2017-09-29";Text=[=[If Tocatli Honor Guard and another creature enter the battlefield at the same time, neither creature entering the battlefield will cause triggered abilities to trigger.]=];};
};
};

{Name="Tomb of the Dusk Rose";
SetCode="RIX";
cmc=3;
Type="Legendary Land";
SuperTypes={"Legendary"};
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Profane Procession.)<br/>
{{Tap}}: Add one mana of any color to your mana pool.<br/>
{{2}}{{W}}{{B}}, {{Tap}}: Put a creature card exiled with this permanent onto the battlefield under your control.]=];
Flavor=[=[. . . resting in the splendor of the dead.]=];
CardNumber="RIX166b";
MultiverseID=439827;
Rulings={
	{Date="2018-01-19";Text=[=[If Profane Procession or Tomb of the Dusk Rose somehow has exiled cards other than with Profane Procession’s ability, those exiled cards aren’t linked to Tomb of the Dusk Rose’s second ability. They can’t be put onto the battlefield with that ability.]=];};
	{Date="2018-01-19";Text=[=[In a multiplayer game, if a player leaves the game, all cards that player owns leave as well. If you leave the game, any permanents you control from Tomb of the Dusk Rose’s ability are exiled.]=];};
};
};

{Name="Tomb Robber";
SetCode="RIX";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[Menace<br/>
{{1}}, Discard a card: Tomb Robber explores. (Reveal the top card of your library. Put that card into your hand if it's a land. Otherwise, put a +1/+1 counter on this creature, then put the card back or put it into your graveyard.)]=];
CardNumber="RIX87";
Power="1";
Toughness="1";
MultiverseID=439744;
};

{Name="Trapjaw Tyrant";
SetCode="RIX";
Manacost="{{3}}{{W}}{{W}}";
cmc=5;
Colors={"White"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Mythic Rare";
Text=[=[Enrage — Whenever Trapjaw Tyrant is dealt damage, exile target creature an opponent controls until Trapjaw Tyrant leaves the battlefield.]=];
Flavor=[=["I would advise you not to struggle."<br/>
—Huatli]=];
CardNumber="RIX29";
Power="5";
Toughness="5";
MultiverseID=439686;
Rulings={
	{Date="2018-01-19";Text=[=[If Trapjaw Tyrant leaves the battlefield before its triggered ability resolves (most likely because it was dealt lethal damage), the target creature won’t be exiled.]=];};
	{Date="2018-01-19";Text=[=[Auras attached to the exiled creature will be put into their owners’ graveyards. Any Equipment will become unattached and remain on the battlefield. Any counters on the exiled creature will cease to exist.]=];};
	{Date="2018-01-19";Text=[=[If a token is exiled this way, it will cease to exist and won’t return to the battlefield.]=];};
	{Date="2018-01-19";Text=[=[If multiple sources deal damage to a creature with an enrage ability at the same time, most likely because multiple creatures blocked that creature, the enrage ability triggers only once.]=];};
	{Date="2018-01-19";Text=[=[If lethal damage is dealt to a creature with an enrage ability, that ability triggers. The creature with that enrage ability leaves the battlefield before that ability resolves, so it won’t be affected by the resolving ability.]=];};
};
};

{Name="Traveler's Amulet";
SetCode="RIX";
Manacost="{{1}}";
cmc=1;
Type="Artifact";
Types={"Artifact"};
Rarity="Common";
Text=[=[{{1}}, Sacrifice Traveler's Amulet: Search your library for a basic land card, reveal it, put it into your hand, then shuffle your library.]=];
Flavor=[=["The best kind of treasure is the kind that leads to more treasure!"<br/>
—Captain Lannery Storm]=];
CardNumber="RIX184";
MultiverseID=439848;
};

{Name="Treasure Cove";
SetCode="XLN";
cmc=2;
Type="Land";
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Treasure Map.)<br/>
{{Tap}}: Add {{C}} to your mana pool.<br/>
{{Tap}}, Sacrifice a Treasure: Draw a card.]=];
Flavor=[=[Half the treasure is the glory of finding it.]=];
CardNumber="XLN250b";
MultiverseID=435411;
};

{Name="Treasure Map";
SetCode="XLN";
Manacost="{{2}}";
cmc=2;
Type="Artifact";
Types={"Artifact"};
Rarity="Rare";
Text=[=[{{1}}, {{Tap}}: Scry 1. Put a landmark counter on Treasure Map. Then if there are three or more landmark counters on it, remove those counters, transform Treasure Map, and create three colorless Treasure artifact tokens with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
CardNumber="XLN250a";
MultiverseID=435410;
Rulings={
	{Date="2017-09-29";Text=[=[If a third landmark counter is put on Treasure Map by something other than the resolution of its first ability (as modified by any applicable replacement effects), you won’t remove those counters, transform Treasure Map, or get Treasures yet. You’ll have to wait until you activate its first ability again.]=];};
	{Date="2017-09-29";Text=[=[If Treasure Map leaves the battlefield before its ability resolves, you can’t put a landmark counter on it. However, if it somehow already had three landmark counters on it before it left the battlefield, you’ll get three Treasures.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Trove of Temptation";
SetCode="XLN";
Manacost="{{3}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Enchantment";
Types={"Enchantment"};
Rarity="Uncommon";
Text=[=[Each opponent must attack you or a planeswalker you control with at least one creature each combat if able.<br/>
At the beginning of your end step, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
CardNumber="XLN171";
MultiverseID=435325;
Rulings={
	{Date="2017-09-29";Text=[=[Each opponent only has to attack you or a planeswalker you control with one creature total, not one creature for you and one for each planeswalker you control. Other creatures are free to attack other players or other planeswalkers, or to not attack at all.]=];};
	{Date="2017-09-29";Text=[=[If a creature isn’t able to attack you or a planeswalker you control for any reason (such as being tapped as its controller’s declare attackers step begins or being affected by “summoning sickness”), that creature doesn’t have to attack. If no creatures a player controls are able to attack you or a planeswalker you control, Trove of Temptation’s requirement has no effect during that combat. If there’s a cost associated with having a creature attack, its controller isn’t forced to pay that cost, so it doesn’t have to attack in that case either.]=];};
	{Date="2017-09-29";Text=[=[In a Two-Headed Giant game, each of your two opponents must attack your team or a planeswalker you control with at least one creature if able. Attacking a planeswalker your teammate controls doesn’t satisfy Trove of Temptation’s requirement. Combat damage from creatures attacking your team may be assigned to your teammate.]=];};
};
};

{Name="Twilight Prophet";
SetCode="RIX";
Manacost="{{2}}{{B}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Creature — Vampire Cleric";
Types={"Creature"};
SubTypes={"Vampire";"Cleric";};
Rarity="Mythic Rare";
Text=[=[Flying<br/>
Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
At the beginning of your upkeep, if you have the city's blessing, reveal the top card of your library and put it into your hand. Each opponent loses X life and you gain X life, where X is that card's converted mana cost.]=];
CardNumber="RIX88";
Power="2";
Toughness="4";
MultiverseID=439745;
Rulings={
	{Date="2018-01-19";Text=[=[If the mana cost of the revealed card includes {X}, X is considered to be 0.]=];};
	{Date="2018-01-19";Text=[=[If the revealed card doesn’t have a mana cost (because it’s a land card, for example), its converted mana cost is 0.]=];};
	{Date="2018-01-19";Text=[=[The converted mana cost of a split card, such as cards with aftermath from the Amonkhet block, is based on the combined mana cost of its two halves.]=];};
	{Date="2018-01-19";Text=[=[In a Two-Headed Giant game, Twilight Prophet’s last ability causes the opposing team to lose twice X life and you gain X life.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[Some cards have triggered abilities with an intervening “if” clause that checks whether you have the city’s blessing. These are worded “[Trigger condition], if you have the city’s blessing, [effect].” You must already have the city’s blessing in order for these abilities to trigger; otherwise they do nothing. In other words, there’s no way to have the ability trigger if you don’t have the city’s blessing, even if you intend to get it in response to the triggered ability.]=];};
};
};

{Name="Unclaimed Territory";
SetCode="XLN";
Type="Land";
Types={"Land"};
Rarity="Uncommon";
Text=[=[As Unclaimed Territory enters the battlefield, choose a creature type.<br/>
{{Tap}}: Add {{C}} to your mana pool.<br/>
{{Tap}}: Add one mana of any color to your mana pool. Spend this mana only to cast a creature spell of the chosen type.]=];
CardNumber="XLN258";
MultiverseID=435419;
Rulings={
	{Date="2018-01-19";Text=[=[To choose a creature type, you must choose an existing creature type, such as Vampire or Knight. You can’t choose multiple creature types, such as “Vampire Knight.” Card types such as artifact can’t be chosen, nor can subtypes that aren’t creature types, such as Jace, Vehicle, or Treasure.]=];};
};
};

{Name="Unfriendly Fire";
SetCode="XLN";
Manacost="{{4}}{{R}}";
cmc=5;
Colors={"Red"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Unfriendly Fire deals 4 damage to target creature or player.]=];
Flavor=[=[Disputes within the Brazen Coalition can escalate from insult to broadside in the blink of an eye.]=];
CardNumber="XLN172";
MultiverseID=435326;
};

{Name="Unknown Shores";
SetCode="XLN";
Type="Land";
Types={"Land"};
Rarity="Common";
Text=[=[{{Tap}}: Add {{C}} to your mana pool.<br/>
{{1}}, {{Tap}}: Add one mana of any color to your mana pool.]=];
Flavor=[=["Just imagine what's waiting around the bend. Adventure. Discovery. Riches for the taking. This is why I sail."<br/>
—Captain Lannery Storm]=];
CardNumber="XLN259";
MultiverseID=435420;
};

{Name="Vampire Champion";
SetCode="RIX";
Manacost="{{3}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Common";
Text=[=[Deathtouch (Any amount of damage this deals to a creature is enough to destroy it.)]=];
Flavor=[=["These pirates must answer for their ancestors, who renounced the Church of Dusk and sailed from Torrezon as heretics."]=];
CardNumber="RIX198";
Power="3";
Toughness="3";
MultiverseID=441892;
};

{Name="Vampire Revenant";
SetCode="RIX";
Manacost="{{3}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Creature — Vampire Spirit";
Types={"Creature"};
SubTypes={"Vampire";"Spirit";};
Rarity="Common";
Text=[=[Flying]=];
Flavor=[=["A thick fog obscures the port of Leor, but it's not thick enough to muffle the screams."<br/>
—Admiral Beckett Brass]=];
CardNumber="RIX89";
Power="3";
Toughness="1";
MultiverseID=439746;
};

{Name="Vampire's Zeal";
SetCode="XLN";
Manacost="{{W}}";
cmc=1;
Colors={"White"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Target creature gets +2/+2 until end of turn. If it's a Vampire, it gains first strike until end of turn.]=];
Flavor=[=[The Feast of Blood sends new life essence flowing through the vampire who partakes, manifesting as even greater strength and speed.]=];
CardNumber="XLN43";
MultiverseID=435195;
Rulings={
	{Date="2017-09-29";Text=[=[If the creature is a Vampire, it gets +2/+2 and gains first strike. If the creature becomes a Vampire later in the turn, it won’t gain first strike.]=];};
};
};

{Name="Vance's Blasting Cannons";
SetCode="XLN";
Manacost="{{3}}{{R}}";
cmc=4;
Colors={"Red"};
Type="Legendary Enchantment";
SuperTypes={"Legendary"};
Types={"Enchantment"};
Rarity="Rare";
Text=[=[At the beginning of your upkeep, exile the top card of your library. If it's a nonland card, you may cast that card this turn.<br/>
Whenever you cast your third spell in a turn, you may transform Vance's Blasting Cannons.]=];
Flavor=[=[With a broadside assault, Captain Vance carved the cliffs to form her new home.]=];
CardNumber="XLN173a";
MultiverseID=435327;
Rulings={
	{Date="2017-09-29";Text=[=[The card exiled by the first ability of Vance’s Blasting Cannons is exiled face up.]=];};
	{Date="2017-09-29";Text=[=[Casting the exiled card follows the normal rules for casting that card. You must pay its costs, and you must follow all applicable timing rules. For example, if you exile a creature card this way, you must wait until your main phase to cast it.]=];};
	{Date="2017-09-29";Text=[=[If you don’t cast the exiled card, it remains in exile.]=];};
	{Date="2017-09-29";Text=[=[The second ability of Vance’s Blasting Cannons resolves before the spell that caused it to trigger. The ability will resolve even if that spell is countered.]=];};
	{Date="2017-09-29";Text=[=[The second ability of Vance’s Blasting Cannons counts all the spells you’ve cast, including Vance’s Blasting Cannons itself if you cast it this turn. The ability won’t trigger unless Vance’s Blasting Cannons is on the battlefield as you cast your third spell of the turn.]=];};
	{Date="2018-01-19";Text=[=[For more information on double-faced cards, see the Ixalan mechanics article (http://magic.wizards.com/en/articles/archive/feature/ixalan-mechanics).]=];};
};
};

{Name="Vanquish the Weak";
SetCode="XLN";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Instant";
Types={"Instant"};
Rarity="Common";
Text=[=[Destroy target creature with power 3 or less.]=];
Flavor=[=[The clerics known as condemners punish those who do not recognize the righteous authority of the church.]=];
CardNumber="XLN127";
MultiverseID=435281;
};

{Name="Vanquisher's Banner";
SetCode="XLN";
Manacost="{{5}}";
cmc=5;
Type="Artifact";
Types={"Artifact"};
Rarity="Rare";
Text=[=[As Vanquisher's Banner enters the battlefield, choose a creature type.<br/>
Creatures you control of the chosen type get +1/+1.<br/>
Whenever you cast a creature spell of the chosen type, draw a card.]=];
CardNumber="XLN251";
MultiverseID=435412;
Rulings={
	{Date="2017-09-29";Text=[=[The choice of creature type is made as Vanquisher’s Banner enters the battlefield. Players can’t respond to this choice. The bonus starts applying immediately.]=];};
	{Date="2017-09-29";Text=[=[The last ability of Vanquisher’s Banner resolves before the spell that caused it to trigger. The ability will resolve even if the creature spell is countered.]=];};
	{Date="2018-01-19";Text=[=[To choose a creature type, you must choose an existing creature type, such as Vampire or Knight. You can’t choose multiple creature types, such as “Vampire Knight.” Card types such as artifact can’t be chosen, nor can subtypes that aren’t creature types, such as Jace, Vehicle, or Treasure.]=];};
};
};

{Name="Vault of Catlacan";
SetCode="RIX";
cmc=4;
Type="Legendary Land";
SuperTypes={"Legendary"};
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Storm the Vault.)<br/>
{{Tap}}: Add one mana of any color to your mana pool.<br/>
{{Tap}}: Add {{U}} to your mana pool for each artifact you control.]=];
Flavor=[=[Swimming in coins proved harder than they'd hoped, but dancing was a jingling delight.]=];
CardNumber="RIX173b";
MultiverseID=439835;
};

{Name="Verdant Rebirth";
SetCode="XLN";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Instant";
Types={"Instant"};
Rarity="Uncommon";
Text=[=[Until end of turn, target creature gains "When this creature dies, return it to its owner's hand."<br/>
Draw a card.]=];
Flavor=[=[The dryads of the forest have no stake in Ixalan's conflict, but they hate to see any living being suffer.]=];
CardNumber="XLN212";
MultiverseID=435368;
Rulings={
	{Date="2017-09-29";Text=[=[If the target creature is an illegal target by the time Verdant Rebirth resolves, the entire spell is countered. You won’t draw a card.]=];};
};
};

{Name="Verdant Sun's Avatar";
SetCode="XLN";
Manacost="{{5}}{{G}}{{G}}";
cmc=7;
Colors={"Green"};
Type="Creature — Dinosaur Avatar";
Types={"Creature"};
SubTypes={"Dinosaur";"Avatar";};
Rarity="Rare";
Text=[=[Whenever Verdant Sun's Avatar or another creature enters the battlefield under your control, you gain life equal to that creature's toughness.]=];
Flavor=[=["Ixalli's fertile rays enliven us all. Each of us is a testament to the sun's strength and love."<br/>
—Chitlati, Lightning Rider]=];
CardNumber="XLN213";
Power="5";
Toughness="5";
MultiverseID=435369;
Rulings={
	{Date="2017-09-29";Text=[=[The entering creature’s toughness is determined as the ability of Verdant Sun’s Avatar resolves. If that creature has left the battlefield, use its toughness as it last existed on the battlefield. If the creature’s toughness was less than 0, your life total won’t change.]=];};
};
};

{Name="Vicious Conquistador";
SetCode="XLN";
Manacost="{{B}}";
cmc=1;
Colors={"Black"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Uncommon";
Text=[=[Whenever Vicious Conquistador attacks, each opponent loses 1 life.]=];
Flavor=[=["He is ambitious. Tireless. And utterly ruthless. Ideal for the frontier."<br/>
—Viceroy Elia Sotonores, report to the queen]=];
CardNumber="XLN128";
Power="1";
Toughness="2";
MultiverseID=435282;
};

{Name="Vineshaper Mystic";
SetCode="XLN";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Merfolk Shaman";
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Uncommon";
Text=[=[When Vineshaper Mystic enters the battlefield, put a +1/+1 counter on each of up to two target Merfolk you control.]=];
Flavor=[=[She has never touched a loom, yet the tapestries she weaves are vast and beautiful.]=];
CardNumber="XLN214";
Power="1";
Toughness="3";
MultiverseID=435370;
Rulings={
	{Date="2017-09-29";Text=[=[You can’t target the same Merfolk twice to have it receive two +1/+1 counters.]=];};
	{Date="2017-09-29";Text=[=[Vineshaper Mystic can be the target of its own ability.]=];};
};
};

{Name="Vona, Butcher of Magan";
SetCode="XLN";
Manacost="{{3}}{{W}}{{B}}";
cmc=5;
Colors={"White";"Black";};
Type="Legendary Creature — Vampire Knight";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Mythic Rare";
Text=[=[Vigilance, lifelink<br/>
{{Tap}}, Pay 7 life: Destroy target nonland permanent. Activate this ability only during your turn.]=];
Flavor=[=["For four hundred years, I have led armies of conquest. These lands hold nothing that can stand against me."]=];
CardNumber="XLN231";
Power="4";
Toughness="4";
MultiverseID=435387;
Rulings={
	{Date="2017-09-29";Text=[=[Vona’s last ability can be activated during any step or phase of your turn, including the combat phase. It’s possible to attack with Vona and then activate its ability before blockers are declared. Doing so won’t remove Vona from combat.]=];};
};
};

{Name="Vona's Hunger";
SetCode="RIX";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Instant";
Types={"Instant"};
Rarity="Rare";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
Each opponent sacrifices a creature. If you have the city's blessing, instead each opponent sacrifices half the creatures he or she controls, rounded up.]=];
CardNumber="RIX90";
MultiverseID=439747;
Rulings={
	{Date="2018-01-19";Text=[=[When Vona’s Hunger resolves, first the player whose turn it is (if that player is an opponent) chooses which creature or creatures he or she will sacrifice, then each other opponent in turn order does the same, then all chosen creatures are sacrificed at the same time. Players will know choices made by earlier players when making their choices.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
};
};

{Name="Voracious Vampire";
SetCode="RIX";
Manacost="{{2}}{{B}}";
cmc=3;
Colors={"Black"};
Type="Creature — Vampire Knight";
Types={"Creature"};
SubTypes={"Vampire";"Knight";};
Rarity="Common";
Text=[=[Menace<br/>
When Voracious Vampire enters the battlefield, target Vampire you control gets +1/+1 and gains menace until end of turn.]=];
Flavor=[=[The purest devotion isn't the Blood Fast itself, but the craving that follows.]=];
CardNumber="RIX91";
Power="2";
Toughness="2";
MultiverseID=439748;
};

{Name="Vraska, Relic Seeker";
SetCode="XLN";
Manacost="{{4}}{{B}}{{G}}";
cmc=6;
Colors={"Black";"Green";};
Type="Legendary Planeswalker — Vraska";
SuperTypes={"Legendary"};
Types={"Planeswalker"};
SubTypes={"Vraska"};
Rarity="Mythic Rare";
Text=[=[+2: Create a 2/2 black Pirate creature token with menace.<br/>
−3: Destroy target artifact, creature, or enchantment. Create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."<br/>
−10: Target player's life total becomes 1.]=];
CardNumber="XLN232";
Loyalty="6";
MultiverseID=435388;
Rulings={
	{Date="2017-09-29";Text=[=[If the target artifact, creature, or enchantment is an illegal target by the time Vraska’s second ability resolves, the entire ability is countered. You won’t get a Treasure. If, on the other hand, the target is a legal target but isn’t destroyed (most likely because it has indestructible), you will get a Treasure.]=];};
	{Date="2017-09-29";Text=[=[For a player’s life total to become 1, what actually happens is that the player loses the appropriate amount of life (or in some rare cases, gains the appropriate amount of life). For example, if the targeted player’s life total is 4 when this ability resolves, that player loses 3 life. Other cards that interact with life loss will interact with this effect accordingly.]=];};
};
};

{Name="Vraska, Scheming Gorgon";
SetCode="RIX";
Manacost="{{4}}{{B}}{{B}}";
cmc=6;
Colors={"Black"};
Type="Legendary Planeswalker — Vraska";
SuperTypes={"Legendary"};
Types={"Planeswalker"};
SubTypes={"Vraska"};
Rarity="Mythic Rare";
Text=[=[+2: Creatures you control get +1/+0 until end of turn.<br/>
−3: Destroy target creature.<br/>
−10: Until end of turn, creatures you control gain deathtouch and "Whenever this creature deals damage to an opponent, that player loses the game."]=];
CardNumber="RIX197";
Loyalty="5";
MultiverseID=441891;
Rulings={
	{Date="2018-01-19";Text=[=[Vraska’s first and last abilities affect only creatures you control at the time it resolves. Creatures you begin to control later in the turn won’t get +1/+0 or gain abilities.]=];};
	{Date="2018-01-19";Text=[=[The triggered ability Vraska grants to creatures with her third ability triggers on any damage those creatures deal, including noncombat damage. If multiple players are dealt damage simultaneously by affected creatures, you choose the order in which those triggers resolve. If all your opponents have lost the game, you’ll win the game before any more of the triggers resolve.]=];};
};
};

{Name="Vraska's Conquistador";
SetCode="RIX";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Vampire Soldier";
Types={"Creature"};
SubTypes={"Vampire";"Soldier";};
Rarity="Uncommon";
Text=[=[Whenever Vraska's Conquistador attacks or blocks, if you control a Vraska planeswalker, target opponent loses 2 life and you gain 2 life.]=];
Flavor=[=[Abandoning both queen and church, he chose to follow power.]=];
CardNumber="RIX199";
Power="2";
Toughness="1";
MultiverseID=441893;
};

{Name="Vraska's Contempt";
SetCode="XLN";
Manacost="{{2}}{{B}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Instant";
Types={"Instant"};
Rarity="Rare";
Text=[=[Exile target creature or planeswalker. You gain 2 life.]=];
Flavor=[=[It wasn't long before the taverns of High and Dry were full of whispers about the new captain who could turn a person to stone with a glance.]=];
CardNumber="XLN129";
MultiverseID=435283;
Rulings={
	{Date="2017-09-29";Text=[=[If the target creature or planeswalker is an illegal target by the time Vraska’s Contempt resolves, the entire spell is countered. You won’t gain life.]=];};
	{Date="2018-01-19";Text=[=[There are many important moments in the story, but the most crucial—called “story spotlights”—are shown on cards. These cards have the Planeswalker symbol in their text box; this symbol has no effect on gameplay. You can read more about these events in the official Magic fiction at http://www.mtgstory.com.]=];};
};
};

{Name="Vraska's Scorn";
SetCode="RIX";
Manacost="{{2}}{{B}}{{B}}";
cmc=4;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Rare";
Text=[=[Target opponent loses 4 life. You may search your library and/or graveyard for a card named Vraska, Scheming Gorgon, reveal it, and put it into your hand. If you search your library this way, shuffle it.]=];
CardNumber="RIX200";
MultiverseID=441894;
};

{Name="Wakening Sun's Avatar";
SetCode="XLN";
Manacost="{{5}}{{W}}{{W}}{{W}}";
cmc=8;
Colors={"White"};
Type="Creature — Dinosaur Avatar";
Types={"Creature"};
SubTypes={"Dinosaur";"Avatar";};
Rarity="Mythic Rare";
Text=[=[When Wakening Sun's Avatar enters the battlefield, if you cast it from your hand, destroy all non-Dinosaur creatures.]=];
Flavor=[=["Kinjalli's encompassing rays herald new life in the moment of the sun's dawning."<br/>
—Chitlati, Lightning Rider]=];
CardNumber="XLN44";
Power="7";
Toughness="7";
MultiverseID=435196;
Rulings={
	{Date="2017-09-29";Text=[=[If you put Wakening Sun’s Avatar onto the battlefield from your hand without casting it, its ability won’t trigger.]=];};
	{Date="2017-09-29";Text=[=[If you cast a creature spell that enters the battlefield as a copy of Wakening Sun’s Avatar, such as Clone, the enters-the-battlefield ability will trigger.]=];};
};
};

{Name="Waker of the Wilds";
SetCode="XLN";
Manacost="{{2}}{{G}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Creature — Merfolk Shaman";
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Rare";
Text=[=[{{X}}{{G}}{{G}}: Put X +1/+1 counters on target land you control. That land becomes a 0/0 Elemental creature with haste. It's still a land.]=];
Flavor=[=["Our foes are many and mighty, but not as many as the trees or as mighty as the sea."]=];
CardNumber="XLN215";
Power="3";
Toughness="3";
MultiverseID=435371;
Rulings={
	{Date="2017-09-29";Text=[=[The land-animation effect lasts indefinitely. It doesn’t wear off during the cleanup step or when you lose control of Waker of the Wilds.]=];};
	{Date="2017-09-29";Text=[=[If the ability targets a land that’s already a creature, that land creature’s base power and toughness will become 0/0, overwriting its previous base power and toughness. Other effects that modify its power and/or toughness (including any +1/+1 counters that were on it) will continue to apply.]=];};
};
};

{Name="Walk the Plank";
SetCode="XLN";
Manacost="{{B}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Sorcery";
Types={"Sorcery"};
Rarity="Uncommon";
Text=[=[Destroy target non-Merfolk creature.]=];
Flavor=[=[When Captain Thorn adds a new ship to his fleet, he gives the crew a simple choice: follow me, or fall in the sea.]=];
CardNumber="XLN130";
MultiverseID=435284;
};

{Name="Wanted Scoundrels";
SetCode="XLN";
Manacost="{{1}}{{B}}";
cmc=2;
Colors={"Black"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Uncommon";
Text=[=[When Wanted Scoundrels dies, target opponent creates two colorless Treasure artifact tokens with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=["Trust me. The reward's not worth it."]=];
CardNumber="XLN131";
Power="4";
Toughness="3";
MultiverseID=435285;
};

{Name="Warkite Marauder";
SetCode="RIX";
Manacost="{{1}}{{U}}";
cmc=2;
Colors={"Blue"};
Type="Creature — Human Pirate";
Types={"Creature"};
SubTypes={"Human";"Pirate";};
Rarity="Rare";
Text=[=[Flying<br/>
Whenever Warkite Marauder attacks, target creature defending player controls loses all abilities and has base power and toughness 0/1 until end of turn.]=];
CardNumber="RIX60";
Power="2";
Toughness="1";
MultiverseID=439717;
Rulings={
	{Date="2018-01-19";Text=[=[Warkite Marauder’s ability overwrites all previous effects that set the creature’s base power and toughness to specific values. Any power- or toughness-setting effects that start to apply after the ability resolves will overwrite this effect.]=];};
	{Date="2018-01-19";Text=[=[If the affected creature gains an ability after Warkite Marauder’s ability resolves, it will keep that ability. If the affected creature has an ability that grants abilities to other objects, Warkite Marauder’s effect will stop it from doing so.]=];};
	{Date="2018-01-19";Text=[=[Effects that modify a creature’s power and/or toughness, such as the effect of Titanic Growth, will apply to the creature no matter when they started to take effect. The same is true for any counters that change its power and/or toughness and effects that switch its power and toughness.]=];};
};
};

{Name="Waterknot";
SetCode="RIX";
Manacost="{{1}}{{U}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Enchantment — Aura";
Types={"Enchantment"};
SubTypes={"Aura"};
Rarity="Common";
Text=[=[Enchant creature<br/>
When Waterknot enters the battlefield, tap enchanted creature.<br/>
Enchanted creature doesn't untap during its controller's untap step.]=];
CardNumber="RIX61";
MultiverseID=439718;
};

{Name="Watertrap Weaver";
SetCode="XLN";
Manacost="{{2}}{{U}}";
cmc=3;
Colors={"Blue"};
Type="Creature — Merfolk Wizard";
Types={"Creature"};
SubTypes={"Merfolk";"Wizard";};
Rarity="Common";
Text=[=[When Watertrap Weaver enters the battlefield, tap target creature an opponent controls. That creature doesn't untap during its controller's next untap step.]=];
Flavor=[=[The river is a powerful friend.]=];
CardNumber="XLN87";
Power="2";
Toughness="2";
MultiverseID=435240;
Rulings={
	{Date="2017-09-29";Text=[=[Watertrap Weaver’s ability can target a creature that’s already tapped. That creature won’t untap during its controller’s next untap step.]=];};
};
};

{Name="Wayward Swordtooth";
SetCode="RIX";
Manacost="{{2}}{{G}}";
cmc=3;
Colors={"Green"};
Type="Creature — Dinosaur";
Types={"Creature"};
SubTypes={"Dinosaur"};
Rarity="Rare";
Text=[=[Ascend (If you control ten or more permanents, you get the city's blessing for the rest of the game.)<br/>
You may play an additional land on each of your turns.<br/>
Wayward Swordtooth can't attack or block unless you have the city's blessing.]=];
CardNumber="RIX150";
Power="5";
Toughness="5";
MultiverseID=439807;
Rulings={
	{Date="2018-01-19";Text=[=[Wayward Swordtooth’s middle ability is cumulative if you control more than one. It’s also cumulative with other effects that let you play additional lands, such as the one from Enter the Unknown.]=];};
	{Date="2018-01-19";Text=[=[Once you have the city’s blessing, you have it for the rest of the game, even if you lose control of some or all of your permanents. The city’s blessing isn’t a permanent itself and can’t be removed by any effect.]=];};
	{Date="2018-01-19";Text=[=[A permanent is any object on the battlefield, including tokens and lands. Spells and emblems aren’t permanents.]=];};
	{Date="2018-01-19";Text=[=[If you cast a spell with ascend, you don’t get the city’s blessing until it resolves. Players may respond to that spell by trying to change whether you get the city’s blessing.]=];};
	{Date="2018-01-19";Text=[=[If you control ten permanents but don’t control a permanent or resolving spell with ascend, you don’t get the city’s blessing. For example, if you control ten permanents, lose control of one, then cast Golden Demise, you won’t have the city’s blessing and the spell will affect creatures you control.]=];};
	{Date="2018-01-19";Text=[=[If your tenth permanent enters the battlefield and then a permanent leaves the battlefield immediately afterwards (most likely due to the “Legend Rule” or due to being a creature with 0 toughness), you get the city’s blessing before it leaves the battlefield.]=];};
	{Date="2018-01-19";Text=[=[Ascend on a permanent isn’t a triggered ability and doesn’t use the stack. Players can respond to a spell that will give you your tenth permanent, but they can’t respond to getting the city’s blessing once you control that tenth permanent. This means that if your tenth permanent is a land you play, players can’t respond before you get the city’s blessing.]=];};
};
};

{Name="Wildgrowth Walker";
SetCode="XLN";
Manacost="{{1}}{{G}}";
cmc=2;
Colors={"Green"};
Type="Creature — Elemental";
Types={"Creature"};
SubTypes={"Elemental"};
Rarity="Uncommon";
Text=[=[Whenever a creature you control explores, put a +1/+1 counter on Wildgrowth Walker and you gain 3 life.]=];
Flavor=[=["Hear me, stone, root, branch: be the fist of this land. Turn back those who trample upon your domain."<br/>
—Song of the Shaper]=];
CardNumber="XLN216";
Power="1";
Toughness="3";
MultiverseID=435372;
Rulings={
	{Date="2017-09-29";Text=[=[If a creature leaves the battlefield before an effect instructs it to explore, it still explores. Effects that trigger when a creature you control explores, such as that of Wildgrowth Walker, trigger if appropriate.]=];};
	{Date="2017-09-29";Text=[=[If Wildgrowth Walker leaves the battlefield while its triggered ability is on the stack, you won’t put a +1/+1 counter on anything but you will gain 3 life.]=];};
};
};

{Name="Wily Goblin";
SetCode="XLN";
Manacost="{{R}}{{R}}";
cmc=2;
Colors={"Red"};
Type="Creature — Goblin Pirate";
Types={"Creature"};
SubTypes={"Goblin";"Pirate";};
Rarity="Uncommon";
Text=[=[When Wily Goblin enters the battlefield, create a colorless Treasure artifact token with "{{Tap}}, Sacrifice this artifact: Add one mana of any color to your mana pool."]=];
Flavor=[=[Goblins climb and swing with ease, whether through a pirate ship's rigging or a tree's branches.]=];
CardNumber="XLN174";
Power="1";
Toughness="1";
MultiverseID=435329;
};

{Name="Wind Strider";
SetCode="XLN";
Manacost="{{4}}{{U}}";
cmc=5;
Colors={"Blue"};
Type="Creature — Merfolk Wizard";
Types={"Creature"};
SubTypes={"Merfolk";"Wizard";};
Rarity="Common";
Text=[=[Flash<br/>
Flying]=];
Flavor=[=["Currents are currents, whether in sea or sky."]=];
CardNumber="XLN88";
Power="3";
Toughness="3";
MultiverseID=435241;
};

{Name="Winged Temple of Orazca";
SetCode="RIX";
cmc=3;
Type="Legendary Land";
SuperTypes={"Legendary"};
Types={"Land"};
Rarity="Rare";
Text=[=[(Transforms from Hadana's Climb.)<br/>
{{Tap}}: Add one mana of any color to your mana pool.<br/>
{{1}}{{G}}{{U}}, {{Tap}}: Target creature you control gains flying and gets +X/+X until end of turn, where X is its power.]=];
CardNumber="RIX158b";
MultiverseID=439816;
};

{Name="Woodland Stream";
SetCode="RIX";
Type="Land";
Types={"Land"};
Rarity="Uncommon";
Text=[=[Woodland Stream enters the battlefield tapped.<br/>
{{Tap}}: Add {{G}} or {{U}} to your mana pool.]=];
Flavor=[=[Countless streams flow into the nine rivers, and the nine rivers flow into the Great River. The River Heralds guard them all.]=];
CardNumber="RIX191";
MultiverseID=439855;
};

{Name="World Shaper";
SetCode="RIX";
Manacost="{{3}}{{G}}";
cmc=4;
Colors={"Green"};
Type="Creature — Merfolk Shaman";
Types={"Creature"};
SubTypes={"Merfolk";"Shaman";};
Rarity="Rare";
Text=[=[Whenever World Shaper attacks, you may put the top three cards of your library into your graveyard.<br/>
When World Shaper dies, put all land cards from your graveyard onto the battlefield tapped.]=];
Flavor=[=["The Great River will not be tamed."]=];
CardNumber="RIX151";
Power="3";
Toughness="3";
MultiverseID=439808;
};

{Name="Zacama, Primal Calamity";
SetCode="RIX";
Manacost="{{6}}{{R}}{{G}}{{W}}";
cmc=9;
Colors={"White";"Red";"Green";};
Type="Legendary Creature — Elder Dinosaur";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Elder";"Dinosaur";};
Rarity="Mythic Rare";
Text=[=[Vigilance, reach, trample<br/>
When Zacama, Primal Calamity enters the battlefield, if you cast it, untap all lands you control.<br/>
{{2}}{{R}}: Zacama deals 3 damage to target creature.<br/>
{{2}}{{G}}: Destroy target artifact or enchantment.<br/>
{{2}}{{W}}: You gain 3 life.]=];
CardNumber="RIX174";
Power="9";
Toughness="9";
MultiverseID=439836;
Rulings={
	{Date="2018-01-19";Text=[=[Zacama’s triggered ability triggers if you cast it from any zone. It doesn’t trigger if you put Zacama onto the battlefield without casting it.]=];};
	{Date="2018-01-19";Text=[=[Zacama’s damage-dealing ability can be activated during combat, perhaps targeting a creature blocking it. If all creatures blocking Zacama are destroyed, its combat damage is assigned to the player or planeswalker it’s attacking because of trample. If the blocking creatures are dealt nonlethal damage, that damage is considered when assigning trample damage.]=];};
};
};

{Name="Zetalpa, Primal Dawn";
SetCode="RIX";
Manacost="{{6}}{{W}}{{W}}";
cmc=8;
Colors={"White"};
Type="Legendary Creature — Elder Dinosaur";
SuperTypes={"Legendary"};
Types={"Creature"};
SubTypes={"Elder";"Dinosaur";};
Rarity="Rare";
Text=[=[Flying, double strike, vigilance, trample, indestructible]=];
Flavor=[=[The sky takes flight and the earth trembles.]=];
CardNumber="RIX30";
Power="4";
Toughness="8";
MultiverseID=439687;
Rulings={
	{Date="2018-01-19";Text=[=[If an attacking creature with double strike and trample destroys all of its blocking creatures with first-strike combat damage, all of its normal combat damage is assigned to the player or planeswalker that creature’s attacking.]=];};
};
};

};
return data

