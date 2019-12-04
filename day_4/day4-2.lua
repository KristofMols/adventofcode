require "day_4.day4-1"

local total_matches = 0

function check_double_count(num)
    for digit in string.gmatch(num, "%d") do
        local count = countSubstring(num, digit)
        if count == 2 then return true end
    end

    return false
end

for count = low_range, high_range, 1 do
    if check_increasing(count) and check_double_count(count) then
        total_matches = total_matches + 1
    end
end

print("DAY 4.2 : " .. math.floor(total_matches))