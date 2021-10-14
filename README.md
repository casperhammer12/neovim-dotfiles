HAMMERVIM - A NEOVIM CONFIG
---------------------------
This is my personal Neovim config
It features:
* A YAML file for installing plugins (Currently does not support config and init commands)
* packer.nvim as a plugin manager
* Currently 0 lazy-loading

EDITING
-------
CONFIG.yaml can be used to:
* Set values of options
---
```yaml
options:
    shiftwidth: 4
    tabstop:
        scope: bo
        value: 27
```
The above yaml list is equivalent to:
```lua
vim.opt.shiftwidth=4
vim.bo.tabstop=27
```
Look at `:h options` for help with scoping
* Set values of variables
---
```yaml
variables:
    foo: bar
    foo2: 
        scope: b
        value: false
```
The above yaml list is equivalent to:
```lua
vim.g.foo = 'bar'
vim.b.foo2 = false
```
* Set UI bling plugins
---
Hammervim has some easy wrappers for setting up plugins for UI:
eq.
```yaml
ui:
    stl: lualine
    bfl: akinsho-buf
    tree: chadtree
```
This sets up packer to install:
- [lualine](https://github.com/shadmansaleh/lualine.nvim)
- [bufferline](https://github.com/akinsho/bufferline.nvim)
- [chadtree](https://github.com/ms-jpq/chadtree)
A list is given at the end for all the supported plugins
* Easily set major completion frameworks, snippets and basic setup LSP(WIP)
---
Hammervim supports easy setup for:
- Autocompletion frameworks:
    1. [coq](https://github.com/ms-jpq/coq_nvim)(Also installs snippets and thirdparty)
    2. [cmp](https://github.com/hrsh7th/nvim-cmp)(Checks your snippet selection and lsp and installs sources accordingly)
    3. [coc](https://github.com/neoclide/coc.nvim)(Installs release branch)
- Snippet engines:
    1. [luasnip](https://github.com/L3MON4D3/Luasnip) - Installs [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
    2. [ultisnips](https://github.com/SirVer/ultisnips) - Installs [vim-snippets](https://github.com/honza/vim-snippets)
    3. [vsnip](https://github.com/hrsh7th/vim-vsnip) - Installs [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
- LSP (WIP)
---

CREDITS
-------
[exosite](https://github.com/exosite) - YAML library
[wbthomason](https://github.com/wbthomason) - packer.nvim
