local cmp = require"cmp"

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
                nvim_lsp    = 'LSP',
                emoji       = 'EMOJI',
                path        = 'PATH',
                orgmode     = 'ORG',
                vsnip       = 'VSNIP',
                buffer      = 'BUFFER',
            })[entry.source.name]

            return vim_item
        end

    },

    mapping =
    {
        ['<tab>'] = cmp.mapping.confirm({ select = true }),
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

    sources =
    {
        { name = 'buffer', max_item_count = 5 },
        { name = "cmp_git" },
        { name = 'emoji', max_item_count = 10 },
        { name = 'nvim_lsp', max_item_count = 5 },
        { name = 'nvim_lua', max_item_count = 5 },
        { name = 'path' },
        { name = 'vsnip' },
    },
})
