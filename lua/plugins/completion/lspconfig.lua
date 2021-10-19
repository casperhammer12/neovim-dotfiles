local lsp = require('lspconfig')
local coq = require('coq')

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
    lsp[lang].setup(coq.lsp_ensure_capabilities(opts))
end
