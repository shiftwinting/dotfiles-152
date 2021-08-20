-- aucmds
--  for event types, see https://neovim.io/doc/user/autocmd.html#events
--  for updates on the Lua aucmds interface, see https://github.com/neovim/neovim/pull/14661


local cmd = vim.cmd


-- when exit is begun, clear trailing whitespace, empty lines at end of file, save, then conclude exit
-- see
--  https://stackoverflow.com/questions/7495932/how-can-i-trim-blank-lines-at-the-end-of-file-in-vim
--  https://vim.fandom.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
--  TODO Make work as a grouping
cmd [[ au ExitPre * :silent v/\n*./d | :w ]]
cmd [[ au ExitPre * :%s/\s\+$//e | :w ]]

-- use a template file if one exists for that filetype. See templates dir below
-- stolen from somewhere
cmd [[ au BufNewFile * silent! 0r /home/j/.config/nvim/opt_dirs/templates/skeleton.%:e ]]

-- automatically create any needed parent dirs upon save
cmd [[autocmd BufWritePre * lua require( "aucmd.functions" ).mkdirs() ]]

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
