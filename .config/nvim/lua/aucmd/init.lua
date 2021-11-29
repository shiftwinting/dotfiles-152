-- aucmds
--  for event types, see https://neovim.io/doc/user/autocmd.html#events
--  for updates on the Lua aucmds interface, see https://github.com/neovim/neovim/pull/14661


local cmd = vim.cmd


-- use a template file if one exists for that filetype. See templates dir
cmd "au BufNewFile * silent! 0r /home/j/.config/nvim/utils/templates/skeleton.%:e"


-- favorite formatoptions
--  default is 1jcroql
--  see https://vimhelp.org/change.txt.html#fo-table
cmd
[[
    augroup EnterBuffer
        au!
        au BufEnter * lua require( "aucmd.functions" ).hi_long_lines()
        au BufEnter * setlocal fo-=oql"
    augroup END
]]


-- remember folds
cmd
[[
    augroup Views
        au!
        au BufWinLeave * :silent! mkview
        au BufWinEnter * :silent! loadview
    augroup END
]]

-- ft options
cmd
[[
    augroup Ft
        au!
        au FileType c,python :set textwidth=80 | inoremap <buffer> !! != |
        au FileType gitcommit :set textwidth=50
        au FileType tex,txt :set spell | :set textwidth=110
        au FileType help,lspinfo,qf,startuptime nnoremap <buffer><silent> q <cmd>close<CR>
    augroup END
]]


-- clear cmd line
cmd
[[
    augroup CmdMsgCl
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
cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank{ higroup="HighlightedYankRegion", timeout=165 }]]


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
