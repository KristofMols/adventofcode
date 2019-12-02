require "day_1.day1-1"

function calculate_total_fuel(mass)
    local new_sum = 0

    while mass > 0 do
        mass = calculate_fuel(mass)
        if (mass > 0) then
            new_sum = new_sum + mass
        end
    end

    return new_sum
end

local sum = 0

for _, v in pairs(lines) do
    sum = sum + calculate_total_fuel(tonumber(v)) 
end

print('DAY 2.2 : ' .. sum)
