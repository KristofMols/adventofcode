require "common.file"
require "day_07.logic_gate"

local file = 'day_07/day7-input.txt'
local lines = lines_from(file)

local gates = {}
local commands = {}

for _, line in pairs(lines) do commands[#commands + 1] = LogicGate:new(line) end

function has_executables()
    for k, v in pairs(commands) do
        if not v:is_executed() then
            return true 
        end
    end

    return false
end

while has_executables() do
    for k, v in pairs(commands) do
        if not v:is_executed() then
            v:execute(gates)
            gates = v:get_gates()
        end
    end
end

print("DAY 7.1", gates['a'])
