-- options --

-- Sources:
--  Options:
--      1. https://neovim.io/doc/user/options.html
--      2. https://vimhelp.org/options.txt.html
--
--  nvim defaults:  https://neovim.io/doc/user/vim_diff.html
--  opt syntax:     https://github.com/neovim/neovim/pull/13479#event-4813249467
--  fold function:
--      https://www.reddit.com/r/neovim/comments/psl8rq/sexy_folds/?utm_source=share&utm_medium=ios_app&utm_name=iossmf


require "options.providers"


-- alias syntax
local o = vim.opt

-- vars
local custom_cursor = "n-v-sm:block,c-ci-cr-i-ve:ver30,r-o:hor20"
local fold_func     = [[ substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' '.(v:foldend - v:foldstart + 1).' lines '.trim(getline(v:foldend)) ]]

local util_dirs     = "/home/j/.config/nvim/utils"
local undo_dir      = util_dirs .. "/undo_files"
local view_dir      = util_dirs .. "/view_files"


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
o.foldnestmax       = 2
o.foldtext          = fold_func
o.gdefault          = true
o.grepprg           = [[ rg --glob "!.git" --trim --vimgrep ]]
o.guicursor         = custom_cursor
o.hidden            = true
o.hlsearch          = false
o.inccommand        = "nosplit"
o.keywordprg        = ":help"
o.laststatus        = 2
o.lazyredraw        = true
o.list              = true
o.listchars         = { trail = '•' }
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
o.undodir           = undo_dir
o.undofile          = true
o.updatetime        = 350
o.viewdir           = view_dir
o.viewoptions       = "folds"
o.virtualedit       = "all"
o.wildmenu          = true
o.wildmode          = "longest,list,full"
o.writebackup       = false
