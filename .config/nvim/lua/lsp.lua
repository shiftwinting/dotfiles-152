-- LSP config
--  For servers, see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- requirements --
local nvim_lsp  = require( "lspconfig" )


-- variables --
local capabilities = vim.lsp.protocol.make_client_capabilities()


-- set the path to the sumneko installation
local server_dir        = '/home/j/.config/nvim/utils/lua-language-server'
local sumneko_binary    = server_dir .. '/bin/Linux/lua-language-server'
local sumneko_main      = server_dir .. '/main.lua'

local runtime_path = vim.split( package.path, ';' )
table.insert( runtime_path, "lua/?.lua" )
table.insert( runtime_path, "lua/?/init.lua" )

local servers =
{
    clangd =
    {
        --[[
            for cmd info and defaults:
            https://manpages.debian.org/experimental/clangd/clangd.1.en.html
            https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd
         ]]
        cmd =
        {
            'clangd',
            '--clang-tidy',
            '--completion-style=detailed',
            '--cross-file-rename',
            '--header-insertion=iwyu',
            '--header-insertion-decorators',
            '--limit-results=10',
            '--pch-storage=memory'
        }
    },

    pyright =
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright
    {
        -- settings =
        -- {
        --     python = { pythonPath = "python" }
        -- }
    },

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
                workspace   = { library = { library = vim.api.nvim_get_runtime_file( "", true )}}
            }
        }
    },
}


-- LSP signs --
local err_hl    = { text = "✘", texthl = "DiagnosticError" }
local warn_hl   = { text = "⚠️", texthl = "DiagnosticWarning" }
local info_hl   = { text = "ℹ️" }
local hint_hl   = { text = "💡" }

vim.fn.sign_define( "DiagnosticSignError",          err_hl )
vim.fn.sign_define( "DiagnosticSignWarn",           warn_hl )
vim.fn.sign_define( "DiagnosticSignInformation",    info_hl )
vim.fn.sign_define( "DiagnosticSignHint",           hint_hl )


-- onAttach --
local function onAttach()
    vim.api.nvim_buf_set_option( 0, 'omnifunc', 'v:lua.vim.lsp.omnifunc' )
    require "lsp_signature".on_attach(
    {
        bind = true,
        hint_prefix = "",
        fix_pos = true,
        max_height = 30,
        max_width = 180
    })
end


-- enable snippets --
capabilities.textDocument.completion.completionItem.snippetSupport = true


-- handlers --
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
     vim.lsp.diagnostic.on_publish_diagnostics,
     {
         severity_sort    = true,
         underline        = true,
         update_in_insert = false,
         virtual_text     = true
     }
)


-- implement --
for server, config in pairs( servers ) do
    config.on_attach    = onAttach
    config.capabilities = capabilities
    config.flags        = { debounce_text_changes = 500 }

    nvim_lsp[server].setup( config )
end
