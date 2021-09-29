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
        branch = 'custom-menu',
        config = [[ require "plugs.cfgs.cmp" ]],
        requires =
        {
            { 'hrsh7th/cmp-nvim-lsp', event = 'InsertEnter', ft = LSP_LANGS },
            { 'hrsh7th/cmp-nvim-lua', event = 'InsertEnter', ft = "lua" },
            { 'hrsh7th/cmp-buffer', event = 'InsertEnter' },
            { 'hrsh7th/cmp-emoji', event = 'InsertEnter', keys = ':' },
            { 'hrsh7th/cmp-path', event = 'InsertEnter' },
            { 'f3fora/cmp-spell', event = 'InsertEnter', ft = "txt" },
            { 'hrsh7th/vim-vsnip', event = 'InsertEnter' },
            { 'hrsh7th/vim-vsnip-integ', event = 'InsertEnter' },
            { 'hrsh7th/cmp-vsnip', event = 'InsertEnter' }
        }
    }

-- functionality mods
    use{ "McAuleyPenney/expand.lua", event = "InsertEnter" }

    use "nathom/filetype.nvim"

    use{ "iamcco/markdown-preview.nvim", run = ":call mkdp#util#install()" }

    use{ "norcalli/nvim-colorizer.lua", config = [[ require "plugs.cfgs.colorizer" ]] }

    use{ 'kristijanhusak/orgmode.nvim', config = [[ require "plugs.cfgs.orgmode" ]] }

    use{ "simrat39/symbols-outline.nvim", ft = LSP_LANGS }

    use
    {
        "akinsho/toggleterm.nvim",
        keys = "<C-space>",
        config = [[ require "plugs.cfgs.toggleterm" ]]
    }

    use{ "rrethy/vim-illuminate", event = "CursorHold" }

    use{ "simnalamburt/vim-mundo", cmd = "MundoToggle" }

    use{ "machakann/vim-swap", keys = { "g<", "g>" }}

-- UI mods
    use "McAuleyPenney/cacophony.nvim"

    use
    {
        "edluffy/specs.nvim",
        event = "WinScrolled",
        config = [[ require "plugs.cfgs.specs" ]]
    }

    use
    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = [[ require "plugs.cfgs.todo_comments" ]]
    }

    use
    {
        "folke/trouble.nvim",
        event = "QuickFixCmdPre",
        config = [[ require "plugs.cfgs.trouble" ]]
    }

    use{ "bfrg/vim-cpp-modern", ft = 'c' }

    use "itchyny/vim-highlighturl"

-- other
    use{ "dstein64/vim-startuptime", cmd = "StartupTime" }

end)
