local mapc = require('utils.keymaps').map_cmd
local mapk = require('utils.keymaps').map_key
local M = {}

M.options,M.plugins,M.mappings,M.config = {},{},{},{}

M.options = {
    colorscheme    = 'zephyr',
    mouse          = 'a',
    cursorlineopt  = 'number,screenline',
    clipboard      = 'unnamedplus',
    nrformats      = 'octal,hex,alpha,unsigned',
    spelllang	   = {'en_us'},
    shiftwidth     = 4,
    cmdheight      = 2,
    scrolloff      = 10,
    winblend       = 10,
    spell	   = true,
    expandtab      = true,
    termguicolors  = true,
    splitbelow     = true,
    splitright     = true,
    autoindent     = true,
    smartindent    = true,
    breakindent    = true,
    copyindent     = true,
    expandtab      = true,
    cursorline     = true,
    hlsearch       = false,
    ruler          = true,
    confirm        = true,
    wrap           = false,
    number         = true,
    relativenumber = true,
}

M.plugins = {
    list = {
    colorschemes = {
        'folke/tokyonight.nvim',
        'glepnir/zephyr-nvim',
        'sainnhe/edge',
        'RRethy/nvim-base16',
        'marko-cerovac/material.nvim',
    },

    completion =  {
        --[[ {
            'ms-jpq/coq_nvim',
            branch = 'coq',
            run = 'COQdeps',
            config = function() require('plugins.completion.coq') end 
        },
        {
            'ms-jpq/coq.artifacts',
            branch = 'artifacts'
        },
        {
            'ms-jpq/coq.thirdparty',
            branch = '3p' 
        }, --]]

        {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-emoji',
            'f3fora/cmp-spell',
            'hrsh7th/cmp-path',
            { 'hrsh7th/nvim-cmp', config = function() require('plugins.completion.cmp') end }
        },
        {
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
            'saadparwaiz1/cmp_luasnip'
        },
    },

    ui = {
        { 
            'shadmansaleh/lualine.nvim',
            requires = { {'kyazdani42/nvim-web-devicons', opt = true} },
            config = function() require('plugins.ui.lualine') end 
        },
        { 
            'kdheepak/tabline.nvim',
            requires = { {'kyazdani42/nvim-web-devicons', opt = true}, {'shadmansaleh/lualine.nvim', opt = true} },
            config = function() require('plugins.ui.tabline') end 
        },
        {
            'ms-jpq/chadtree',
            branch = 'chad',
            run = 'python -m chadtree deps',
            config = function() require('plugins.ui.chadtree') end,
            cmd = 'CHADopen',
        },
        --[[ {
            'kyazdani42/nvim-tree.lua',
            requires = { {'nvim-lua/plenary.nvim'} },
            config = function() require('plugins.ui.nvim-tree') end,
            cmd = 'NvimTreeToggle'
        }, --]]
    },

    languages = {
        {
            'neovim/nvim-lspconfig',
            config = function() require('plugins.completion.lspconfig') end 
        },
    },

    misc = {
        'famiu/bufdelete.nvim',
        'yamatsum/nvim-cursorline',
        'glepnir/indent-guides.nvim',
        'numToStr/Comment.nvim',
        'norcalli/nvim-colorizer.lua',
        'edluffy/specs.nvim',
        { 
            'nvim-telescope/telescope.nvim',
            requires = { {'nvim-lua/plenary.nvim'} },
            config = function() require('plugins.telescope') end 
        },
        {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function() require('plugins.treesitter') end
        },
        {
            "windwp/nvim-spectre",
            requires = "nvim-lua/plenary.nvim",
        },
        {
            "steelsojka/pears.nvim",
            config = function() require('pears').setup() end
        },
        {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
        },
        {
            'sudormrfbin/cheatsheet.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-lua/popup.nvim',
                'nvim-telescope/telescope.nvim',
            }
        }
    },
},
config = {}
}


M.mappings = {
    -- ['n|<C-n>']       = mapc('NvimTreeToggle'):noremap():silent(),
    ['n|<C-n>']       = mapc('CHADopen'):noremap():silent(),
    -- <Leader>b - 'buffer'
    ['n|<Leader>bd']  = mapc('lua require(\'bufdelete\').bufdelete(0, false)'):noremap():silent(),
    ['n|<Leader>bw']  = mapc('lua require(\'bufdelete\').bufwipeout(0, false)'):noremap():silent(),
    -- <Leader>c - 'config'
    ['n|<Leader>cc']  = mapc('vsp stdpath("config") . "/lua/userrc.lua<CR>'),
    ['n|<Leader>cp']  = mapc('vsp stdpath("config") . "/lua/userrc.lua<CR>/plugins<CR>'),
    ['n|<Leader>co']  = mapc('vsp stdpath("config") . "/lua/userrc.lua<CR>/options<CR>'),
    ['n|<Leader>cm']  = mapc('vsp stdpath("config") . "/lua/userrc.lua<CR>/mappings<CR>'),
    ['n|<Leader>ctc']  = mapc('lua require(\'telescope.builtin\').colorscheme()'):noremap():silent(),
    ['n|<Leader>ctt'] = mapc('lua require(\'core.cmds\').toggle_scheme()'):noremap():silent(),
    -- <Leader>f - 'file'
    ['n|<Leader>ff']  = mapc('lua require(\'telescope.builtin\').find_files()'):noremap():silent(),
    ['n|<Leader>fg']  = mapc('lua require(\'telescope.builtin\').live_grep()'):noremap():silent(),
    ['n|<Leader>fb']  = mapc('lua require(\'telescope.builtin\').buffers()'):noremap():silent(),
    ['n|<Leader>fh']  = mapc('lua require(\'telescope.builtin\').help_tags()'):noremap():silent(),
    ['n|<Leader>fw']  = mapc('write'):noremap(),
    ['n|<Leader>flo']  = mapc('write<CR>:so %<CR>:echo "RE-SOURCED: ".expand("%:t")'):noremap():silent(),
    -- <Leader>n - 'new'
    ['n|<Leader>nb']  = mapc('new'):noremap():silent(),
    ['n|<Leader>nt']  = mapc('tabnew'):noremap():silent(),
    -- <Leader>p - 'Packer'
    ['n|<Leader>ps']  = mapc('PackerSync'):noremap():silent(),
    ['n|<Leader>pi']  = mapc('PackerStatus'):noremap():silent(),
    ['n|<Leader>pr']  = mapc('PackerClean'):noremap():silent(),
    ['n|<Leader>pc']  = mapc('PackerCompile profile=1'):noremap():silent(),
    ['n|<Leader>pu']  = mapc('PackerUpdate'):noremap():silent(),
    ['n|<Leader>pp']  = mapc('PackerProfile'):noremap():silent(),
    -- <Leader>t - 'tab' (actually buffer)
    ['n|<Leader>tn']  = mapc('TablineBufferNext'):noremap():silent(),
    ['n|<Leader>tp']  = mapc('TablineBufferPrevious'):noremap():silent(),
    ['n|<TAB>']       = mapc('TablineBufferNext'):noremap():silent(),
    ['n|<S-Tab>']     = mapc('TablineBufferPrevious'):noremap():silent(),
    -- <Leader>x - 'delete'
    ['n|<Leader>x']   = mapc('lua require(\'bufdelete\').bufdelete(0, false)'):noremap():silent(),
    -- <Leader>/ - 'comment'
    ['n|<Leader>/']   = mapk('gcc'):noremap():silent(),
    ['v|<Leader>/']   = mapk('gbc'):noremap():silent(),
    ['x|<Leader>/']   = mapk('gbc'):noremap():silent(),
    -- Multiplex nav keys
    ['n|<C-h>']       = mapk('<C-w>h'):noremap():silent(),
    ['n|<C-j>']       = mapk('<C-w>j'):noremap():silent(),
    ['n|<C-k>']       = mapk('<C-w>k'):noremap():silent(),
    ['n|<C-l>']       = mapk('<C-w>l'):noremap():silent(),
}

M.extraconf = {
    require('plugins.misc'),
}

return M
