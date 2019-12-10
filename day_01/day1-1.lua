require "common.file"

local file = 'day_01/day1-input.txt'
local lines = lines_from(file)

local floor = 0

local items = string.gmatch(lines[1], ".")

for item in items do
    if item == '(' then
        floor = floor + 1
    elseif item == ')' then
        floor = floor - 1
    end
end

print('DAY 1.1 : ' .. floor)