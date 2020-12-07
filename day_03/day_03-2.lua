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

function calculate_trees(down, right)
    local x_pos = 1
    local result = 0

    for i = 1, #input_map, down do
        if input_map[i][x_pos] == '#' then result = result + 1 end
        x_pos = x_pos + right
        if x_pos > #input_map[i] then x_pos = x_pos - #input_map[i] end
    end

    return result
end

result = calculate_trees(1, 1)
result = result * calculate_trees(1, 3)
result = result * calculate_trees(1, 5)
result = result * calculate_trees(1, 7)
result = result * calculate_trees(2, 1)

print('day_03-2', result)
