local g = vim.g
local has = vim.fn.has

if not g.os then
    if has("win64") or has("win32") or has("win16") then
        g.os = "Windows"
    else
        g.os = vim.fn.substitute(vim.fn.system('uname'), '\n', '', '')
    end
end
