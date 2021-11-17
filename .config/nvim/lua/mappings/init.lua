-- mappings --
--[[
    Sources
    default mappings: https://hea-www.harvard.edu/~fine/Tech/vi.html
    opening urls: https://vi.stackexchange.com/questions/22459/gx-doesnt-open-the-url-and-complains-netrw-no-line-in-buffer/22505#22505
]]

-- import functions for mappings
require "mappings.functions"


-- local vars and abbrev
local map   = vim.api.nvim_set_keymap

local cmd   = { noremap = true, silent = true }
local expr  = { expr = true, silent = true }
local na    = {}
local nore  = { noremap = true }



--[[ leader ]]--
vim.g.mapleader = 'm'



--[[ utility bindings ]]--
-- comments
map( 'i', '<F2>', 'v:lua.send_comment()', expr )
map( 'i', '<F14>', '- ', na )

-- fold
map( 'n', ';', 'za', na )

-- CR to enter cmd
map( 'n', '<CR>', ':', nore )
map( 'v', '<CR>', ':', nore )

-- swap i and a
map( 'n', 'i', 'a', nore )
map( 'n', 'a', 'i', nore )

-- space for insert mode
-- original: map( 'n', '<Space>', 'a', expr )
map('n', '<Space>', "v:lua.require'indentInsert'.indent('i')", expr )
map( 'v', '<Space>', 'I', nore )

-- make case change more accessible
map( 'n', '`', '~s', na )
map( 'v', '`', '~', na )

-- tab and bs for indentation
map( 'n', '<tab>', '>>', na )
map( 'n', '<bs>', '<<', na )
map( 'v', '<tab>', '>gv', na )
map( 'v', '<bs>', '<gv', na )

-- move to first non-blank char
map( '',  '<home>', '^',       na )
map( 'i', '<home>', '<esc>^a', na )

-- toggle numbers
map( 'n', '<C-n>', 'v:lua.num_toggle()', expr )

-- make '/' default to ripgrep
map( 'n', '/', ':LOOK ', na )

--[[
    open URLs, taken from source 1
    uses xdg-open shell command (!) to open word under cursor ( cWORD )
]]
map( 'n', '<leader>u', "<cmd>!xdg-open <cWORD> &<CR><CR>", cmd )

-- write arrows
map( 'i', '>>', "->", nore )

-- buffers --
map( 'n', "<C-t>", ":e ", na )
map( 'n', "<C-Pageup>", "<cmd>bp<CR>", cmd )
map( 'n', "<C-Pagedown>", "<cmd>bn<CR>", cmd )
map( 'n', "<C-S-Pageup>", "<cmd>:BufferLineMovePrev<CR>", cmd )
map( 'n', "<C-S-Pagedown>", "<cmd>:BufferLineMoveNext<CR>", cmd )
map( 'n', "<C-w>", "<cmd>bd<CR>", cmd )




--[[ LSP bindings ]]--
-- jump diagnostics
map( 'n', '<up>',   '<cmd>lua vim.diagnostic.goto_next{ float = false }<cr>', cmd )
map( 'n', '<down>', '<cmd>lua vim.diagnostic.goto_next{ float = false }<cr>', cmd )

-- rename
map( 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', cmd )

-- show line diagnostics
map( 'n', '<leader>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ focusable=false, max_height=30, max_width=100, show_header=false })<cr>', na )



--[[ plugin bindings ]]--
-- outline
map( 'n', '<F1>','<cmd>SymbolsOutline<cr>', cmd )

-- trouble
map( 'n', '<leader>q', '<cmd>TroubleToggle quickfix<cr>', na )

-- vim-swap
map( 'n', '<left>', 'g<', na )
map( 'n', '<right>', 'g>', na )



--[[ colemak ]]--
-- home row: right nav
map( '', 'n', 'j', nore )
map( '', 'N', 'J', nore )
map( '', 'e', 'k', nore )
map( '', 'E', 'K', nore )

map( '', 'j', 'n', nore )
map( '', 'J', 'N', nore )
map( '', 'k', 'e', nore )
map( '', 'K', 'E', nore )

-- home row: left nav
map( '', 's', 'h', nore )
map( '', 'S', 'H', nore )
map( '', 't', 'l', nore )
map( '', 'T', 'L', nore )

map( '', 'h', 's', nore )
map( '', 'H', 'S', nore )
map( '', 'l', 't', nore )
map( '', 'L', 'T', nore )
