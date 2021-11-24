-- sources
--  1. packer events: https://neovim.io/doc/user/autocmd.html#events


require "impatient"
require "plugs.disable"
require "plugs.cfgs.global_cfgs"

LSP_LANGS = { 'sh', 'c', "lua", "python" }


return require( "packer" ).startup({ function( use )

-- base

    use "nathom/filetype.nvim"

    -- the functionality for this plugin will be
    -- merged into upstream at some point. Watch
    -- for it here: https://github.com/neovim/neovim/pull/15436
    use{ 'lewis6991/impatient.nvim', rocks = 'mpack' }

    use "neovim/nvim-lspconfig"

    use "wbthomason/packer.nvim"

    use
    {
        'hrsh7th/nvim-cmp',
        config = [[ require "plugs.cfgs.cmp" ]],
        requires =
        {
            { 'hrsh7th/cmp-buffer', event = 'InsertEnter' },

            {
                'hrsh7th/cmp-emoji',
                event = 'InsertEnter',
                keys = ':'
            },

            {
                'petertriho/cmp-git',
                config = [[ require "plugs.cfgs.git-cmp" ]],
                ft = 'gitcommit',
                event = 'InsertEnter',
            },

            {
                "kdheepak/cmp-latex-symbols",
                event = 'InsertEnter'
            },

            {
                'hrsh7th/cmp-nvim-lsp',
                ft = LSP_LANGS,
                event = 'InsertEnter',
            },

            {
                'hrsh7th/cmp-nvim-lua',
                ft = "lua",
                event = 'InsertEnter'
            },

            {
                'hrsh7th/cmp-path',
                event = 'InsertEnter',
            },

            { 'hrsh7th/vim-vsnip', event = 'InsertEnter' },
            { 'hrsh7th/vim-vsnip-integ', event = 'InsertEnter' },
            { 'hrsh7th/cmp-vsnip', event = 'InsertEnter' }
        }
    }

    use 'nvim-lua/plenary.nvim'


-- functionality mods
    use
    {
        -- cannot be lazy-loaded
        "p00f/godbolt.nvim",
        config = require("godbolt").setup({})
    }

    use "pedro757/indentInsert.nvim"

    use
    {
        "iamcco/markdown-preview.nvim",
        run = ":call mkdp#util#install()"
    }

    use
    {
        "windwp/nvim-autopairs",
        config = [[ require "plugs.cfgs.pairs" ]],
        event = "InsertEnter"
    }

    use
    {
        "norcalli/nvim-colorizer.lua",
        config = [[ require "plugs.cfgs.colorizer" ]],
        ft = 'lua'
    }

    use{ "AndrewRadev/splitjoin.vim", keys = { "gS", "gJ" }}

    use{ "simrat39/symbols-outline.nvim", ft = LSP_LANGS, }

    use{ "McAuleyPenney/tidy.nvim", event  = "BufWritePre" }

    use{ "rrethy/vim-illuminate", event = "CursorHold" }

    use "sickill/vim-pasta"

    use{ "machakann/vim-swap", keys = { "g<", "g>" }}


-- UI mods
    use
    {
        "akinsho/bufferline.nvim",
        config = [[ require "plugs.cfgs.bufferline" ]],
        event = "BufHidden"
    }

    use "McAuleyPenney/cacophony.nvim"

    use
    {
        "lukas-reineke/indent-blankline.nvim",
        config = [[ require "plugs.cfgs.indent_blankline" ]]
    }

    use
    {
        "ray-x/lsp_signature.nvim",
        -- for config, see lsp_init
        event = "InsertEnter",
        ft = LSP_LANGS,
    }

    use
    {
        "akinsho/toggleterm.nvim",
        config = [[ require "plugs.cfgs.toggleterm" ]],
        keys = "<C-space>"
    }

    use
    {
        "folke/trouble.nvim",
        config = [[ require "plugs.cfgs.trouble" ]],
        event  = "QuickFixCmdPre"
    }

    use{ "bfrg/vim-cpp-modern", ft = 'c' }

    use "itchyny/vim-highlighturl"


    -- other
    use{ "dstein64/vim-startuptime", cmd = "StartupTime" }


-- testing

    -- TODO test this when we have the time to break LSP
    -- "williamboman/nvim-lsp-installer",


    end,

    config =
    {
        display =
        {
            header_sym = '',
            open_fn = function()
                return require('packer.util').float({ border = "none" })
            end,
        }
    }
})
