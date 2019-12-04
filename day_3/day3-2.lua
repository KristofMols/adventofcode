require "day_3.day3-1"

local lowest_steps = nil

for key, val in pairs(loc1) do
    if loc2[key] ~= nil then
        local new_steps = val:getSteps() + loc2[key]:getSteps()
        if lowest_steps == nil or new_steps < lowest_steps then
            lowest_steps = new_steps
        end
    end
end

print("DAY 3.2 : " .. math.floor(lowest_steps))
