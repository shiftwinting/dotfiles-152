-- sources
--  1. packer events: https://neovim.io/doc/user/autocmd.html#events


require "plugs.disable"
require "plugs.cfgs.global_cfgs"
require "impatient"

local COMPILED_PATH = vim.fn.stdpath "cache".."/packer/packer_compiled.lua"
local LSP_LANGS = { 'sh', 'c', "lua", "python" }



require "packer".startup({ function( use )

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
        module = "cmp",
        event  = "InsertEnter",
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

    use{ 'nvim-lua/plenary.nvim', module = "plenary" }


-- non-base
    vim.cmd "packadd! cfilter"

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

    use{ "pedro757/indentInsert.nvim", module = "indentInsert" }

    use
    {
        "ray-x/lsp_signature.nvim",
        -- for config, see lsp_init
        event = "InsertEnter",
        ft = LSP_LANGS,
    }

    use
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
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
        cmd = "TroubleToggle"
    }

    use{ "bfrg/vim-cpp-modern", ft = 'c' }


    use "itchyny/vim-highlighturl"

    use{ "rrethy/vim-illuminate", event = "CursorHold" }

    use "sickill/vim-pasta"

    use{ "dstein64/vim-startuptime", cmd = "StartupTime" }

    use{ "machakann/vim-swap", keys = { "g<", "g>" }}

    use
    {
        "lukas-reineke/virt-column.nvim",
        config = function()
            require "virt-column".setup { char = "│" }
        end,
        event = "InsertEnter"
    }


-- testing
    use
    {
        "blackCauldron7/surround.nvim",
        module = "surround",
        config = function()
            require"surround".setup{
                mappings_style = "sandwich",
                prefix = "<F14>"
            }
        end,
    }

    use
    {
        "saifulapm/chartoggle.nvim",
        require('chartoggle').setup({
            leader = 'm',
            keys = { ',', ';', ':' }
        })
    }

    end,

    config =
    {
        compile_path = COMPILED_PATH,
        display =
        {
            header_sym = '',
            open_fn = function()
                return require('packer.util').float({ border = "none" })
            end,
        }
    }
})


-- load plugins from chosen location
if not vim.g.packer_compiled_loaded
then
    vim.cmd( string.format( 'source %s', COMPILED_PATH ))
    vim.g.packer_compiled_loaded = true
end
