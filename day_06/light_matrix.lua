LightMatrix = {
    start_x = 0, 
    start_y = 0, 
    stop_x = 0, 
    stop_y = 0, 
    action = nil,
    lights = {}
}

LightMatrix.__index = LightMatrix

function LightMatrix:new(new_lights, new_action, new_start_x, new_start_y, new_stop_x, new_stop_y)
    local matrix = {}
    setmetatable(matrix, LightMatrix)

    matrix.start_x = new_start_x
    matrix.start_y = new_start_y
    matrix.stop_x = new_stop_x
    matrix.stop_y = new_stop_y
    matrix.action = new_action
    matrix.lights = new_lights

    return matrix
end

function LightMatrix:turn_on()
    for x = self.start_x, self.stop_x, 1 do
        for y = self.start_y, self.stop_y, 1 do 
            local light = self.lights[x .. '|' .. y]
            if light ~= nil then
                self.lights[x .. '|' .. y] = self.lights[x .. '|' .. y] + 1
            else
                self.lights[x .. '|' .. y] = 1
            end
         end
    end
end

function LightMatrix:turn_off()
    for x = self.start_x, self.stop_x, 1 do
        for y = self.start_y, self.stop_y, 1 do 
            local light = self.lights[x .. '|' .. y]
            if light ~= nil and light - 1 >= 0 then
                self.lights[x .. '|' .. y] = self.lights[x .. '|' .. y] - 1
            else
                self.lights[x .. '|' .. y] = 0
            end
         end
    end 
end

function LightMatrix:toggle()
    for x = self.start_x, self.stop_x, 1 do
        for y = self.start_y, self.stop_y, 1 do 
            local light = self.lights[x .. '|' .. y]
            if light ~= nil then
                self.lights[x .. '|' .. y] = self.lights[x .. '|' .. y] + 2
            else
                self.lights[x .. '|' .. y] = 2
            end
        end
    end 
end

function LightMatrix:execute_action()
    if self.action == "turn on" then
        self:turn_on()
    elseif self.action == "turn off" then
        self:turn_off()
    elseif self.action == "toggle" then
        self:toggle()
    end
end

function LightMatrix:get_lights()
    return self.lights
end