package.path = package.path..';/rocks/share/lua/5.1/?.lua'

local M = {}

function M.plugins_setup(plug_ls)
    for key,value in pairs(plug_ls) do 
        local plug_tab = value
        table.insert(plug_tab, key)
        table.insert(_G.__PLUGINS_LIST, plug_tab)
    end
end

return M
