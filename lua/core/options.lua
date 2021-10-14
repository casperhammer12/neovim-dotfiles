package.path = package.path..';/rocks/share/lua/5.1/?.lua'

local M = {}

function M.options_setup(opt_ls)
    for key,value in pairs(opt_ls) do
        vim.opt[key] = value
    end
end

return M
