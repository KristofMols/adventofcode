require "common.file"
require "common.util"
require "common.permutation"
require "day_7.amplifier"

best_result = 0

local file = 'day_7/day7-input.txt'

for phases in perm{0, 1, 2, 3, 4} do
    local lines = lines_from(file)
    local items = split_num(lines[1], "[^,]*")
    
    local amp = Amplifier:new(phases, items, result)

    amp:execute()

    local result = amp:get_result()

    if result > best_result then best_result = result end
end

print("DAY 7.1 : " .. best_result)
