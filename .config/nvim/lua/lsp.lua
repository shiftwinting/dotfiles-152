-- LSP config
--  For servers, see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- requirements --
local nvim_lsp  = require( "lspconfig" )
local M = {}




-- set the path to the sumneko installation
local server_dir        = vim.fn.expand(vim.fn.stdpath "data".."/sumneko/")
local sumneko_binary    = server_dir .. '/bin/Linux/lua-language-server'
local sumneko_main      = server_dir .. '/main.lua'

local runtime_path = vim.split( package.path, ';' )
table.insert( runtime_path, "lua/?.lua" )
table.insert( runtime_path, "lua/?/init.lua" )

local servers =
{
    bashls = {},
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
local signs =
{
    Error = { sym = "✘", txthi = "DiagnosticError" },
    Warn  = { sym = "⚠️", txthi = "DiagnosticWarning" },
    Hint  = { sym = "💭" },
    Info  = { sym = "ℹ️" }
}
for type, cfg in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define( hl, {
        text = cfg.sym,
        texthl = cfg.txthi
    })
end


vim.diagnostic.config{
    severity_sort    = true,
    underline        = true,
    update_in_insert = false,
    virtual_text     = { prefix = '>' }
}




-- onAttach --
M.onAttach = function()
    -- vim.api.nvim_buf_set_option( 0, 'omnifunc', 'v:lua.vim.lsp.omnifunc' )
    vim.api.nvim_set_option( 'omnifunc', 'v:lua.vim.lsp.omnifunc' )
    require "lsp_signature".on_attach({
        bind = true,
        hint_prefix = "",
        fix_pos = true,
        max_height = 30,
        max_width = 180
    })
end




-- implement --
for server, config in pairs( servers ) do
    config.on_attach    = M.onAttach
    config.flags        = { debounce_text_changes = 500 }

    nvim_lsp[server].setup( config )
end


-- TODO returns literally one item
--  janky, need to clean this up with lspinstaller
return M
