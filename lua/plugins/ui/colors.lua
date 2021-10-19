local cs = require('userrc').options.colorscheme

if cs == 'tokyonight' then
    -- Example config in Lua
    vim.g.tokyonight_style = "night"
    vim.g.tokyonight_italic_functions = true
    vim.g.tokyonight_italic_keywords = true
    vim.g.tokyonight_italic_hide_inactive_statusline = true
    vim.g.tokyonight_lualine_bold = true
    vim.g.tokyonight_sidebars = { "qf", "NvimTree", "packer", 'terminal' }

    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    vim.g.tokyonight_colors = { error = "#ff0000" }
elseif cs == 'material' then
    vim.g.material_style = 'deep ocean'
    require('material').setup({
        contrast = true,
        borders = true,
        italics = {
            comments = true,
            strings = false,
            keywords = true,
            functions = true,
            variables = false
        },
        popup_menu = 'colorful',
        contrast_windows = {
            "terminal",
            "packer",
            "qf",
            "nvimtree",
        },
        text_contrast = {
            lighter = false,
            darker = true,
        },
        disable = {
            background = false,
            term_colors = false,
            eob_lines = false
        }
    })
elseif cs == 'rose-pine' then
    -- Set variant
    -- Defaults to 'dawn' if vim background is light
    -- @usage 'base' | 'moon' | 'dawn' | 'rose-pine[-moon][-dawn]'
    vim.g.rose_pine_variant = 'moon'

    -- Disable italics
    vim.g.rose_pine_disable_italics = false

    -- Use terminal background
    vim.g.rose_pine_disable_background = false

    -- Use bold vertical split line
    vim.g.rose_pine_bold_vertical_split_line = true
end

vim.cmd('colo '..cs)
