-- aucmds
--  for event types, see https://neovim.io/doc/user/autocmd.html#events
--  for updates on the Lua aucmds interface, see https://github.com/neovim/neovim/pull/14661

    -- use a template file if one exists for that filetype. See templates dir below
    -- stolen from somewhere
    vim.cmd [[ au BufNewFile * silent! 0r /home/j/.config/nvim/opt_dirs/templates/skeleton.%:e ]]

    -- highlight on yank
    vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank{ higroup="HighlightedYankRegion", timeout=250 } ]]

    -- show diagnostic window on hold
    vim.cmd [[ autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ focusable=false, max_height=30, max_width=100, show_header=false }) ]]

    -- turn off numbers upon entering insert; idea stolen from Beau Williams
    vim.cmd [[ autocmd InsertEnter * :set nonumber | :set norelativenumber ]]

    -- set colorcolumn and textwidth for languages we use
    vim.cmd [[ autocmd FileType python,c :set colorcolumn=80 | :set textwidth=78 | inoremap <buffer> !! != ]]

    -- use 'q' to exit several filetypes; code stolen from Folke
    vim.cmd [[ autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR> ]]


