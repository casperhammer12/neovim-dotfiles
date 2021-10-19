local map = require('userrc').mappings
local set_map = require('utils.keymaps').set_mapping

if map ~= nil then set_map(map) end
