local data = require("data\\datacards")

if originalRequire then
	print("ERROR: (wikienv.lua) originalRequire already defined")
	os.exit()
end
originalRequire = require

function require(modulepath)
	if string.sub(modulepath, 1, 7) == "Module:" then
		modulepath = "wikia\\" .. modulepath.sub(modulepath, 8)
	elseif string.sub(modulepath, 1, 4) == "Dev:" then
		modulepath = "dev\\" .. modulepath.sub(modulepath, 5)
	end
	return originalRequire(modulepath)
end

function unpack(arg)
	return table.unpack(arg)
end 

mw = {}
mw.text = {}
function mw.loadData(tableName)
	return data
end

function mw.log(s)
	print("**** LOG: " .. s)
end

function mw.text.split(s, delimiter)
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( s, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( s, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( s, delimiter, from  )
  end
  table.insert( result, string.sub( s, from  ) )
  return result
end

function mw.text.encode(s)
	return s
end

