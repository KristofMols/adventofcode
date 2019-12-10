require "day_7.day7-1"

for phases in perm{5, 6, 7, 8, 9} do
    for i = 1, 5, 1 do
        local lines = lines_from(file)
        local items = split_num(lines[1], "[^,]*")

        local amp = Amplifier:new(phases, items, result)

        amp:execute()

        local result = amp:get_result()
        
        if result > best_result then best_result = result end
    end
end

print("DAY 7.2 : " .. best_result)
