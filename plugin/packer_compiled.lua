-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = "1"
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\gaurav\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\gaurav\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\gaurav\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\gaurav\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\gaurav\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim"
  },
  aurora = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\aurora"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\bufdelete.nvim"
  },
  ["catppuccino.nvim"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\catppuccino.nvim"
  },
  ["coq.artifacts"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\coq.artifacts"
  },
  ["coq.thirdparty"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\coq.thirdparty"
  },
  coq_nvim = {
    config = { "\27LJ\2\0026\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\27plugins.completion.coq\frequire\0" },
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\coq_nvim"
  },
  ["indent-guides.nvim"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-guides.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.ui.lualine\frequire\0" },
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\material.nvim"
  },
  neovim = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neovim"
  },
  ["nvim-base16.lua"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-base16.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua"
  },
  ["nvim-cursorline"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cursorline"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\2<\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0!plugins.completion.lspconfig\frequire\0" },
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig"
  },
  ["nvim-spectre"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\0024\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\25plugins.ui.nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
  },
  ["pears.nvim"] = {
    config = { "\27LJ\2\0023\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\npears\frequire\0" },
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\pears.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim"
  },
  ["specs.nvim"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\specs.nvim"
  },
  ["tabline.nvim"] = {
    config = { "\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.ui.tabline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tabline.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tokyonight.nvim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "C:\\Users\\gaurav\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.ui.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: coq_nvim
time([[Config for coq_nvim]], true)
try_loadstring("\27LJ\2\0026\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\27plugins.completion.coq\frequire\0", "config", "coq_nvim")
time([[Config for coq_nvim]], false)
-- Config for: tabline.nvim
time([[Config for tabline.nvim]], true)
try_loadstring("\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.ui.tabline\frequire\0", "config", "tabline.nvim")
time([[Config for tabline.nvim]], false)
-- Config for: pears.nvim
time([[Config for pears.nvim]], true)
try_loadstring("\27LJ\2\0023\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\npears\frequire\0", "config", "pears.nvim")
time([[Config for pears.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\2<\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0!plugins.completion.lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
