require 'common.file'

M = require 'lib.Moses'

local lines = lines_from('day_03/day_03-input.txt')

local input_map = {}
local result = 0

M.each(lines, function(v1, i1)
    input_map[i1] = {}
    for i = 1, #v1 do
        input_map[i1][i] = v1:sub(i, i)
    end
end)

x_pos = 1

for i = 1, #input_map do
    if input_map[i][x_pos] == '#' then result = result + 1 end
    x_pos = x_pos + 3
    if x_pos > #input_map[i] then x_pos = x_pos - #input_map[i] end
end

print('day_03-1', result)
