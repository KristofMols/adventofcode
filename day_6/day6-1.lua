require "common.file"
require "common.util"

local file = 'day_6/day6-input.txt'
local lines = lines_from(file)
local star_map = {}
local total_count = 0

function create_star_map()
    for _, line in ipairs(lines) do
        local _, _, k, v = string.find(line, '(.*)[)](.*)')

        star_map[v] = k
    end
end

function calculate_distance()
    for k, v in pairs(star_map) do
        local key = v
        while key ~= nil do
            total_count = total_count + 1
            key = star_map[key]
        end
    end
end

create_star_map()
calculate_distance()

print("DAY 6 : " .. total_count)
