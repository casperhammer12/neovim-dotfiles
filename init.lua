require('core')
--[[
    require'packer'.startup(function()
        require'packer'.use 'wbthomason/packer.nvim'
        require'packer'.use {'neoclide/coc.nvim', branch = 'release'}
        require'packer'.use 'tiagovla/tokyodark.nvim'
        require'packer'.use 'honza/vim-snippets'
    end)
vim.g.tokyodark_transparent_background = false
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"
--]]
--    vim.cmd([[source ]]..vim.fn.stdpath('config')..'/mappings.vim')
--    vim.cmd[[colo tokyodark]]
--[[    vim.opt.termguicolors=true
    vim.opt.mouse='a'
    vim.opt.relativenumber=true
    vim.opt.number=true
    vim.opt.clipboard='unnamedplus'
    vim.opt.timeoutlen=500
    vim.opt.shiftwidth=4
    vim.opt.splitbelow=true
    vim.opt.splitright=true
    vim.opt.autoindent=true
    vim.opt.smartindent=true
    vim.opt.breakindent=true
    vim.opt.copyindent=true
    vim.opt.expandtab=true
    vim.opt.cursorline=true
    vim.opt.cursorlineopt='number,screenline'
    vim.opt.cmdheight=2
    vim.opt.hlsearch=false
    vim.opt.ruler=true
    vim.opt.scrolloff=8
    vim.opt.confirm=true
    vim.opt.winblend=10
    vim.opt.wrap=false
    --]]
