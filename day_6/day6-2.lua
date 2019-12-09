require "day_6.day6-1"

local star_map = get_star_map()
local you_star = 'YOU'
local san_star = 'SAN'
local transfers = 1000

function find_path(v)
    local path = {}
    local key = v
    while key ~= nil do
        key = star_map[key]
        path[#path + 1] = key
    end
    return path
end

local you_path = find_path(you_star)
local san_path = find_path(san_star)

function table_contains_value(tab, val)
    for k, v in ipairs(tab) do
        if v == val then
            return true, k
        end
    end

    return false, nil
end

function find_common_star()
    for k, v in ipairs(you_path) do
        local bool, val = table_contains_value(san_path, v)
        if bool then
            local new_transfer = k + val - 2
            if new_transfer < transfers then
                transfers = new_transfer
            end
        end
    end
end

find_common_star()

print("DAY 6.2 : " .. transfers)