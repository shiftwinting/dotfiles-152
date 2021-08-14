-- mappings --
-- Sources
--  1: https://vi.stackexchange.com/questions/22459/gx-doesnt-open-the-url-and-complains-netrw-no-line-in-buffer/22505#22505

-- colemak nav
require( 'mappings.colemak_nav' )

-- import functions for mappings
require( 'mappings.functions' )


-- local vars and abbrev
local map   = vim.api.nvim_set_keymap

local cmd   = { noremap = true, silent = true }
local expr  = { expr = true, silent = true }
local na    = {}
local nore  = { noremap = true }



-- leader --
vim.g.mapleader = 'm'



-- utility bindings --
-- fold
map( 'n', ';', 'za', na )

-- CR to enter cmd
map( 'n', '<CR>', ':', nore )
map( 'v', '<CR>', ':', nore )

-- space for insert mode
map( 'n', '<Space>', 'a', nore )
map( 'v', '<Space>', 'I', nore )

-- swap i and a
map( 'n', 'i', 'a', nore )
map( 'n', 'a', 'i', nore )

-- move to first non-blank char
map( '',  '<home>', '^',       na )
map( 'i', '<home>', '<esc>^a', na )

-- toggle numbers
map( 'n', '<C-n>', 'v:lua.num_toggle()', expr )

-- make '/' default to ripgrep
map( 'n', '/', ':silent grep  %<left><left>', na )

-- open URLs
-- taken from source 1
map( 'n', '<leader>u', "<cmd>!xdg-open <cWORD> &<CR><CR>", cmd )


-- LSP bindings --
-- jump diagnostics
map('n', '<up>',   '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', cmd )
map('n', '<down>', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', cmd )

-- rename
map( 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', cmd)



-- plugin bindings --
-- mundo
map( 'n', '<C-u>', '<cmd>MundoToggle<cr>', cmd )

-- compe
map( 'i', '<Tab>',  'v:lua.tab_compe()',  expr )
map( 'i', '<up>',   'v:lua.arrow_up()',   expr )
map( 'i', '<down>', 'v:lua.arrow_down()', expr )

-- goto-preview
map( 'n', 'gd', "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", na )

-- lightspeed
map( 'n', '<C-PageUp>',   '<Plug>Lightspeed_S', na )
map( 'n', '<C-PageDown>', '<Plug>Lightspeed_s', na )

-- nvim comment
map( 'i', '<F14>', '<esc><Plug>kommentary_line_default', na )
map( 'n', '<F14>', '<Plug>kommentary_line_default',      na )
map( 'v', '<F14>', '<Plug>kommentary_visual_default',    na )

-- symbols-outline.nvim
map( 'n', '<F1>', '<cmd>SymbolsOutline<cr>', cmd )

-- trouble
map( 'n', '<leader>q', '<cmd>Trouble quickfix<cr>', na )

-- vim-move
map( 'v', '<left>',  '<C-h>', na )
map( 'v', '<down>',  '<C-j>', na )
map( 'v', '<up>',    '<C-k>', na )
map( 'v', '<right>', '<C-l>', na )

-- vim printf
map( 'n', '<leader>p', '<cmd>Printf<cr>', cmd )
map( 'v', '<leader>p', '<cmd>Printf<cr>', cmd )

-- vim-swap
map( 'n', '<left>',  'g<', na )
map( 'n', '<right>', 'g>', na )

-- zen mode
map( 'n', '<leader>z', '<cmd>ZenMode<cr>', cmd )
