require "common.file"
require "day_03.coordinate"

local file = 'day_03/day3-input.txt'
local lines = lines_from(file)
local total_count = 0
local current_x = 0
local current_y = 0
local locations = {}

function add_or_update_location()
    local location = locations[current_x .. '|' .. current_y]
    if location == nil then
        locations[current_x .. '|' .. current_y] = Coordinate:new(current_x, current_y)
    else
        location:add_amount(1)
    end
end

add_or_update_location()

for current_char in string.gmatch(lines[1], ".") do
    if current_char == '<' then
        current_x = current_x - 1
        add_or_update_location()
    elseif current_char == '>' then
        current_x = current_x + 1
        add_or_update_location()
    elseif current_char == '^' then
        current_y = current_y + 1
        add_or_update_location()
    elseif current_char == 'v' then
        current_y = current_y - 1
        add_or_update_location()
    end
end

for _, location in pairs(locations) do
    if location:get_amount() > 0 then total_count = total_count + 1 end
end

print("DAY : 3.1 : " .. total_count)
