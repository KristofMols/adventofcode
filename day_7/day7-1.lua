require "common.file"
require "common.util"
require "common.permutation"

local best_result = 0
local operation_count = 0
local stored_value = 0
local current_input = nil
local input_count = 0
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
    local modes = get_modes(opcode)

    if modes[1] == 1 then
        if modes[3] == nil or modes[3] == 0 then first = tab[first + 1] end
        if modes[4] == nil or modes[4] == 0 then second = tab[second + 1] end

        local result = math.floor(first + second)
        tab[res + 1] = result

        operation_count = operation_count + 4
    elseif modes[1] == 2 then
        if modes[3] == nil or modes[3] == 0 then first = tab[first + 1] end
        if modes[4] == nil or modes[4] == 0 then second = tab[second + 1] end

        local result = math.floor(first * second)
        tab[res + 1] = result

        operation_count = operation_count + 4
    elseif modes[1] == 3 then
        if (input_count == 0) then
            tab[first + 1] = current_input
            input_count = input_count + 1
        else
            tab[first + 1] = stored_value
        end

        operation_count = operation_count + 2
    elseif modes[1] == 4 then
        if modes[3] == nil or modes[3] == 0 then first = tab[first + 1] end
        result = first

        operation_count = operation_count + 2
    elseif modes[1] == 5 then
        if modes[3] == nil or modes[3] == 0 then first = tab[first + 1] end
        if modes[4] == nil or modes[4] == 0 then second = tab[second + 1] end

        if first ~= 0 then
            operation_count = second
        else
            operation_count = operation_count + 3
        end
    elseif modes[1] == 6 then
        if modes[3] == nil or modes[3] == 0 then first = tab[first + 1] end
        if modes[4] == nil or modes[4] == 0 then second = tab[second + 1] end

        if first == 0 then
            operation_count = second
        else
            operation_count = operation_count + 3
        end
    elseif modes[1] == 7 then
        if modes[3] == nil or modes[3] == 0 then first = tab[first + 1] end
        if modes[4] == nil or modes[4] == 0 then second = tab[second + 1] end

        if first < second then
            tab[res + 1] = 1
        else
            tab[res + 1] = 0
        end

        operation_count = operation_count + 4
    elseif modes[1] == 8 then
        if modes[3] == nil or modes[3] == 0 then first = tab[first + 1] end
        if modes[4] == nil or modes[4] == 0 then second = tab[second + 1] end

        if first == second then
            tab[res + 1] = 1
        else
            tab[res + 1] = 0
        end

        operation_count = operation_count + 4
    elseif modes[1] == 99 then
        operation_count = 1000
    else
        operation_count = 1000
    end
end

local file = 'day_7/day7-input.txt'

function calculate_program(input)
    local lines = lines_from(file)
    local items = split_num(lines[1], "[^,]*")
    current_input = input

    while operation_count <= #items do
        opcode, first, second, res = get_4_items(items, operation_count)
        exec_opcode(items, opcode, first, second, res)
    end
end

for phases in perm{0, 1, 2, 3, 4} do
    for _, phase in ipairs(phases) do
        calculate_program(phase)

        stored_value = result
        operation_count = 0
        input_count = 0
    end

    if result > best_result then
        best_result = result
    end

    operation_count = 0
    stored_value = 0
    current_input = nil
    input_count = 0
    result = nil
end

print("DAY 7.1 : " .. best_result)
