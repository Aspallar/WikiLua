local data = require("data\\datacards")

if originalRequire then
	print("ERROR: (wikienv.lua) originalRequire already defined")
	os.exit()
end
originalRequire = require

function require(modulepath)
	if string.sub(modulepath, 1, 7) == "Module:" then
		modulepath = "wikia\\" .. modulepath.sub(modulepath, 8)
	end
	return originalRequire(modulepath)
end

function unpack(arg)
	return table.unpack(arg)
end 

mw = {}
function mw.loadData(tableName)
	return data
end
