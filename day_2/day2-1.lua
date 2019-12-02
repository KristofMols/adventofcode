require "common.file"

function split(str, pat)
    local tbl = {}
    str:gsub(pat, function(x) tbl[#tbl + 1] = x end)
    return tbl
end

function get_4_items(tab, start)
    return tab[start + 1], tab[start + 2], tab[start + 3], tab[start + 4]
end

function exec_opcode(tab, opcode, first, second, res)
    if opcode == '1' then
        local result = math.floor(tab[first + 1] + tab[second + 1])
        tab[res + 1] = result
    elseif opcode == '2' then
        local result = math.floor(tab[first + 1] * tab[second + 1])
        tab[res + 1] = result
    elseif opcode == '99' then
        -- print("STOP")
    else
        -- print("ERROR")
    end
end

local file = 'day_2/day2-input.txt'
local lines = lines_from(file)

function calculate_program(noun, verb)
    for _, line in pairs(lines) do
        local items = split(line, "[^,]*")
        local operation_count = 0

        items[2] = noun
        items[3] = verb

        while operation_count <= #items do
            opcode, first, second, res = get_4_items(items, operation_count)
            exec_opcode(items, opcode, first, second, res)
            operation_count = operation_count + 4
        end

        return items[1]
    end
end

result = calculate_program(12, 2)

print("DAY 2.1 : " .. result)