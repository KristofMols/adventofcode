require "common.file"
require "day_06.light_matrix"

local file = 'day_06/day6-input.txt'
local lines = lines_from(file)

local grid_size_x = 1000
local grid_size_y = 1000
local total_count = 0
local lights = {}

function execute()
    for _, line in pairs(lines) do
        local action, start_x, start_y, stop_x, stop_y = string.match(line, "(.*) (%d*),(%d*) through (%d*),(%d*)")
        local matrix = LightMatrix:new(lights, action, start_x, start_y, stop_x, stop_y)
        matrix:execute_action()
        lights = matrix:get_lights()
    end
end

execute()

function get_lights() return lights end

for _, v in pairs(lights) do
    if v then
        total_count = total_count + 1
    end
end

print("DAY 6.1", total_count)