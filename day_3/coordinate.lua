Coordinate = {x = 0, y = 0, steps = 0}
Coordinate.__index = Coordinate

function Coordinate:new(new_x, new_y, new_steps)
    local coord = {}
    setmetatable(coord, Coordinate)

    coord.x = new_x
    coord.y = new_y
    coord.steps = new_steps

    return coord
end

function Coordinate:getX() return self.x end

function Coordinate:getY() return self.y end

function Coordinate:getSteps() return self.steps end

function Coordinate:print() print('(' .. self.x .. ', ' .. self.y .. ', ' .. self.steps .. ')') end

function Coordinate:equals(coord2)
    return self.x == coord2.x and self.y == coord2.y
end
