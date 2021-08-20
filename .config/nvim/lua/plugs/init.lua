-- plugs
-- Sources
--  1. packer events are just neovim events: https://neovim.io/doc/user/autocmd.html#events


require "plugs.disable"
require "plugs.cfgs.global_cfgs"



LSP_LANGS   = { 'c', "lua", "python" }


return require( "packer" ).startup(function( use )

    use "wbthomason/packer.nvim"

    use "neovim/nvim-lspconfig"

    use
    {
        "nvim-treesitter/nvim-treesitter",
        config = [[ require "plugs.cfgs.treesitter" ]]
    }

-- functionality mods
    use "rhysd/committia.vim"

    use
    {
        "McAuleyPenney/expand.lua",
        event = "InsertEnter"
    }

    use
    {
        "rmagatti/goto-preview",
        ft = LSP_LANGS,
        config = [[ require "plugs.cfgs.goto-preview" ]]
    }

    use
    {
        "b3nj5m1n/kommentary",
        keys = "F14"
    }

   use
    {
        "norcalli/nvim-colorizer.lua",
        config = [[ require "plugs.cfgs.colorizer" ]]
    }


    use
    {
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = [[ require "plugs.cfgs.compe" ]],
        requires =
        {
            { "hrsh7th/vim-vsnip-integ", event = "InsertEnter" },
            { "hrsh7th/vim-vsnip", event = "InsertEnter " }
        }
    }

    use
    {
        'kristijanhusak/orgmode.nvim',
        config = [[ require "plugs.cfgs.orgmode" ]]
    }

    use "vim-scripts/restore_view.vim"

    use
    {
        "itchyny/vim-highlighturl",
        config = function()
            local blurp = "#7289DA"
            vim.g.highlighturl_guifg = blurp
        end
    }

    use
    {
        "rrethy/vim-illuminate",
        event = { "CursorHold" },
        config = function()
            vim.g.Illuminate_delay = 300
            vim.g.Illuminate_highlightUnderCursor = 0
        end
    }

    use
    {
        "matze/vim-move",
        config = function()
            vim.g.move_key_modifier = "C"
        end
    }

    use
    {
        "simnalamburt/vim-mundo",
        cmd = "MundoToggle"
    }

    use
    {
        "machakann/vim-swap",
        keys = { "g<", "g>" }
    }


-- UI mods
    use "McAuleyPenney/Cacophony-theme-nvim"

    use
    {
        "romgrk/nvim-treesitter-context",
        require'treesitter-context'.setup{
            throttle = true
        }
    }

    use
    {
        "tversteeg/registers.nvim",
        config = function()
            vim.g.registers_window_border = "single"
        end
    }

    use
    {
        "edluffy/specs.nvim",
        event = "WinScrolled",
        config = [[ require "plugs.cfgs.specs" ]]
    }

    use
    {
        "simrat39/symbols-outline.nvim",
        ft = LSP_LANGS
    }

    use
    {
        "folke/trouble.nvim",
        event = "QuickFixCmdPre",
        config = [[ require "plugs.cfgs.trouble" ]]
    }

    use "jrudess/vim-foldtext"

    use
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode"
    }


-- filetype-specific mods
    use
    {
        "iamcco/markdown-preview.nvim",
        run = ":call mkdp#util#install()"
    }

end)
