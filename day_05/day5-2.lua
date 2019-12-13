require "day_05.day5-1"

local total_count = 0

function check_double_group(s1)
    local count = 1
    while count < #s1 do
        local letters = s1:sub(count, count + 1)
        if check_double(s1, letters) > 1 then return true end
        count = count + 1
    end

    return false
end

function check_repeating(s1)
    for letter in string.gmatch(s1, "%a") do
        local match = string.match(s1, letter .. "." .. letter)
        if match ~= nil and #match > 0 then return true end
    end

    return false
end

for _, line in pairs(lines) do
    if check_repeating(line) and check_double_group(line) then total_count = total_count + 1 end
end

print("DAY 5.2", total_count)