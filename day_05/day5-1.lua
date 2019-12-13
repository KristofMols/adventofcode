require "common.file"

local file = 'day_05/day5-input.txt'
local lines = lines_from(file)
local total_count = 0

local VOWELS = "aeiou"
local EXCLUDED = {"ab", "cd", "pq", "xy"}

function check_vowel(s1) return #s1:gsub("[^" .. VOWELS .. "]", "") > 2 end

function check_double(s1, s2) return select(2, s1:gsub(s2 .. s2, "")) end

function contains_excluded(s1)
    for _, s2 in pairs(EXCLUDED) do
        if string.find(s1, s2) then return true end
    end

    return false
end

function check_double_letters(s1)
    for letter in string.gmatch(s1, "%a") do
        if check_double(s1, letter) > 0 then return true end
    end

    return false
end

for _, line in pairs(lines) do
    if check_vowel(line) and check_double_letters(line) and
        not contains_excluded(line) then total_count = total_count + 1 end
end

print("DAY 5.1", total_count)