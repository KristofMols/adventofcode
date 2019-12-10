require "common.util"

Present = {l = 0, w = 0, h = 0}
Present.__index = Present

function Present:new(dimensions)
    local gift = {}
    setmetatable(gift, Present)

    local dim = split(dimensions, "[^x]*")

    gift.l = tonumber(dim[1])
    gift.w = tonumber(dim[2])
    gift.h = tonumber(dim[3])

    return gift
end

function Present:get_data() return self.l, self.w, self.h end

function Present:calculate_wrapping()
    local side_a = self.l * self.w
    local side_b = self.w * self.h
    local side_c = self.h * self.l

    local smallest = math.min(side_a, side_b, side_c)

    return (2 * side_a + 2 * side_b + 2 * side_c) + smallest
end

local function compare(a, b) return a < b end

function Present:calculate_ribbon()
    local tab = {self.l, self.w, self.h}
    table.sort(tab, compare)

    return tab[1] * 2 + tab[2] * 2
end

function Present:calculate_bow() return self.l * self.w * self.h end
