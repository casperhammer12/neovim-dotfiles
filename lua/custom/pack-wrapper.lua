package.path = package.path..';/rocks/share/lua/5.1/?.lua'

local M = {}
local conf_path = vim.fn.stdpath('config')..package.config:sub(1,1)..'config'
local conf_type = 'json'

local pre_set_ui = {
    statusline = {
        lualine    = 'shadmansaleh/lualine.nvim',
        airline    = { 'vim-airline/vim-airline', 'vim-airline/vim-airline-themes'},
        feline	   = 'famiu/feline.nvim',
        windline   = 'windwp/windline.nvim',
        galaxyline = 'NTBBloodbath/galaxyline.nvim',
    },

    tabline = {
        tabline    = 'kdheepak/tabline',
        barbar     = 'romgrk/barbar.nvim',
        bufferline = 'akinsho/bufferline.nvim',
        cokeline   = 'noib3/cokeline.nvim',
    },

    dash = {
        dashboard = 'glepnir/dashboard-nvim',
        startify  = 'mhinz/vim-startify',
    },

    filetree = {
        nvim_tree = 'kyazdani42/nvim-tree',
        nerdtree  = 'preservim/nerdtree',
        chadtree  = { 'ms-jpq/chadtree', branch = 'chad' },
    },
}

function M.setup(opts)

    conf_type = opts.filetype
    conf_path = conf_path..conf_type

    local decode
    if conf_type == 'json' then decode = vim.json.encode elseif conf_type == 'yaml' then decode = require'yaml'.eval end

    local config = decode(io.open(conf_path, 'r'):read('*all'))

    if opts.options == true then set_options(config['options']) end
    if opts.variables == true then set_vars(config['variables']) end

    if opts.plugins == true then
        M.plugins =  {}

        if config['ui']           then set_ui(config['ui']) end
        if config['autocomplete'] then set_autocomplete(config['autocomplete']) end
        if config['plugins']                then set_plugins(config['plugins']) end

    end
end

local function set_options(opts)
    for option,value in pairs(opts) do
        vim.opt[option] = value
    end
end

local function set_ui(opts)
    if not opts then return else
        if opts['dash'] then table.insert(M.plugins, pre_set_ui['start'][opts['dash']]) end
        if opts['stl'] then table.insert(M.plugins, pre_set_ui['statusline'][opts['stl']]) end
        if opts['bfl'] then table.insert(M.plugins, pre_set_ui['tabline'][opts['bfl']]) end
        if opts['filetree'] then table.insert(M.plugins, pre_set_ui['filetree'][opts['filetree']]) end
    end
end

local function set_autocomplete(opts)
    if not opts then return else
        local framework = opts['framework']
        local lsp = opts['lsp']
        local snippets = opts['snippets']

        if lsp then table.insert(M.plugins, 'neovim/nvim-lspconfig') end

        if framework and framework ~= 'none' then 
            if framewok == 'coq' then table.insert(M.plugins, {
                { 'ms-jpq/coq_nvim', branch = 'coq'},
                { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
                { 'ms-jpq/coq.thirdparty', branch = '3p' }
            }) end
            if framework == 'cmp' then
                local cmp_plugs = {
                    'hrsh7th/nvim-cmp',
                    'hrsh7th/cmp-buffer'
                }
                if lsp then table.insert(cmp_plugs, 'hrsh7th/cmp-nvim-lsp') end
                table.insert(M.plugins, cmp_plugs)
            end
            if framework == 'coc' then table.insert(M.plugins, { 'neoclide/coc.nvim', branch = 'release' }) end
        end

        if snippets and snippets ~= 'none' then
            local snips
            if snippets == 'vsnip' then
                snips = { 'hrsh7th/vim-vsnip' }
                if framework == 'cmp' then table.insert(snips, 'hrsh7th/cmp-vsnip') end
            end
            if snippets == 'luasnip' then
                snips = { 'L3MON4D3/LuaSnip' }
                if framework == 'cmp' then table.insert(snips, 'saadparwaiz1/cmp_luasnip') end
            end
            if snippets == 'ultisnips' then
                snips = { 'SirVer/ultisnips' }
                if framework == 'cmp' then table.insert(snips, 'quangnguyen30192/cmp-nvim-ultisnips') end
            end
            table.insert(M.plugins, snips)
        end
    end
end

local function set_plugins(opts)
    if opts then
        for repo,setup in pairs(opts) do
            local packer_format = {}
            for option,value in pairs(setup) do packer_format[option] = value end
            table.insert(packer_format, repo)
            table.insert(M.plugins, packer_format)
        end
    end
end

return M
