function split(str, pat)
    local tbl = {}
    str:gsub(pat, function(x) tbl[#tbl + 1] = x end)
    return tbl
end

function split_num(str, pat)
local tbl = {}
str:gsub(pat, function(x) tbl[#tbl + 1] = tonumber(x) end)
return tbl
end