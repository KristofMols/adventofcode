ImageLayer = {
    data = ""
}

local image_with = 25
local image_height = 6

ImageLayer.__index = ImageLayer

function ImageLayer:new(new_data)
    local layer = {}
    setmetatable(layer, ImageLayer)

    layer.data = new_data

    return layer
end

function ImageLayer:get_data()
    return self.data
end

function ImageLayer:get_character_count(character)
    return select(2, self.data:gsub(character, ""))
end

function ImageLayer:get_checksum()
    return self:get_character_count(1) * self:get_character_count(2)
end

function ImageLayer:get_value_at_position(pos)
    return self.data:sub(pos, pos)
end