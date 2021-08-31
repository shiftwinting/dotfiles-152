-- sources
--  1. packer events: https://neovim.io/doc/user/autocmd.html#events


require "impatient"
require "plugs.disable"
require "plugs.cfgs.global_cfgs"

LSP_LANGS   = { 'c', "lua", "python" }


return require( "packer" ).startup( function( use )

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
        event = 'InsertEnter',
        config = [[ require "plugs.cfgs.cmp" ]],
        requires =
        {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-emoji', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/vim-vsnip', after = 'nvim-cmp'},
            { 'hrsh7th/vim-vsnip-integ', after = 'nvim-cmp'},
            { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp'},
        }
    }

    use
    {
        "nvim-treesitter/nvim-treesitter",
        ft = LSP_LANGS,
        config = [[ require "plugs.cfgs.treesitter" ]]
    }


-- functionality mods
    use{ "McAuleyPenney/expand.lua", event = "InsertEnter" }

    use
    {
        "rmagatti/goto-preview",
        ft = LSP_LANGS,
        config = [[ require "plugs.cfgs.goto-preview" ]]
    }

    use{ "iamcco/markdown-preview.nvim", run = ":call mkdp#util#install()" }

    use{ "norcalli/nvim-colorizer.lua", config = [[ require "plugs.cfgs.colorizer" ]] }

    use{ 'kristijanhusak/orgmode.nvim', config = [[ require "plugs.cfgs.orgmode" ]] }

    use "vim-scripts/restore_view.vim"

    use{ "rrethy/vim-illuminate", event = { "CursorHold" }}

    use{ "simnalamburt/vim-mundo", cmd = "MundoToggle" }

    use{ "machakann/vim-swap", keys = { "g<", "g>" }}


-- UI mods
    use "McAuleyPenney/cacophony.nvim"

    use
    {
        "romgrk/nvim-treesitter-context",
        ft = LSP_LANGS,
        config = [[ require "plugs.cfgs.ts_context" ]]
    }

    use{ "tversteeg/registers.nvim", keys = '"' }

    use
    {
        "edluffy/specs.nvim",
        event = "WinScrolled",
        config = [[ require "plugs.cfgs.specs" ]]
    }

    use
    {
        "folke/trouble.nvim",
        event = "QuickFixCmdPre",
        config = [[ require "plugs.cfgs.trouble" ]]
    }

    use "jrudess/vim-foldtext"

    use "itchyny/vim-highlighturl"

    use{ "folke/zen-mode.nvim", cmd = "ZenMode" }


-- other
    use{ "dstein64/vim-startuptime", cmd = "StartupTime" }

end)
