-- mappings --
-- Sources
--  default mappings: https://hea-www.harvard.edu/~fine/Tech/vi.html
--  opening urls: https://vi.stackexchange.com/questions/22459/gx-doesnt-open-the-url-and-complains-netrw-no-line-in-buffer/22505#22505

-- colemak nav
require "mappings.colemak_nav"

-- import functions for mappings
require "mappings.functions"


-- local vars and abbrev
local map   = vim.api.nvim_set_keymap

local cmd   = { noremap = true, silent = true }
local expr  = { expr = true, silent = true }
local na    = {}
local nore  = { noremap = true }


-- leader --
vim.g.mapleader = 'm'




-- utility bindings --
-- comments
map( 'i', '<F2>', 'v:lua.send_comment()', expr )
map( 'n', '<F2>', 'v:lua.send_comment()', expr )

-- fold
map( 'n', '<bs>', 'za', na )

-- CR to enter cmd
map( 'n', '<CR>', ':', nore )
map( 'v', '<CR>', ':', nore )

-- space for insert mode
map( 'n', '<Space>', 'a', nore )
map( 'v', '<Space>', 'I', nore )

-- completion
map( 'i', '<up>',   'v:lua.arrow_up()',   expr )
map( 'i', '<down>', 'v:lua.arrow_down()', expr )

-- swap i and a
map( 'n', 'i', 'a', nore )
map( 'n', 'a', 'i', nore )

-- make case change more accessible
map( 'n', '`', '~s', na )
map( 'v', '`', '~', na )

-- tab and shift+tab for indentation
map( 'n', '<tab>', '>>', na )
map( 'n', '<s-tab>', '<<', na )

-- move to first non-blank char
map( '',  '<home>', '^',       na )
map( 'i', '<home>', '<esc>^a', na )

-- toggle numbers
map( 'n', '<C-n>', 'v:lua.num_toggle()', expr )

-- make '/' default to ripgrep
map( 'n', '/', ':silent grep  %<left><left>', na )

-- open URLs
--  taken from source 1
map( 'n', '<leader>u', "<cmd>!xdg-open <cWORD> &<CR><CR>", cmd )

-- change splits
map( 'n', '<C-j>', "<C-w><C-j>", cmd )
map( 'n', '<C-k>', "<C-w><C-k>", cmd )

-- resize splits
map( 'n', '=', "<C-w>+", cmd )
map( 'n', '-', "<C-w>-", cmd )




-- LSP bindings --
-- jump diagnostics
map( 'n', '<up>',   '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', cmd )
map( 'n', '<down>', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', cmd )

-- rename
map( 'n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', cmd)


-- plugin bindings --
-- mundo
map( 'n', '<C-u>', '<cmd>MundoToggle<cr>', cmd )

-- goto-preview
map( 'n', '<leader>d', "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", na )

-- trouble
map( 'n', '<leader>q', '<cmd>Trouble quickfix<cr>', na )

-- vim-swap
map( 'n', '<left>',  'g<', na )
map( 'n', '<right>', 'g>', na )

-- zen mode
map( 'n', '<leader>z', '<cmd>ZenMode<cr>', cmd )
