local md5 = require "md5"

local secret = "bgvyzdsv"
local index = 0

local function starts_with(str, start)
    return str:sub(1, #start) == start
end

function find_match_with_prefix(prefix)
    while true do
        local hash = md5.sumhexa(secret .. index)

        if (starts_with(hash, prefix)) then
            print(index, hash)
            break
        else
            index = index + 1
        end
    end
end

find_match_with_prefix("00000")
find_match_with_prefix("000000")