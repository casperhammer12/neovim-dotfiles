local lsp = require('lspconfig')

local lspC = {
    clangd = {
        cmd = { 'clangd', '--background-index' },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'h', 'hpp' },
        root_dir = lsp.util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git', '.cpp_project')
    },

    cssls = {
        cmd = { 'vscode-css-language-server', '--stdio' },
        filetypes = { 'css', 'scss', 'less' },
        root_dir = lsp.util.root_pattern('package.json', '.git', 'style.css', 'styles.css'),
        css = {
            validate = true
        },
        less = {
            validate = true
        },
        scss = {
            validate = true
        }
    },

    html = {
        cmd = { 'vscode-html-language-server', '--stdio' },
        filetypes = { 'html' },
        init_options = {
            configurationSection = { 'html', 'css', 'javascript' },
            embeddedLanguages = {
                css = true,
                javascript = true
            }
        }
    },

    gopls = {
        cmd = { 'gopls', 'serve' },
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
            },
        }
    }
 -- jdtls
 -- lua - optional
 -- vimls - optional
 -- tsserver
 -- efm
 -- emmet
 -- gdscript
 -- haxels
 -- jsonls
 -- pyright/jedi
 -- rust_analyzer
 -- hls/ghcide/hie
}

for lang,opts in pairs(lspC) do
    opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) 
    lsp[lang].setup(opts)
end

local M = {}

M.icons = {
  Class = " ",
  Color = " ",
  Constant = " ",
  Constructor = " ",
  Enum = "了 ",
  EnumMember = " ",
  Field = " ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = "ƒ ",
  Module = " ",
  Property = " ",
  Snippet = "﬌ ",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = " ",
  Variable = " ",
}

  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = M.icons[kind] or kind
  end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

function PrintDiagnostics(opts, bufnr, line_nr, client_id)
  opts = opts or {}

  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)

  local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr, line_nr, opts, client_id)
  if vim.tbl_isempty(line_diagnostics) then return end

  local diagnostic_message = ""
  for i, diagnostic in ipairs(line_diagnostics) do
    diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
    print(diagnostic_message)
    if i ~= #line_diagnostics then
      diagnostic_message = diagnostic_message .. "\n"
    end
  end
  vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
end

vim.cmd [[ autocmd CursorHold * lua PrintDiagnostics() ]]
