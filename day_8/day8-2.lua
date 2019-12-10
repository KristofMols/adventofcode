require "day_8.day8-1"

local image_with = 25
local image_height = 6
local layers = get_layers()
local last_layer = {}

for i = 1, image_height * image_with do last_layer[i] = "2" end

for i = 1, image_height * image_with, 1 do
    for _, v in ipairs(layers) do
        local digit = v:get_value_at_position(i)

        if digit == "1" then
            last_layer[i] = "X"
            break
        end
        if digit == "0" then
            last_layer[i] = " "
            break
        end
    end
end

for i = 1, image_height, 1 do
    for j = 1, image_with, 1 do
        io.write(last_layer[image_with * (i - 1) + j])
    end
    io.write('\n')
end
