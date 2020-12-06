require 'common.file'

M = require 'lib.Moses'

local lines = lines_from('day_02/day_02-input.txt')

local success_count = 0

M.each(lines, function(v1, i1) 
    local _, _, am1, am2, ltr, str = v1:find("(%d*)-(%d*) (%a+): (%a*)")
    local idx1, _ = str:sub(am1, am1) 
    local idx2, _ = str:sub(am2, am2) 

    if (idx1 == ltr and idx2 ~= ltr) or (idx2 == ltr and idx1 ~= ltr) then
        success_count = success_count + 1
    end
end)

print('day_02-2', success_count)
