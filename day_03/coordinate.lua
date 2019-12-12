Coordinate = {
    x = 0,
    y = 0,
    amount = 0
}

Coordinate.__index = Coordinate

function Coordinate:new(new_x, new_y)
    local coord = {}
    setmetatable(coord, Coordinate)

    coord.x = new_x
    coord.y = new_y
    coord.amount = 1

    return coord
end

function Coordinate:get_x() return self.x end

function Coordinate:get_y() return self.y end

function Coordinate:get_amount() return self.amount end

function Coordinate:add_amount(new_amount) self.amount = self.amount + new_amount end