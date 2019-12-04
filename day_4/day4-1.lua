low_range = 172930
high_range = 683082

function check_increasing(num)
    local last_digit = nil

    for digit in string.gmatch(num, "%d") do
        if last_digit ~= nil and last_digit > digit then return false end

        last_digit = digit
    end

    return true
end

function countSubstring(s1, s2)
    return select(2, tostring(s1):gsub(s2, ""))
end

function check_multiple_digit(num)
    for digit in string.gmatch(num, "%d") do
        if countSubstring(num, digit) > 1 then return true end
    end

    return false
end

local total_matches = 0

for count = low_range, high_range, 1 do
    if check_increasing(count) and check_multiple_digit(count) then
        total_matches = total_matches + 1
    end
end

print("DAY 4.1 : " .. math.floor(total_matches))