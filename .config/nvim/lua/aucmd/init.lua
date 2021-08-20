-- aucmds
--  for event types, see https://neovim.io/doc/user/autocmd.html#events
--  for updates on the Lua aucmds interface, see https://github.com/neovim/neovim/pull/14661

-- sources
--  1.https://stackoverflow.com/questions/7495932/how-can-i-trim-blank-lines-at-the-end-of-file-in-vim
--  2. https://vim.fandom.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace


local cmd = vim.cmd


-- use a template file if one exists for that filetype. See templates dir below
-- stolen from somewhere
cmd [[ au BufNewFile * silent! 0r /home/j/.config/nvim/opt_dirs/templates/skeleton.%:e ]]

-- automatically create any needed parent dirs, clear trailing whitespace/newlines
--  see sources 1 and 2
cmd [[ autocmd BufWritePre * :%s/\s\+$//e | :silent v/\n*./d | lua require( "aucmd.functions" ).mkdirs() ]]

-- show diagnostic window on hold
cmd [[ autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ focusable=false, max_height=30, max_width=100, show_header=false }) ]]

-- use 'q' to exit several filetypes; code stolen from Folke
cmd [[ autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR> ]]

-- set colorcolumn and textwidth for languages we use
cmd [[ autocmd FileType python,c :set colorcolumn=80 | :set textwidth=78 | inoremap <buffer> !! != ]]

-- turn on spell for txt files
cmd [[ autocmd FileType text :set spell ]]

-- turn off numbers upon entering insert; idea stolen from Beau Williams
cmd [[ autocmd InsertEnter * :set nonumber | :set norelativenumber ]]

-- highlight on yank
cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank{ higroup="HighlightedYankRegion", timeout=250 } ]]
