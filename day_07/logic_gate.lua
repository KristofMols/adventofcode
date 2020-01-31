LogicGate = {executed = false, command = "", gates = {}}

LogicGate.__index = LogicGate

function LogicGate:new(new_command)
    local log_gate = {}
    setmetatable(log_gate, LogicGate)

    log_gate.command = new_command

    return log_gate
end

function LogicGate:execute(new_gates)
    self.gates = new_gates

    local first, second, gate = string.match(self.command, "^(%a*) AND (%a*) %-> (%a*)$")
    if first ~= nil and second ~= nil and gate ~= nil and self.gates[first] ~= nil and self.gates[second] ~= nil then
        self.gates[gate] = self.gates[first] & self.gates[second]
        self.executed = true
    end

    local first, second, gate = string.match(self.command, "^(%d*) AND (%a*) %-> (%a*)$")
    if first ~= nil and second ~= nil and gate ~= nil and self.gates[second] ~= nil then
        self.gates[gate] = first & self.gates[second]
        self.executed = true
    end

    local first, second, gate = string.match(self.command, "^(%a*) OR (%a*) %-> (%a*)$")
    if first ~= nil and second ~= nil and gate ~= nil and self.gates[first] ~= nil and self.gates[second] ~= nil then
        self.gates[gate] = self.gates[first] | self.gates[second]
        self.executed = true
    end

    local first, amount, gate = string.match(self.command, "^(%a*) LSHIFT (%d*) %-> (%a*)$")
    if first ~= nil and amount ~= nil and gate ~= nil and self.gates[first] ~= nil then
        self.gates[gate] = self.gates[first] << amount
        self.executed = true
    end

    local first, amount, gate = string.match(self.command, "^(%a*) RSHIFT (%d*) %-> (%a*)$")
    if first ~= nil and amount ~= nil and gate ~= nil and self.gates[first] ~= nil then
        self.gates[gate] = self.gates[first] >> amount
        self.executed = true
    end

    local first, gate = string.match(self.command, "^NOT (%a*) %-> (%a*)$")
    if first ~= nil and gate ~= nil and self.gates[first] ~= nil then
        self.gates[gate] = math.floor(65535 - self.gates[first])
        self.executed = true
    end

    local amount, gate = string.match(self.command, "^(%d*) %-> (%a*)$")
    if amount ~= nil and amount ~= "" and gate ~= nil then
        self.gates[gate] = amount
        self.executed = true
    end

    local first, gate = string.match(self.command, "^(%a*) %-> (%a*)$")
    if gate ~= nil and self.gates[first] ~= nil then
        self.gates[gate] = self.gates[first]
        self.executed = true
    end
end

function LogicGate:is_executed() return self.executed end

function LogicGate:get_command() return self.command end

function LogicGate:get_gates() return self.gates end

function LogicGate:reset_state() self.executed = false end
