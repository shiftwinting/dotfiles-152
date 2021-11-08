-- options --

--[[
    Options:
    https://neovim.io/doc/user/options.html

    nvim defaults:  https://neovim.io/doc/user/vim_diff.html
    opt syntax:     https://github.com/neovim/neovim/pull/13479#event-4813249467
]]


require "options.functions"


-- alias syntax
local o = vim.opt

-- vars
local util_dirs     = "/home/j/.config/nvim/utils"


o.backup            = false
o.breakindent       = true
o.clipboard         = "unnamedplus"
o.cmdheight         = 1
o.confirm           = true
o.emoji             = false  -- turning emoji off forces nvim to treat emojis as one space
o.expandtab         = true
o.fillchars         = { eob = "˃", fold = " " }
o.foldenable        = false
o.foldlevel         = 99
o.foldmethod        = "indent"
o.foldnestmax       = 4
o.foldtext          = "v:lua.fold_func()"
o.gdefault          = true
o.grepprg           = [[ rg --ignore-case --glob "!.git" --trim --vimgrep ]]
o.guicursor         = "n-v-sm:block,c-ci-cr-i-ve:ver30,r-o:hor20"
o.hidden            = true
o.hlsearch          = false
o.inccommand        = "nosplit"
o.keywordprg        = ":help"
o.laststatus        = 2
o.lazyredraw        = true
o.list              = true
o.listchars         = { trail = '●' }
o.modeline          = false
o.modelines         = 0
o.nrformats         = "alpha"
o.numberwidth       = 1
o.redrawtime        = 3000
o.ruler             = false
o.scrolloff         = 60
o.shada             = "'0,:30,/30"
o.shiftround        = true
o.shiftwidth        = 4
o.showcmd           = false
o.showmode          = false
o.shortmess         = "acstFOW"
o.showbreak         = ">"
o.signcolumn        = "yes:1"
o.smartcase         = true
o.smartindent       = true
o.softtabstop       = 4
o.statusline        = "%1*%F%* %1*%M%* %1*%R%* %=%1*Lines: %L%*"
o.swapfile          = false
o.synmaxcol         = 350
o.tabstop           = 4
o.termguicolors     = true
o.timeout           = false
o.textwidth         = 120
o.undodir           = util_dirs .. "/undo_files"
o.undofile          = true
o.updatetime        = 350
o.viewdir           = util_dirs .. "/view_files"
o.viewoptions       = "folds"
o.virtualedit       = "all"
o.wildmenu          = true
o.wildmode          = "longest,list,full"
o.writebackup       = false




--[[
    providers
    https://github.com/neovim/neovim/blob/master/runtime/doc/provider.txt
]]
-- turn off python 2, perl, and ruby support for now
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
