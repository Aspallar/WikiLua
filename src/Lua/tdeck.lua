local wikienv = require("wikienv")
local decks = require("wikia\\decks")

if arg[1] == nil then
    print("Usage:")
    print(" tdeck.lua <deck filename> [<commander> [<back to>]]")
    return
end

io.input(arg[1])
local deckList = io.read("*all")

local frame = wikienv.MakeUpstreamFrame({
    Name = "Test Deck";
    Deck = deckList;
    Commander = arg[2];
    BackTo = arg[3];
})

local result = decks.GenerateDeckFromList(frame)
print(result)

