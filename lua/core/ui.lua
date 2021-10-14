package.path = package.path..';/rocks/share/lua/5.1/?.lua'

local M = {}

local ui_opts = {
    statusline = {
	lualine    = 'shadmansaleh/lualine.nvim',
	airline    = { 'vim-airline/vim-airline', 'vim-airline/vim-airline-themes'},
	feline	   = 'famiu/feline.nvim',
	windline   = 'windwp/windline.nvim',
	galaxyline = 'NTBBloodbath/galaxyline.nvim',
    },

    tabline = {
	tabline    = 'kdheepak/tabline.nvim',
	barbar     = 'romgrk/barbar.nvim',
	bufferline = 'akinsho/bufferline.nvim',
	cokeline   = 'noib3/cokeline.nvim',
    },

    dash = {
	dashboard = 'glepnir/dashboard-nvim',
	startify  = 'mhinz/vim-startify',
    },

    filetree = {
	nvimtree = 'kyazdani42/nvim-tree',
	nerdtree  = 'preservim/nerdtree',
	chadtree  = { 'ms-jpq/chadtree', branch = 'chad' },
    },
}

function M.ui_setup(ui_ls)
    for key,value in pairs(ui_ls) do
	if key ~= 'colorscheme' then
	    table.insert(_G.__PLUGINS_LIST, ui_opts[value])
	else
	    vim.cmd('colorscheme '..value)
	end
    end
end

return M
