require "common.file"
require "common.util"

local stored_value = 1
local result = nil

function get_4_items(tab, start)
    return tab[start + 1], tab[start + 2], tab[start + 3], tab[start + 4]
end

function get_modes(code)
    local modes = {}
    while code ~= 0 do
        lastDigit = code % 10
        code = math.floor(code / 10)
    
        modes[#modes + 1] = math.floor(lastDigit)
    end

    return modes
end

function exec_opcode(tab, opcode, first, second, res)
    print(opcode .. '|' .. first .. '|' .. second .. '|' .. res)
    local modes = get_modes(opcode)

    if modes[1] == 1 then
        if modes[3] == nil or modes[3] == 0 then
            first = tab[first + 1]
        end
    
        if modes[4] == nil or modes[4] == 0 then
            second = tab[second + 1]
        end
        local result = math.floor(first + second)
        tab[res + 1] = result
        return 4
    elseif modes[1] == 2 then
        if modes[3] == nil or modes[3] == 0 then
            first = tab[first + 1]
        end
    
        if modes[4] == nil or modes[4] == 0 then
            second = tab[second + 1]
        end
        local result = math.floor(first * second)
        tab[res + 1] = result
        return 4
    elseif modes[1] == 3 then
        tab[first + 1] = stored_value
        return 2
    elseif modes[1] == 4 then
        result = tab[first + 1]
        return 2
    elseif modes[1] == 99 then
        -- print("STOP")
        return 1000
    else
        -- print("ERROR")
        return 1000
    end
end

local file = 'day_5/day5-input.txt'
local lines = lines_from(file)

function calculate_program()
    for _, line in pairs(lines) do
        local items = split(line, "[^,]*")
        local operation_count = 0

        while operation_count <= #items do
            opcode, first, second, res = get_4_items(items, operation_count)
            operation_count = operation_count + exec_opcode(items, opcode, first, second, res)
        end
    end
end

calculate_program()

print("DAY 5.1 : " .. result)