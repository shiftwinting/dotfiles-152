local cmp = require"cmp"

-- TODO
--  test autopairs integration

cmp.setup(
{
    documentation =
    {
        border = 'rounded',
    },

    experimental =
    {
        native_menu = true
    },

    formatting =
    {
        format = function(entry, vim_item)

            vim_item.menu = ({
                buffer      = 'BUFFER',
                emoji       = 'EMOJI',
                cmp_git     = 'GIT',
                nvim_lsp    = 'LSP',
                path        = 'PATH',
                vsnip       = 'VSNIP',
            })[entry.source.name]

            return vim_item
        end
    },

    mapping =
    {
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<down>'] = function( fallback )
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end
    },

    snippet =
    {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },

    sorting =
    {
        comparators =
        {
            -- sort on locality
            function(...) return require('cmp_buffer'):compare_locality(...) end
        }
    },

    sources =
    {
        { name = 'buffer', max_item_count = 5 },
        { name = "cmp_git" },
        { name = 'emoji', max_item_count = 10 },
        { name = "latex_symbols", max_item_count = 7 },
        { name = 'nvim_lsp', max_item_count = 5 },
        { name = 'nvim_lua', max_item_count = 5 },
        { name = 'path' },
        { name = 'vsnip' },
    },
})


-- autopairs integration
-- require('nvim-autopairs').setup()
