local data = require("data\\datacards")

mw = {}
function mw.loadData(tableName)
	return data
end

function unpack(arg)
	return table.unpack(arg)
end 
