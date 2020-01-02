require "common.file"
require "day_07.logic_gate"

local file = 'day_07/day7-input.txt'
local lines = lines_from(file)

local gates = {}
local commands = {}
local command_counter = 1

for _, line in pairs(lines) do
    commands[command_counter] = LogicGate:new(line)
    command_counter = command_counter + 1
end

while #commands > 0 do
    for k, v in pairs(commands) do
        gates = v:execute(gates)
        if v:is_executed() then 
            commands[k] = nil
        end
    end

    print(#commands)
end

for k, v in pairs(gates) do print(k, v) end

print("DAY 7.1", lines['a'])
