require "common.file"
require "day_03.coordinate"

local file = 'day_03/day3-input.txt'
local lines = lines_from(file)
local total_count = 0
local current_x = 0
local current_y = 0
local locations = {}

function add_or_update_location(cur_x, cur_y)
    local location = locations[cur_x .. '|' .. cur_y]
    if location == nil then
        locations[cur_x .. '|' .. cur_y] = Coordinate:new(cur_x, cur_y)
    else
        location:add_amount(1)
    end
end

add_or_update_location(current_x, current_y)

function move_character(current_char, cur_x, cur_y) 
    if current_char == '<' then
        cur_x = cur_x - 1
    elseif current_char == '>' then
        cur_x = cur_x + 1
    elseif current_char == '^' then
        cur_y = cur_y + 1
    elseif current_char == 'v' then
        cur_y = cur_y - 1
    end

    add_or_update_location(cur_x, cur_y)

    return cur_x, cur_y
end

for current_char in string.gmatch(lines[1], ".") do
    current_x, current_y = move_character(current_char, current_x, current_y)
end

function get_locations() return locations end

function clear_locations() locations = {} end

for _, location in pairs(locations) do
    if location:get_amount() > 0 then total_count = total_count + 1 end
end

print("DAY : 3.1 : " .. total_count)
