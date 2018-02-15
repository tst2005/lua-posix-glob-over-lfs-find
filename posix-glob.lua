local globtopattern = require 'globtopattern'.globtopattern
local lfs = require "lfs"

local function globlike(filemask, searchdir)
	filemask = filemask or "*"
	searchdir = searchdir or "."

	local hidedotfiles = filemask:sub(1,1)~="."
	local pattern = globtopattern(filemask)
	local r = {}
	for d in lfs.dir(searchdir) do
		if d~="." and d~=".." and
		(( not hidedotfiles and d:sub(1,1)==".") or (hidedotfiles and d:sub(1,1)~=".") ) and
		d:find(pattern) then
				table.insert(r, d)
		end
	end
	return r
end
return globlike
