require "common.file"
require "day_8.imagelayer"

local file = 'day_8/day8-input.txt'
local lines = lines_from(file)

local image_with = 25
local image_height = 6
local layers = {}
local current_index = 1
local lowest_count = nil

while current_index <= #lines[1] do
    layers[#layers + 1] = ImageLayer:new(lines[1]:sub(current_index, current_index + (image_with * image_height) - 1))
    current_index = current_index + (image_with * image_height)
end

for _, layer in ipairs(layers) do
    local new_count = layer:get_character_count(0)
    if lowest_count == nil or new_count < lowest_count:get_character_count(0) then
        lowest_count = layer
    end
end

print("DAY 8.1 : " .. lowest_count:get_checksum())