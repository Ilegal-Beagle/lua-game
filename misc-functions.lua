-- rounds a number
function round(num, place)
    local multi = 10^(place or 0)
    return math.floor(num * multi + .5) / multi
end
  
-- dumps table to a string
function dump(o)
    if type(o) == 'table' then
    local s = ''
    for k,v in pairs(o) do
        s = s .. v.name .. ' '
    end
    return s
    else
    return tostring(o)
    end
end