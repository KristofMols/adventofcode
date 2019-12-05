require "common.file"
require "day_2.present"

local file = 'day_2/day2-input.txt'
local lines = lines_from(file)
local total_ribbon = 0
local total_bow = 0

for _, item in pairs(lines) do
    local present = Present:new(item)
    total_ribbon = total_ribbon + math.floor(present:calculate_ribbon())
    total_bow = total_bow + math.floor(present:calculate_bow())
end

print("DAY 2.2 : " .. total_ribbon + total_bow)