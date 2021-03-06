-- options --

--[[
    https://neovim.io/doc/user/options.html

    nvim defaults:  https://neovim.io/doc/user/vim_diff.html
    opt syntax:     https://github.com/neovim/neovim/pull/13479#event-4813249467
]]


require "options.functions"

-- alias syntax
local o             = vim.opt


o.breakindent       = true
o.breakindentopt    = "shift:-4"
o.colorcolumn       = "+0"
o.cindent           = true
o.clipboard         = "unnamedplus"
o.confirm           = true
o.expandtab         = true
o.fillchars         = { eob = " ", fold = " " }
o.foldenable        = false
o.foldlevel         = 99
o.foldmethod        = "indent"
o.foldtext          = "v:lua.fold_func()"
o.gdefault          = true
o.grepprg           = [[ rg --ignore-case --glob "!.git" --trim --vimgrep ]]
o.guicursor         = "n-v-sm:block,c-ci-cr-i-ve:ver30,r-o:hor20"
o.hlsearch          = false
o.lazyredraw        = true
o.list              = true
o.listchars         = { trail = '●', eol = '↴' }
o.modeline          = false
o.modelines         = 0
o.nrformats         = "alpha"
o.numberwidth       = 1
o.redrawtime        = 250
o.ruler             = false
o.scrolloff         = 60
o.shada             = "'0,:30,/30"
o.shiftround        = true
o.shiftwidth        = 4
o.shortmess         = "acstFOW"
o.showcmd           = false
o.showmode          = false
o.signcolumn        = "yes:1"
o.softtabstop       = 4
o.statusline        = "%1*%F%* %1*%M%* %1*%R%* %=%1*Lines: %L%*"
o.swapfile          = false
o.synmaxcol         = 1000
o.termguicolors     = true
o.textwidth         = 125
o.timeout           = false
o.undodir           = vim.fn.expand(vim.fn.stdpath "data".."/undo/")
o.undofile          = true
o.updatetime        = 350   -- used for swap file and cursorhold
o.viewoptions       = "cursor,folds"
o.virtualedit       = "all"
o.wildmode          = "longest:full"
o.wildoptions       = "pum"
o.writebackup       = false


--[[
    providers
    https://github.com/neovim/neovim/blob/master/runtime/doc/provider.txt
]]
vim.g.loaded_node_provider   = 0
vim.g.loaded_perl_provider   = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider   = 0

-- python 3 provider
vim.g.python3_host_prog = '/usr/bin/python3'


--[[
    define clipboard commands here to preempt
    clipboard.vim runtime execution. Same concept
    as defining providers to speed up.
    see https://github.com/neovim/neovim/blob/master/runtime/autoload/provider/clipboard.vim
]]
vim.cmd
[[
    let g:clipboard = {
        \ 'name': 'xsel',
        \ 'copy': {
        \    '+': 'xsel --nodetach -i -b',
        \    '*': 'xsel --nodetach -i -p',
        \  },
        \ 'paste': {
        \    '+': 'xsel -o -b',
        \    '*': 'xsel -o -p',
        \ },
        \ 'cache_enabled': 1,
        \ }
]]
