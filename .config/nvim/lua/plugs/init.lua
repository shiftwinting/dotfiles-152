-- disable builtins
require( "plugs.disable" )


-- directory where subdirs related to plugins and options live
OPT_DIR = "/home/j/.config/nvim/opt_dirs/"


-- Plugin configuration
return require( 'packer' ).startup(function( use )

    -- packer
    use 'wbthomason/packer.nvim'

    -- lsp
    use 'neovim/nvim-lspconfig'

    use
    {
        'hrsh7th/nvim-compe',
        config = function()
            -- configs
            require( 'compe' ).setup
            {
                enabled = true,
                autocomplete = true,
                debug = false,
                min_length = 1,
                preselect = 'enable',
                throttle_time = 80,
                source_timeout = 100,
                incomplete_delay = 100,
                max_abbr_width = 100,
                max_kind_width = 100,
                max_menu_width = 100,

                -- pmenu apperance
                documentation =
                {
                   border = "none",
                   max_width = 120,
                   max_height = math.floor(vim.o.lines * 0.3),
                   pad_bottom = 2,
                   pad_top = 2
                };


                -- completion sources
                source =
                {
                    buffer =
                    {
                        enable = true;
                        priority = 99;
                    },
                    calc     = true;
      			    emoji    = true;
                    nvim_lsp =
                    {
                        enable = true;
                        priority = 98;
                    },
                    nvim_lua = true,
                    -- orgmode  = true,
                    path     = true;
                    spell    = false;
                    vsnip    = true;
                }
            }
        end
    }

    -- functionality mods
    use 'rhysd/committia.vim'

    use 'McAuleyPenney/expand.lua'

    use
    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {
                width = 85, -- Width of the floating window
                height = 45, -- Height of the floating window
                default_mappings = false; -- Bind default mappings
                debug = false; -- Print debug information
                opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
            }

        end
    }

    use 'b3nj5m1n/kommentary'

    use
    {
        'norcalli/nvim-colorizer.lua',
        require 'colorizer'.setup{
            'css',
            'lua',
            'text',
            'vim',
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
        config = function()
            vim.g.mundo_auto_preview_delay = 100
      	    vim.g.mundo_header = 0
      	    vim.g.mundo_preview_height = 50
            vim.g.mundo_right = 1
      	    vim.g.mundo_width = 85
        end
    }

    use 'mptre/vim-printf'

    use
    {
        'hrsh7th/vim-vsnip',
        config = function()
            vim.g.vsnip_snippet_dir = OPT_DIR .. "snips"
            vim.g.vsnip_filetyes = {}
        end
    }

    use 'hrsh7th/vim-vsnip-integ'

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
         require('specs').setup{
             show_jumps  = true,
             min_jump = 10,
             popup =
             {
                 delay_ms = 50, -- delay before popup displays
                 inc_ms = 12,   -- time increments used for fade/resize effects
                 blend = 45,    -- starting blend, between 0-100 (fully transparent), see :h winblend
                 width = 13,
                 winhl = "specsBG",
                 fader = require('specs').empty_fader,
                 resizer = require('specs').shrink_resizer
             },
             ignore_filetypes = {},
             ignore_buftypes =
             {
                 nofile = true,
             },
         }
    }

    use
    {
        "simrat39/symbols-outline.nvim"
    }

    vim.g.symbols_outline = {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = 'right',
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        keymaps =
        {
            close = "<Esc>",
            goto_location = "<Cr>",
            focus_location = "o",
            hover_symbol = "<C-space>",
            rename_symbol = "r",
            code_actions = "a",
        },
        symbols =
        {
            Function = {icon = "ƒ", hl = "TSFunction"},
        },
        lsp_blacklist = {},
    }

    use
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                height      = 7,
                action_keys =
                {
                    toggle_fold = ";"
                },

                signs =
                {
                    error = "error",
                    warning = "warn",
                    hint = "hint",
                    information = "info"
                },

                fold_closed  = ">", -- icon used for closed folds
                fold_open    = "v", -- icon used for open folds
                icons        = false,
                indent_lines = false,
                mode         = "quickfix",
                use_lsp_diagnostic_signs = true
            }
        end
    }

    use 'jrudess/vim-foldtext'

    use
    {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
            }
        end
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
