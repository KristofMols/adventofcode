require "file"

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
        tab[res + 1] = math.floor(tab[first + 1] + tab[second + 1])
    elseif opcode == '2' then
        tab[res + 1] = math.floor(tab[first + 1] * tab[second + 1])
    elseif opcode == '99' then
        print("STOP")
    else
        print("ERROR")
    end
end

local file = 'day2-input.txt'
local lines = lines_from(file)

for _, line in pairs(lines) do
    local items = split(line, "[^,]*")
    local operation_count = 0

    print(table.concat(items, ","))

    while operation_count <= #items do
        opcode, first, second, res = get_4_items(items, 0)
        exec_opcode(items, opcode, first, second, res)
        print(table.concat(items, ","))
        operation_count = operation_count + 4
    end
end
