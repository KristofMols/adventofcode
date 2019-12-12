require "day_03.day3-1"

local robo_x = 0
local robo_y = 0
local current_x = 0
local current_y = 0
local index = 0
local total_count = 0

clear_locations()

for current_char in string.gmatch(lines[1], ".") do
    if index % 2 == 0 then
        current_x, current_y = move_character(current_char, current_x, current_y)
    else
        robo_x, robo_y = move_character(current_char, robo_x, robo_y)
    end

    index = index + 1
end

for _, location in pairs(get_locations()) do
    if location:get_amount() > 0 then total_count = total_count + 1 end
end

print("DAY : 3.2 : " .. total_count)