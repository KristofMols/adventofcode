require "day_2.day2-1"

for noun = 0, 99 do 
    for verb = 0, 99 do 
        local result = calculate_program(noun, verb)
        if result == 19690720 then
            print("DAY 2.2 : " .. (100 * noun + verb))
            return
        end
    end 
end