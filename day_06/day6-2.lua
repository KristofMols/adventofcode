require "day_06.day6-1"

local lights = get_lights()
local total_count = 0

for _, v in pairs(lights) do total_count = total_count + v end

print("DAY 6.2", total_count)
