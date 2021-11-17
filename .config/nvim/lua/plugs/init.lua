-- sources
--  1. packer events: https://neovim.io/doc/user/autocmd.html#events


require "impatient"
require "plugs.disable"
require "plugs.cfgs.global_cfgs"

LSP_LANGS = { 'c', "lua", "python" }


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
                ft = 'gitcommit',
                event = 'InsertEnter',
                keys = { "#", "@" }
            },

            {
                "kdheepak/cmp-latex-symbols",
                event = 'InsertEnter'
            },

            {
                'hrsh7th/cmp-nvim-lsp',
                event = 'InsertEnter',
                ft = LSP_LANGS
            },

            {
                'hrsh7th/cmp-nvim-lua',
                event = 'InsertEnter',
                ft = "lua"
            },

            {
                'hrsh7th/cmp-path',
                event = 'InsertEnter',
                keys = "/",
            },

            { 'hrsh7th/vim-vsnip', event = 'InsertEnter' },
            { 'hrsh7th/vim-vsnip-integ', event = 'InsertEnter' },
            { 'hrsh7th/cmp-vsnip', event = 'InsertEnter' }
        }
    }

-- functionality mods
    use{ "McAuleyPenney/expand.lua", event = "InsertEnter" }

    use "pedro757/indentInsert.nvim"

    use
    {
        "iamcco/markdown-preview.nvim",
        run = ":call mkdp#util#install()"
    }

    use
    {
        "norcalli/nvim-colorizer.lua",
        ft = 'lua',
        config = [[ require "plugs.cfgs.colorizer" ]]
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
        event = "BufHidden",
        config = [[ require "plugs.cfgs.bufferline" ]]
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
        event = "InsertEnter",
        ft = LSP_LANGS,
        -- for config, see lsp_init
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
        event  = "QuickFixCmdPre",
        config = [[ require "plugs.cfgs.trouble" ]]
    }

    use{ "bfrg/vim-cpp-modern", ft = 'c' }

    use "itchyny/vim-highlighturl"


    -- other
    use{ "dstein64/vim-startuptime", cmd = "StartupTime" }


-- testing

    -- TODO test this during winter break
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
