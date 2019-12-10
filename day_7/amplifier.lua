Amplifier = {
    phases = {},
    instructions = {},
    current_input = nil,
    operation_count = 0,
    input_count = 0,
    input = 0,
    result = 0,
    stored_value = 0
}

Amplifier.__index = Amplifier

function Amplifier:new(new_phases, new_instructions, new_input)
    local amp = {}
    setmetatable(amp, Amplifier)

    amp.phases = new_phases
    amp.instructions = new_instructions
    amp.input = new_input

    return amp
end

function Amplifier:execute()
    for _, phase in ipairs(self.phases) do
        self.current_input = phase

        while self.operation_count <= #self.instructions do
            local opcode, first, second, res =
                self:get_4_items(self.instructions, self.operation_count)
            self:exec_opcode(self.instructions, opcode, first, second, res)
        end

        self.stored_value = self.result
        self.operation_count = 0
        self.input_count = 0
    end
end

function Amplifier:get_result() return self.result end

function Amplifier:get_4_items(tab, start)
    return tab[start + 1], tab[start + 2], tab[start + 3], tab[start + 4]
end

function Amplifier:get_modes(code)
    local modes = {}

    while code ~= 0 do
        local lastDigit = code % 10
        code = math.floor(code / 10)

        modes[#modes + 1] = math.floor(lastDigit)
    end

    return modes
end

function Amplifier:get_value(tab, mode, index)
    if mode == nil or mode == 0 then
        return tab[index + 1]
    else
        return index
    end
end

function Amplifier:exec_opcode(tab, opcode, first, second, res)
    local modes = self:get_modes(opcode)

    if modes[1] == 1 then
        first = self:get_value(tab, modes[3], first)
        second = self:get_value(tab, modes[4], second)

        tab[res + 1] = math.floor(first + second)

        self.operation_count = self.operation_count + 4
    elseif modes[1] == 2 then
        first = self:get_value(tab, modes[3], first)
        second = self:get_value(tab, modes[4], second)

        tab[res + 1] = math.floor(first * second)

        self.operation_count = self.operation_count + 4
    elseif modes[1] == 3 then
        if (self.input_count == 0) then
            tab[first + 1] = self.current_input
            self.input_count = self.input_count + 1
        else
            tab[first + 1] = self.stored_value
        end

        self.operation_count = self.operation_count + 2
    elseif modes[1] == 4 then
        self.result = self:get_value(tab, modes[3], first)

        self.operation_count = self.operation_count + 2
    elseif modes[1] == 5 then
        first = self:get_value(tab, modes[3], first)

        if first ~= 0 then
            self.operation_count = self:get_value(tab, modes[4], second)
        else
            self.operation_count = self.operation_count + 3
        end
    elseif modes[1] == 6 then
        first = self:get_value(tab, modes[3], first)

        if first == 0 then
            self.operation_count = self:get_value(tab, modes[4], second)
        else
            self.operation_count = self.operation_count + 3
        end
    elseif modes[1] == 7 then
        first = self:get_value(tab, modes[3], first)
        second = self:get_value(tab, modes[4], second)

        if first < second then
            tab[res + 1] = 1
        else
            tab[res + 1] = 0
        end

        self.operation_count = self.operation_count + 4
    elseif modes[1] == 8 then
        first = self:get_value(tab, modes[3], first)
        second = self:get_value(tab, modes[4], second)

        if first == second then
            tab[res + 1] = 1
        else
            tab[res + 1] = 0
        end

        self.operation_count = self.operation_count + 4
    elseif opcode == 99 then
        self.operation_count = 1000
    else
        self.operation_count = 1000
    end
end
