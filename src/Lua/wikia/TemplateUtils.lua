-- <nowiki>
local p = {}

-------------------------------
------- ExplodeForeach --------
-------------------------------
-- Arguments are as follow :
--1 = template name
--2 = a string to process
--3 = that string's separators
--delim = the delimiter between the resulting templates
function p.ExplodeForeach(frame)
	local args = frame:getParent().args
	if args[2] == nil then
		return ""
	end

	local template = args[1]
	local inputs = mw.text.split( args[2], args[3])
	local delimiter = args.delim

	for i = 1, #inputs do
		if not (inputs[i] == "") then -- No empty strings will be processed
			inputs[i] = frame:expandTemplate{ title = template, args = { inputs[i] } }
		end
	end

	return table.concat( inputs, delimiter)
end

function p.RecreateTable(inputTable)
	local outputTable = {}
	for k,v in pairs(inputTable) do
		outputTable[k] = v
	end
	return outputTable
end

function p.MakeTableWriteable(oldTable)
    local newTable = setmetatable( {}, { __index = oldTable });
    return newTable
end

function p.PreProcess(frame,s)
	return (frame and frame.preprocess and frame:preprocess(s)) or s
end

function p.UnpackArgs(args)
	return unpack(p.RecreateTable(args))
end

function p.Error(text)
	return string.format("<div class='error'>Error: %s</div>",text)
end

function p.ExpandSymbols(text)
    if string.find(text, "{") == nil then
        return text, false
    else
        return text
            :gsub("{Tap}", "{{Tap}}")
            :gsub("{T}", "{{Tap}}")
            :gsub("{(.)/?(.?)}", "{{%1%2}}"), true
    end
end

return p
-- </nowiki>
