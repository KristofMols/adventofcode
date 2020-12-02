local Coordinate = require("lib.Classic"):extend()

local DIR_UP    = 0
local DIR_RIGHT = 1
local DIR_DOWN  = 2
local DIR_LEFT  = 3

function Coordinate:new(pos_x, pos_y)
    self.pos_x = pos_x
    self.pos_y = pos_y

    self.look_direction = DIR_UP
end

function Coordinate:nav_left (amount) self.pos_x = self.pos_x - amount end
function Coordinate:nav_right(amount) self.pos_x = self.pos_x + amount end
function Coordinate:nav_up   (amount) self.pos_y = self.pos_y - amount end
function Coordinate:nav_down (amount) self.pos_y = self.pos_y + amount end

function Coordinate:go(amount)
    if     self.look_direction == DIR_UP    then self:nav_up   (amount)
    elseif self.look_direction == DIR_RIGHT then self:nav_right(amount)
    elseif self.look_direction == DIR_DOWN  then self:nav_down (amount)
    elseif self.look_direction == DIR_LEFT  then self:nav_left (amount)
    end
end

function Coordinate:go_left (amount)
    if self.look_direction == DIR_UP then 
        self.look_direction = DIR_LEFT
    else
        self.look_direction = self.look_direction - 1
    end

    self:go(amount)
end

function Coordinate:go_right(amount)
    if self.look_direction == DIR_LEFT then 
        self.look_direction = DIR_UP
    else
        self.look_direction = self.look_direction + 1
    end

    self:go(amount)
end

return Coordinate