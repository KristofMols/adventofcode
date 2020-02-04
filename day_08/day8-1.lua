require "common.file"

local file = 'day_08/day8-input.txt'
local lines = lines_from(file)

local total_count = 0
local memory_count = 0

local chars_to_escape = {
    {regex = "\\x%x%x", length = 3}, 
    {regex = "\\\\", length = 1},
    {regex = "\\\"", length = 1}
}

function count_line_value(line)
    local line_total_count = line:len()
    local line_memory_count = line_total_count - 2
    
    line = line:sub(2, line:len() - 1)

    for k, v in pairs(chars_to_escape) do
        for word in string.gmatch(line, v.regex) do
            line_memory_count = line_memory_count - v.length
        end
    end

    total_count = total_count + line_total_count
    memory_count = memory_count + line_memory_count
end

for _, line in pairs(lines) do count_line_value(line) end

print("Day 8.1", total_count - memory_count)
