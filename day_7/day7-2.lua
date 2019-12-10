require "day_7.day7-1"

for phases in perm{5, 6, 7, 8, 9} do
    for i = 1, 5, 1 do
        for _, phase in ipairs({9,7,8,5,6}) do
            calculate_program(phase)

            stored_value = result
            operation_count = 0
            input_count = 0
        end
    end

    if result > best_result then best_result = result end
    
    operation_count = 0
    stored_value = 0
    current_input = nil
    input_count = 0
    result = nil
end

print("DAY 7.2 : " .. best_result)
