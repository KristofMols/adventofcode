require "common.file"

local file = 'day_08/day8-input.txt'
local lines = lines_from(file)

local total_count = 0
local memory_count = 0

function count_line_value(line)
    local line_total_count = line:len()
    local line_memory_count = line_total_count - 2
    
    for word in string.gmatch(line, "\\x%x%x") do line_memory_count = line_memory_count - 3 end
    for word in string.gmatch(line, "\\[\\|\"]") do line_memory_count = line_memory_count - 1 end

    return line_total_count, line_memory_count
end

for _, line in pairs(lines) do 
    line_total_count, line_memory_count = count_line_value(line)
    total_count = total_count + line_total_count
    memory_count = memory_count + line_memory_count
end

print("Day 8", total_count - memory_count)