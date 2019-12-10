require "common.file"
require "day_02.present"

local file = 'day_02/day2-input.txt'
local lines = lines_from(file)
local total_size = 0

for _, item in pairs(lines) do
    total_size = total_size + math.floor(Present:new(item):calculate_wrapping())
end

print("DAY 2.1 : " .. total_size)