-- sources
--  1. packer events: https://neovim.io/doc/user/autocmd.html#events


require "impatient"
require "plugs.disable"
require "plugs.cfgs.global_cfgs"

LSP_LANGS = { 'c', "lua", "python" }


return require( "packer" ).startup({function( use )

-- base
    -- the functionality for this plugin will be
    -- merged into upstream at some point. Watch
    -- for it here: https://github.com/neovim/neovim/pull/15436
    use{ 'lewis6991/impatient.nvim', rocks = 'mpack' }

    use "neovim/nvim-lspconfig"

    use "wbthomason/packer.nvim"

    use
    {
        'hrsh7th/nvim-cmp',
        config = [[ require "plugs.cfgs.cmp.init" ]],
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
                keys = { "#", "@" }
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

            { 'hrsh7th/cmp-path', event = 'InsertEnter' },
            { 'hrsh7th/vim-vsnip', event = 'InsertEnter' },
            { 'hrsh7th/vim-vsnip-integ', event = 'InsertEnter' },
            { 'hrsh7th/cmp-vsnip', event = 'InsertEnter' }
        }
    }

-- functionality mods
    use{ "McAuleyPenney/expand.lua", event = "InsertEnter" }

    use "nathom/filetype.nvim"

    use{ "iamcco/markdown-preview.nvim", run = ":call mkdp#util#install()" }

    use
    {
        "norcalli/nvim-colorizer.lua",
        config = [[ require "plugs.cfgs.colorizer.init" ]]
    }

    use{ "AndrewRadev/splitjoin.vim", keys = { "gS", "gJ" }}

    use{ "simrat39/symbols-outline.nvim", ft = LSP_LANGS }

    use "McAuleyPenney/tidy.nvim"

    use{ "rrethy/vim-illuminate", event = "CursorHold" }

    use{ "simnalamburt/vim-mundo", cmd = "MundoToggle" }

    use{ "machakann/vim-swap", keys = { "g<", "g>" }}


-- UI mods
    use "McAuleyPenney/cacophony.nvim"

    use
    {
        "lukas-reineke/indent-blankline.nvim",
        config = [[ require "plugs.cfgs.indent_blankline.init" ]]
    }

    use
    {
        "ray-x/lsp_signature.nvim",
        ft = LSP_LANGS
        -- for config, see lsp_init
    }

    use
    {
        "edluffy/specs.nvim",
        event = "WinScrolled",
        config = [[ require "plugs.cfgs.specs.init" ]]
    }

    use
    {
        "folke/trouble.nvim",
        event  = "QuickFixCmdPre",
        config = [[ require "plugs.cfgs.trouble.init" ]]
    }

    use{ "bfrg/vim-cpp-modern", ft = 'c' }

    use "itchyny/vim-highlighturl"

-- other
    use{ "dstein64/vim-startuptime", cmd = "StartupTime" }

end,

config =
{
    display =
    {
        header_sym = '',
        open_fn = function()
            return require('packer.util').float({ border = "none" })
        end,
    }}
})
