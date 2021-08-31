-- aucmds
--  for event types, see https://neovim.io/doc/user/autocmd.html#events
--  for updates on the Lua aucmds interface, see https://github.com/neovim/neovim/pull/14661

-- sources
--  1.https://stackoverflow.com/questions/7495932/how-can-i-trim-blank-lines-at-the-end-of-file-in-vim
--  2. https://vim.fandom.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace


local cmd = vim.cmd


-- favorite formatoptions
--  default is 1jcroql
cmd [[ au BufEnter * setlocal fo-=roql ]]

-- use a template file if one exists for that filetype. See templates dir below
cmd [[ au BufNewFile * silent! 0r /home/j/.config/nvim/opt_dirs/templates/skeleton.%:e ]]

-- automatically create any needed parent dirs, clear trailing whitespace/newlines
--  see sources 1 and 2
cmd
[[
    augroup WritePre
        au!
        au BufWritePre * :%s/\s\+$//e
        au BufWritePre * lua require( "aucmd.functions" ).mkdirs()
    augroup END
]]

-- show diagnostic window on hold
cmd
[[
    augroup Hold
        au!
        au CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ focusable=false, max_height=30, max_width=100, show_header=false })
    augroup END
]]

cmd
[[
    augroup ft
        au!
        au FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>
        au FileType python,c :set colorcolumn=80 | :set textwidth=78 | inoremap <buffer> !! != | match Error /\%81v.\+/
        au FileType text :set spell
    augroup END
]]

cmd
[[
    augroup i_enter
        au!
        au InsertEnter * :set nonumber | :set norelativenumber
    augroup END
]]

-- highlight on yank
cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank{ higroup="HighlightedYankRegion", timeout=250 } ]]
