require "common.file"

local file = 'day_01/day1-input.txt'
local lines = lines_from(file)

local floor = 0
local count = 0

local items = string.gmatch(lines[1], ".")

for item in items do
    if item == '(' then
        floor = floor + 1
    elseif item == ')' then
        floor = floor - 1
    end

    count = count + 1

    if floor == -1 then
        break
    end
end

print('DAY 1.2 : ' .. count)