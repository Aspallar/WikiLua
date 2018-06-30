require("wikienv")
local rulings = mw.loadData("Module:Data/Rulings")
local rule1 = rulings[426779]
local rule2 = rulings[666]
print("start")
print(rule1)
print(rule2)
for _, v in pairs(rule1) do
    print(v.Text)
end
