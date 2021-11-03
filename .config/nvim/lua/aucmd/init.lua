-- aucmds
--  for event types, see https://neovim.io/doc/user/autocmd.html#events
--  for updates on the Lua aucmds interface, see https://github.com/neovim/neovim/pull/14661


local cmd = vim.cmd


-- use a template file if one exists for that filetype. See templates dir
cmd "au BufNewFile * silent! 0r /home/j/.config/nvim/utils/templates/skeleton.%:e"


-- favorite formatoptions
--  default is 1jcroql
--  see https://vimhelp.org/change.txt.html#fo-table
cmd "au BufEnter * setlocal fo-=oql"


-- remember folds
cmd
[[
    augroup remember_folds
        au!
        au BufWinLeave * :silent! mkview
        au BufWinEnter * :silent! loadview | :1
    augroup END
]]

cmd
[[
    augroup ft
        au!
        au FileType c,python :set textwidth=78 | inoremap <buffer> !! != | match Error /\%81v.\+/
        au FileType gitcommit :set textwidth=72
        au FileType help,lspinfo,qf,startuptime nnoremap <buffer><silent> q <cmd>close<CR>
        au FileType tex,txt :set spell | :set textwidth=100
    augroup END
]]


-- clear cmd line
cmd
[[
    augroup cmd_msg_cls
        au!
        au CmdlineLeave * :call timer_start( 1500, { -> execute( "echo ' ' ", "" )})
    augroup END
]]


-- turn off numbers when entering Insert
cmd
[[
    augroup IEnter
        au!
        au InsertEnter * :set nonumber | :set norelativenumber
    augroup END
]]


-- highlight on yank
cmd "au TextYankPost * silent! lua vim.highlight.on_yank{ higroup=\"HighlightedYankRegion\", timeout=180 }"


-- change cursor back to beam when leaving neovim
--  see https://github.com/neovim/neovim/issues/6005
cmd
[[
    augroup ChangeCursor
        au!
        au ExitPre * :set guicursor=a:ver90
    augroup END
]]


-- automatically open qf after grep
cmd
[[
    augroup Quickfix
        au!
        au QuickFixCmdPost * :TroubleToggle quickfix
    augroup END
]]
