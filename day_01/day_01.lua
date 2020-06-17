require "common.file"
require "common.util"

local M = require "lib.Moses"
local Coordinate = require "day_01.Coordinate"

local file = 'day_01/day_01-input.txt'
local lines = lines_from(file)

local start_coord = Coordinate(0, 0)
local curr_coord  = Coordinate(0, 0)

local function calculate_distance()
    return math.abs(start_coord.pos_x - curr_coord.pos_x) + math.abs(start_coord.pos_y - curr_coord.pos_y)
end

M.each(
    lines,
    function(line)
        M.each(
            split(line, '[^, ]*'),
            function(item)
                local amount = split(item, "[^R|L]")[1]
                if item:find('^L') then
                    curr_coord:go_left (amount)
                elseif item:find('^R') then
                    curr_coord:go_right(amount)
                end
            end
        )
    end
)

print(calculate_distance())