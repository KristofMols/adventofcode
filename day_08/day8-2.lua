require "common.file"
require "day_08.day8-1"

local file = 'day_08/day8-input.txt'
local lines = lines_from(file)

local total_count_part_1 = get_total_count()
local total_count = 0

local chars_to_escape = {
    {regex = "\\", length = 1}, 
    {regex = "\"", length = 1}
}

function count_line_value(line)
    local line_total_count = line:len() + 2

    for k, v in pairs(chars_to_escape) do
        for word in string.gmatch(line, v.regex) do
            line_total_count = line_total_count + v.length
        end
    end

    total_count = total_count + line_total_count
end

for _, line in pairs(lines) do count_line_value(line) end

print("Day 8.2", total_count - total_count_part_1)
