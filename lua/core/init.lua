local yaml = require('utils.yaml')
local config_path = vim.fn.stdpath('config')..'/config.yaml'
local config = yaml.eval(io.open(config_path,'r'):read('*all'))

local M = {}
M.PLUGINS = { }

if config ~= nil then
    ----------------------------------------------------
    -----------------\ PLUGIN SETUP /-------------------
    ----------------------------------------------------
    local ui = config['ui']
    local autocomplete = config['autocomplete'] 
    local plugins = config['plugins']
    local fuzzy = config['fuzzy']

    --[[--
    -- Puts names of plugins installed in packer compatible format
    --]]--
    for key,value in ipairs(plugins) do
        if type(value) == 'string' then 
            table.insert(M.PLUGINS, { value })
        elseif type(value) == 'table' then
            local packer_forme = value
            table.insert(packer_forme, packer_forme['repo'])
            table.insert(M.PLUGINS, packer_forme)
        end
    end

    --[[-- 
    -- Setting UI-enhancement plugins
    --]]--
    --These are a preset list of plugins for when I want to swap around my config
    for key,value in pairs(ui) do
        local stl = ui['stl']
        local bfl = ui['bfl']
        local tree = ui['tree']
        --[[-- 
        -- Setting Statusline plugins
        --]]--
        if stl ~= nil then 
            --\ shadmansaleh - lualine.nvim /--
            if stl == 'lualine' then table.insert(M.PLUGINS, 'shadmansaleh/lualine.nvim')
            elseif stl == 'airline' then table.insert(M.PLUGINS, { 
                'vim-airline/vim-airline',
                'vim-airline/vim-airline-themes' })
                --\ itchyny - lightline.vim /--
            elseif stl == 'lightline' then table.insert(M.PLUGINS, 'itchyny/lightline.vim')
                --\ famiu - feline.nvim /--
            elseif stl == 'feline' then table.insert(M.PLUGINS, 'famiu/feline.nvim')
                --\ NTBBloodbath - galaxyline.nvim - maintained fork of glepnir/galaxyline.nvim /--
            elseif stl == 'galaxyline' then table.insert(M.PLUGINS, {
                'NTBBloodbath/galaxyline.nvim',
                requires = { 'kyazdani42/nvim-web-devicons', opt = true } })
                --\ windwp - windline.nvim /--
            elseif stl == 'windline' then table.insert(M.PLUGINS, 'windwp/windline.nvim') 
                --\ tamton-aquib - staline.nvim /--
            elseif stl == 'staline' then table.insert(M.PLUGINS, 'tamton-aquib/staline.nvim') 
                --\ adelarsq - neoline.nvim /--
            elseif stl == 'neoline' then table.insert(M.PLUGINS, 'adelarsq/neoline.nvim') 
                --\ datwaft - bubbly.nvim /--
            elseif stl == 'bubbly' then table.insert(M.PLUGINS, 'datwaft/bubbly.nvim') 
                --\ rbong - vim-crystalline /--
            elseif stl == 'crystalline' then table.insert(M.PLUGINS, 'rbong/vim-crystalline') 
            end
        end

        --[[-- 
        -- Setting Bufferline plugins
        --]]--
        if bfl ~= nil then
            --\ akinsho - bufferline.nvim /--
            if bfl == 'akinsho-buf' then table.insert(M.PLUGINS, {
                'akinsho/bufferline.nvim',
                requires = 'kyazdani42/nvim-web-devicons' }) 
                --\ romgrk - barbar.nvim /--
            elseif bfl == 'barbar' then table.insert(M.PLUGINS, {
                'romgrk/barbar.nvim',
                requires = 'kyazdani42/nvim-web-devicons' }) 
                --\ noib3 - cokeline.nvim /--
            elseif bfl == 'cokeline' then table.insert(M.PLUGINS, {
                'noib3/cokeline.nvim',
                requires = 'kyazdani42/nvim-web-devicons' }) 
                --\ jose-elias-alvarez - buftabline.nvim /--
            elseif bfl == 'buftabline' then table.insert(M.PLUGINS, {
                'jose-elias-alvarez/buftabline.nvim',
                requires = 'kyazdani42/nvim-web-devicons' }) 
                --\ kdheepak - tabline.nvim /--
            elseif bfl == 'tabline' or bfl == 'lualine' then table.insert(M.PLUGINS, { 
                'kdheepak/tabline.nvim',
                requires = { { 'shadmansaleh/lualine.nvim', opt = true}, { 'kyazdani42/nvim-web-devicons', opt = true} } })
                --\ mengelbrecht - lightline-bufferline /--
            elseif bfl == 'lightline-bufferline' or bfl == 'lightline' then table.insert(M.PLUGINS, {
                'mengelbrecht/lightline-bufferline',
                requires = { 'itchyny/lightline.vim' } })
                --\ vim-airline - vim-airline /--
            elseif bfl == 'airline' then table.insert(M.PLUGINS, { 
                'vim-airline/vim-airline',
                'vim-airline/vim-airline-themes',  })
                --\ tamton-aquib - staline.nvim /--
            elseif bfl == 'stabline' then table.insert(M.PLUGINS, 'tamton-aquib/staline.nvim') 
                --\ adelarsq - neoline.nvim /--
            elseif bfl == 'neoline' then table.insert(M.PLUGINS, 'adelarsq/neoline.nvim') 
            end
        end

        --[[-- 
        -- Setting File-tree/sidebar plugins
        --]]--
        if tree ~= nil then
            --\ kyazdani42 - nvim-tree.lua /--
            if tree == 'nvimtree' then table.insert(M.PLUGINS,{
                'kyazdani42/nvim-tree.lua',
                requires = { 'kyazdani42/nvim-web-devicons', opt = true }  })
                --\ ms-jpq - chadtree /--
            elseif tree == 'chadtree' then table.insert(M.PLUGINS, {
                'ms-jpq/chadtree',
                branch = 'chad'  })
                --\ preservim - nerdtree /--
            elseif tree == 'nerdtree' then table.insert(M.PLUGINS, 'preservim/nerdtree')
                --\ luuvkbaal - nnn.nvim /--
            elseif tree == 'nnn' then table.insert(M.PLUGINS, 'luukvbaal/nnn.nvim') end
        end

    end

    for key,value in pairs(autocomplete) do
        local framework = autocomplete['framework']
        local snippets  = autocomplete['snippets']
        local lsp       = autocomplete['lsp']

        --[[-- 
        -- Setting built-in LSP plugin
        --]]--
        if lsp == true or lsp == 'enabled' then table.insert(M.PLUGINS, 'neovim/nvim-lspconfig') end

        --[[--
        -- Setting plugins for selectd autocompletion framework
        --]]--
        if framework ~= nil and framework ~= 'none' then
            --\ ms-jpq - coq_nvim /-- 
            if framework == 'coq' then
                table.insert(M.PLUGINS, { { 'ms-jpq/coq_nvim', branch = 'coq' }, { 'ms-jpq/coq.artifacts', branch = 'artifacts' }, { 'ms-jpq/coq.thirdparty', branch = '3p' } })
                --\ hrsh7th - nvim-cmp /-- 
            elseif framework == 'cmp' then
                local plugin_ls = {'hrsh7th/nvim-cmp', 'hrsh7th/cmp-buffer'}
                if lsp == true then table.insert(plugin_ls, 'hrsh7th/cmp-nvim-lsp') end
                if snippets ~= nil then
                    if snippets == 'ultisnips' then table.insert(plugin_ls, {
                        'SirVer/ultisnips',
                        { 'honza/vim-snippets', rtp = '.' },
                        'quangnguyen30192/cmp-nvim-ultisnips' })
                    elseif snippets == 'luasnip' then table.insert(plugin_ls, {
                        'L3MON4D3/Luasnip',
                        'rafamadriz/friendly-snippets',
                        'saadparwaiz1/cmp_luasnip' })
                    elseif snippets == 'vsnip' then table.insert(plugin_ls, {
                        'hrsh7th/vim-vsnip',
                        'rafamadriz/friendly-snippets',
                        'hrsh7th/cmp-vsnip' })
                    end
                end
                table.insert(M.PLUGINS, plugin_ls)
                --\ neoclide - coc.nvim /-- 
            elseif framework == 'coc' then table.insert(M.PLUGINS, { 'neoclide/coc.nvim', branch = 'release' }) end
        end

        --[[--
        -- Setting plugins for selected snippet framework alongwith extra snippets
        --]]--
        if snippets ~= nil and snippets ~= 'none' then
            --\ SirVer - ultisnips /--
            if snippets == 'ultisnips' then table.insert(M.PLUGINS, { 'SirVer/Ultisnips', {'honza/vim-snippets', rtp = '.'} })
                --\ hrsh7th - vim-vsnip /--
            elseif snippets == 'vsnip' then table.insert(M.PLUGINS, { 'hrsh7th/vim-vsnip', 'rafamadriz/friendly-snippets' })
                --\ L3MON4D3 - Luasnip /--
            elseif snippets == 'luasnip' then table.insert(M.PLUGINS, { 'L3MON4D3/Luasnip', 'rafamadriz/friendly-snippets' })
            end
        end
    end

    --[[--
    -- Setting plugins for selected fuzzy finding plugin
    --]]--
    if fuzzy ~= nil or fuzzy ~= 'none' then
        --\ nvim-telescope - telescope.nvim /--
        if fuzzy == 'telescope' then table.insert(M.PLUGINS, 'nvim-telescope/telescope.nvim')
            --\ liuchengxu - vim-clap /--
        elseif fuzzy == 'clap' or fuzzy == 'vim-clap' then table.insert(M.PLUGINS, 'liuchengxu/vim-clap')
            --\ Yggdroot - LeaderF /--
        elseif fuzzy == 'leaderf' or fuzzy == 'LeaderF' then table.insert(M.PLUGINS, 'Yggdroot/LeaderF')
            --\ ctrlpvim - ctrlp.vim /--
        elseif fuzzy == 'ctrlp' or fuzzy == 'C-p' then table.insert(M.PLUGINS, 'ctrlpvim/ctrlp.vim')
            --\ junegunn - fzf.vim /--
        elseif fuzzy == 'fzf' then table.insert(M.PLUGINS, 'junegunn/fzf.vim')
            --\ vijaymarupudi - nvim-fzf /--
        elseif fuzzy == 'nvim-fzf' then table.insert(M.PLUGINS, 'vijaymarupudi/nvim-fzf')
            --\ iBhagwan - fzf-lua /--
        elseif fuzzy == 'fzf-lua' or fuzzy == 'fzf.lua' then table.insert(M.PLUGINS, 'iBhagwan/fzf-lua')
        end
    end

    ------------------------------------
    -------\ INSTALLING PLUGINS /-------
    ------------------------------------
    require'packer'.startup(function()
	require'packer'.use 'wbthomason/packer.nvim'
        for _,value in ipairs(M.PLUGINS) do
            require'packer'.use(value)
        end
    end, packer_opts)

    ----------------------------------------------
    --------------\ OPTIONS SETUP /---------------
    ----------------------------------------------
    --HOW TO USE:
    -- In config.yaml:
    --
    -- options:
    --  foo: bar
    --
    -- Equivalent to set foo="bar" or vim.opt.foo='bar'
    --
    -- options:
    --  foo:
    --     scope: g
    --     value: bar
    --
    -- Equivalent to setglobal foo="bar" or  vim.g.foo = 'bar'
    local options = config['options']
    if options ~= nil then
        for key,value in pairs(options) do
            if type(value) ~= 'table' then vim.opt[key] = value
            elseif type[value] == 'table' then vim[value['scope']][key] = value['value']
            end
        end
    end

    ------------------------------------------------
    --------------\ VARIABLES SETUP /---------------
    ------------------------------------------------
    --HOW TO USE:
    --config.yaml file--
    --variables:
    --  foo:
    --    scope: g
    --    value: bar
    --
    -- This is equivalent to let g:foo = 'bar'
    local variables = config['variables']
    if variables ~= nil then
        for key,value in pairs(variables) do
            vim[value['scope']][key] = value['value']
        end
    end

    -------------------------------
    -----\ COLORSCHEME SETUP /-----
    -------------------------------
    local colorscheme = config['colorscheme']
    if colorscheme ~= nil then vim.cmd('colorscheme '..colorscheme) end
end
