-- LSP config
--  For servers, see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- requirements --
local nvim_lsp  = require( "lspconfig" )

-- variables --
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- set the path to the sumneko installation
local server_dir        = '/home/j/.config/nvim/other/lua-language-server'
local sumneko_binary    = server_dir .. '/bin/Linux/lua-language-server'
local sumneko_main      = server_dir .. '/main.lua'

local runtime_path = vim.split( package.path, ';' )
table.insert( runtime_path, "lua/?.lua" )
table.insert( runtime_path, "lua/?/init.lua" )

local servers   =
{
    clangd      =
    {
        -- for cmd info and defaults
        -- https://manpages.debian.org/experimental/clangd/clangd.1.en.html
        -- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd
        cmd =
        {
            'clangd',
            '--header-insertion=iwyu',
            '--cross-file-rename',
        }
    },
    pyright     = {},
    sumneko_lua =
    {
        cmd = { sumneko_binary, "-E", sumneko_main },
        settings =
        {
            Lua =
            {
                diagnostics = { globals = { 'vim' } },
                runtime     = { version = 'LuaJIT', path = vim.split(package.path, ';') },
                telemetry   = { enable = false },
                workspace   = { library = { library = vim.api.nvim_get_runtime_file("", true) }}
            }
        }
    },
}



-- LSP signs --
local lsp_err_hl    = { text = "✘", texthl = "LspDiagnosticsVirtualTextError" }
local lsp_warn_hl   = { text = "⚠️", texthl = "LspDiagnosticsVirtualTextWarning" }
local lsp_info_hl   = { text = "💬" }
local lsp_hint_hl   = { text = "💡" }

vim.fn.sign_define( "LspDiagnosticsSignError",       lsp_err_hl )
vim.fn.sign_define( "LspDiagnosticsSignWarning",     lsp_warn_hl )
vim.fn.sign_define( "LspDiagnosticsSignInformation", lsp_info_hl)
vim.fn.sign_define( "LspDiagnosticsSignHint",        lsp_hint_hl)



-- onAttach --
local function onAttach()
    vim.api.nvim_buf_set_option( 0, 'omnifunc', 'v:lua.vim.lsp.omnifunc' )
end



-- enable snippets --
capabilities.textDocument.completion.completionItem.snippetSupport = true



-- handlers --
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
     vim.lsp.diagnostic.on_publish_diagnostics,
     {
         underline = true,
         update_in_insert = false,
         virtual_text = true
     }
)



-- implement --
for server, config in pairs( servers ) do
    config.on_attach    = onAttach
    config.capabilities = capabilities

    nvim_lsp[server].setup( config )
end
