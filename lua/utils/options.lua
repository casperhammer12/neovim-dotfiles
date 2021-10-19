local M = {}

M.set_opt = function(opts)
	for opt,val in pairs(opts) do
		if opt ~= 'colorscheme' then vim.opt[opt] = val end
	end
end

M.set_var = function(variable, value,scope)
	if scope ~= nil then vim.g[variable] = value
	else vim[scope][variable] = value
	end
end

M.set_colorscheme = function(scheme) vim.cmd('colo '..scheme) end

return M
