require "common.file"

function calculate_fuel(mass)
    return math.floor(mass / 3) - 2
end

local file = 'day_1/day1-input.txt'
local lines = lines_from(file)
local sum = 0

for _, v in pairs(lines) do 
    sum = sum + calculate_fuel(v)
end

print('DAY 1.1 : ' .. sum)

return sum