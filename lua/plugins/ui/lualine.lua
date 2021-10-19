require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '┃', right = '┃'},
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = {'filename', 'branch', 'diff',
        {'diagnostics', sources={'nvim_lsp', 'coc'}}},
        lualine_c = {'fileformat'},
        lualine_x ={},
        lualine_y = {'filetype','progress'},
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = {'filename'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'location'}
    },
    tabline = {},
    extensions = {}
}
