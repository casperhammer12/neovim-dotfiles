local M = {}

function M.toggle_scheme()
    if     vim.g.colors_name == 'rose-pine' then require('rose-pine.functions').toggle_variant()
    elseif vim.g.colors_name == 'material'  then require('material.functions').toggle_style()
    end
end

return M
