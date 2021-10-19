local M = {}
local map_opts = {}

function map_opts:new()
    local conds = {
	cmd = '',
	opts = {
	    noremap = false,
	    expr = false,
	    silent = false,
	    nowait = false
	}
    }
    setmetatable(conds, self)
    self.__index = self
    return conds
end

function map_opts:map_cmd(cmd)
    self.cmd = (':%s<CR>'):format(cmd)
    return self
end

function map_opts:map_key(key)
    self.cmd = key
    return self
end

function map_opts:silent()
    self.opts.silent = true
    return self
end

function map_opts:expr()
    self.opts.expr = true
    return self
end

function map_opts:noremap()
    self.opts.noremap = true
    return self
end

function map_opts:nowait()
    self.opts.nowait = true
    return self
end

function M.map_cmd(cmd)
    local mo = map_opts:new()
    return mo:map_cmd(cmd)
end

function M.map_key(key)
    local mo = map_opts:new()
    return mo:map_key(key)
end

function M.set_mapping(map)
    for k,v in pairs(map) do
	local mode,kmap = k:match('([^|]*)|?(.*)')
	if type(v) == 'table' then
	    local rhs = v.cmd
	    local opts = v.opts 
	    vim.api.nvim_set_keymap(mode, kmap, rhs, opts)
	end
    end
end

return M
