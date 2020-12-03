require 'common.file'

M = require 'lib.Moses'

local lines = lines_from('day_01/day_01-input.txt')

M.each(lines, function(v1, i1) 
    M.each(lines, function(v2, i2) 
        if i2 > i1 then
            if v1 + v2 == 2020 then
                print('day_01-1', v1 * v2)
            end
        end
    end)
end)