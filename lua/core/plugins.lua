local plugins = require('userrc').plugins
local packer = require('packer')
local use = packer.use

--[[ | Bootstrap Packer | ]]--
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

--[[ | Setup Packer | ]]--
packer.startup(function()
    use 'wbthomason/packer.nvim'
    for _,va in pairs(plugins.list) do 
        for _,v in pairs(va) do  use(v) end
    end
end, plugins.config)
