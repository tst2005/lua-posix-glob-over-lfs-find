local globlike = require "posix-glob"
local filemask,searchdir = ...
local r = globlike(filemask, searchdir)
table.sort(r)
for i,v in ipairs(r) do
	print(i,v)
end

