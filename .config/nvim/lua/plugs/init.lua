-- plugs
-- Sources
--  1. packer events are just neovim events: https://neovim.io/doc/user/autocmd.html#events


-- disable builtins
require "plugs.disable"


-- directory where subdirs related to plugins and options live
OPT_DIR = "/home/j/.config/nvim/opt_dirs/"


-- Plugin configuration
return require( 'packer' ).startup(function( use )

    -- packer
    use 'wbthomason/packer.nvim'

    -- lsp
    use 'neovim/nvim-lspconfig'


-- functionality mods
    use 'rhysd/committia.vim'

    use
    {
        'McAuleyPenney/expand.lua',
        event = "InsertEnter"
    }

    use
    {
        'rmagatti/goto-preview',
        config = [[ require "plugs.cfgs.goto-preview" ]]
    }

    use
    {
        'b3nj5m1n/kommentary',
        keys = "F14"
    }

    use
    {
        'norcalli/nvim-colorizer.lua',
        ft = { "css", "lua", "text", "vim" },
        config = [[ require "plugs.cfgs.colorizer" ]]
    }

    use
    {
        'hrsh7th/nvim-compe',
        event = "InsertEnter",
        config = [[ require "plugs.cfgs.compe" ]],
        requires = {
            { 'hrsh7th/vim-vsnip-integ', event = "InsertEnter" },
            {
                'hrsh7th/vim-vsnip',
                event = "InsertEnter",
                config = function()
                    vim.g.vsnip_snippet_dir = OPT_DIR .. "snips"
                    vim.g.vsnip_filetyes = {}
                end
            }
        }
    }

    use 'vim-scripts/restore_view.vim'

    use
    {
        'itchyny/vim-highlighturl',
        config = function()
            local dissonance = "#7289DA"
            vim.g.highlighturl_guifg = dissonance
        end
    }

    use
    {
        'rrethy/vim-illuminate',
        event = { "CursorHold" },
        config = function()
            vim.g.Illuminate_delay = 300
            vim.g.Illuminate_highlightUnderCursor = 0
        end
    }

    use
    {
        'matze/vim-move',
        config = function()
            vim.g.move_key_modifier = 'C'
        end
    }

    use
    {
        'simnalamburt/vim-mundo',
        cmd = "MundoToggle",
        config = function()
            vim.g.mundo_auto_preview_delay = 100
      	    vim.g.mundo_header = 0
      	    vim.g.mundo_preview_height = 50
            vim.g.mundo_right = 1
      	    vim.g.mundo_width = 85
        end
    }

    use 'machakann/vim-swap'


-- UI mods
    use 'McAuleyPenney/Cacophony-theme-nvim'

    use
    {
        "tversteeg/registers.nvim",
        config = function()
            vim.g.registers_window_border = "single"
        end
    }

    use
    {
        'edluffy/specs.nvim',
        config = [[ require "plugs.cfgs.specs" ]],
        event = "WinScrolled"
    }

    use "simrat39/symbols-outline.nvim"

    use
    {
        "folke/trouble.nvim",
        config = [[ require "plugs.cfgs.trouble" ]],
        event = "QuickFixCmdPre"
    }

    use
    {
        'jrudess/vim-foldtext',
        keys = "za"
    }

    use
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode"
    }


-- filetype-specific mods
    use
    {
        'iamcco/markdown-preview.nvim',
        run = ':call mkdp#util#install()',
        config =  function()
      	  vim.g.mkdp_auto_start = 1
      	  vim.g.mkdp_auto_close = 1
      	  vim.g.mkdp_browser = 'firefox'
      	  vim.g.mkdp_page_title = '${name}.md'
        end
    }

end)
