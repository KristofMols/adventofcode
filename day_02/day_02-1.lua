require 'common.file'

M = require 'lib.Moses'

local lines = lines_from('day_02/day_02-input.txt')

local success_count = 0

M.each(lines, function(v1, i1) 
    local _, _, am1, am2, ltr, str = v1:find("(%d*)-(%d*) (%a+): (%a*)")
    local _, count = str:gsub(ltr, "")

    if count <= tonumber(am2) and count >= tonumber(am1) then
        success_count = success_count + 1
    end
end)

print('day_02-1', success_count)
