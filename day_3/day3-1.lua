require "common.file"
require "common.util"
require "day_3.coordinate"

local file = 'day_3/day3-input.txt'
local lines = lines_from(file)
loc1 = {}
loc2 = {}
local lowest_match = nil
local total_steps = 0

local function go_up(loc, last_pos_x, last_pos_y, amount)
    for count = 1, amount, 1 do
        last_pos_x = last_pos_x - 1
        total_steps = total_steps + 1
        loc[last_pos_x .. '|' .. last_pos_y] = Coordinate:new(last_pos_x, last_pos_y, total_steps)
    end

    return last_pos_x, last_pos_y
end

local function go_right(loc, last_pos_x, last_pos_y, amount)
    for count = 1, amount, 1 do
        last_pos_y = last_pos_y + 1
        total_steps = total_steps + 1
        loc[last_pos_x .. '|' .. last_pos_y] = Coordinate:new(last_pos_x, last_pos_y, total_steps)
    end

    return last_pos_x, last_pos_y
end

local function go_down(loc, last_pos_x, last_pos_y, amount)
    for count = 1, amount, 1 do
        last_pos_x = last_pos_x + 1
        total_steps = total_steps + 1
        loc[last_pos_x .. '|' .. last_pos_y] = Coordinate:new(last_pos_x, last_pos_y, total_steps)
    end

    return last_pos_x, last_pos_y
end

local function go_left(loc, last_pos_x, last_pos_y, amount)
    for count = 1, amount, 1 do
        last_pos_y = last_pos_y - 1
        total_steps = total_steps + 1
        loc[last_pos_x .. '|' .. last_pos_y] = Coordinate:new(last_pos_x, last_pos_y, total_steps)
    end

    return last_pos_x, last_pos_y
end

local function calculate_distance(pos_x, pos_y)
    return math.abs(pos_x) + math.abs(pos_y)
end

local function follow_path(loc, wire)
    local items = split(wire, "[^,]*")
    local last_pos_x = 0
    local last_pos_y = 0
    for _, item in pairs(items) do
        local dir = item:sub(1, 1)
        local cnt = item:sub(2)
        if dir == 'U' then
            last_pos_x, last_pos_y = go_up(loc, last_pos_x, last_pos_y, cnt)
        elseif dir == 'R' then
            last_pos_x, last_pos_y = go_right(loc, last_pos_x, last_pos_y, cnt)
        elseif dir == 'D' then
            last_pos_x, last_pos_y = go_down(loc, last_pos_x, last_pos_y, cnt)
        elseif dir == 'L' then
            last_pos_x, last_pos_y = go_left(loc, last_pos_x, last_pos_y, cnt)
        else
            print('NO DIRECTION FOUND FOR ' .. dir)
        end
    end

    total_steps = 0
end

follow_path(loc1, lines[1])
follow_path(loc2, lines[2])

for key, val in pairs(loc1) do
    if loc2[key] ~= nil then
        local match = calculate_distance(val:getX(), val:getY())
        if lowest_match == nil or match < lowest_match then
            lowest_match = match
        end
    end
end

print("DAY 3.1 : " .. math.floor(lowest_match))
