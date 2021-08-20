-- options --

-- Sources:
--  Options:
--      1. https://neovim.io/doc/user/options.html
--      2. https://vimhelp.org/options.txt.html
--
--  nvim defaults:  https://neovim.io/doc/user/vim_diff.html
--  opt syntax:     https://github.com/neovim/neovim/pull/13479#event-4813249467


require "options.providers"


-- alias syntax
local opt = vim.opt

-- vars
local custom_cursor = "n-v-sm:block,c-ci-cr-i-ve:ver30,r-o:hor20"

local util_dirs = "/home/j/.config/nvim/utils"
local undo_dir = util_dirs .. "/undo_files"
local view_dir = util_dirs .. "/view_files"


opt.backup          = false
opt.breakindent     = true
opt.clipboard       = "unnamedplus"
opt.cmdheight       = 1
opt.completeopt     = "menuone,noselect"
opt.confirm         = true
opt.emoji           = false  -- turning emoji off forces nvim to treat emojis as one space
opt.expandtab       = true
opt.fillchars       = { eob = "˃", fold = " " }
opt.foldenable      = false
opt.foldlevel       = 99
opt.foldmethod      = "syntax"
opt.foldnestmax     = 1
opt.foldtext        = " "
opt.formatoptions   = "1cjr"
opt.gdefault        = true
opt.grepprg         = [[ rg --glob "!.git" --trim --vimgrep ]]
opt.guicursor       = custom_cursor
opt.hidden          = true
opt.hlsearch        = false
opt.inccommand      = "nosplit"
opt.keywordprg      = ":help"
opt.lazyredraw      = true
opt.list            = true
opt.listchars       = { trail = '•' }

opt.modeline        = false
opt.modelines       = 0
opt.nrformats       = "alpha"
opt.numberwidth     = 1
opt.redrawtime      = 3000
opt.ruler           = false
opt.scrolloff       = 60
opt.shiftround      = true
opt.shiftwidth      = 4
opt.showcmd         = false
opt.showmode        = false
opt.shortmess       = "acstFOW"
opt.showbreak       = "..."
opt.signcolumn      = "yes:1"
opt.smartcase       = true
opt.smartindent     = true
opt.softtabstop     = 4
opt.statusline      = "%F %M"
opt.swapfile        = false
opt.synmaxcol       = 500
opt.tabstop         = 4
opt.termguicolors   = true
opt.timeout         = false
opt.textwidth       = 120
opt.undodir         = undo_dir
opt.undofile        = true
opt.updatetime      = 350
opt.viewdir         = view_dir
opt.viewoptions     = "folds"
opt.virtualedit     = "all"
opt.wildmenu        = true
opt.wildmode        = "longest,list,full"
opt.writebackup     = false
