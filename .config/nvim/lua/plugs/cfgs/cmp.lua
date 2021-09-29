local cmp = require"cmp"

cmp.setup(
{
    documentation =
    {
        border = 'rounded',
    },

    experimental =
    {
        ghost_text =
        {
            hl_group = "CmpGhostText"
        }
    },

    formatting =
    {
        format = function(entry, vim_item)

            vim_item.menu = ({
                nvim_lsp = '[LSP]',
                emoji = '[Emoji]',
                path = '[Path]',
                orgmode = '[Org]',
                vsnip = '[Vsnip]',
                buffer = '[Buffer]',
            })[entry.source.name]

            return vim_item
        end

    },

    mapping =
    {
        ['<tab>'] = cmp.mapping.confirm({ select = true })
    },

    snippet =
    {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },

    -- TODO configure max items and sort
    sources =
    {
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'orgmode' },
        { name = 'path' },
        { name = 'emoji' },
        { name = 'spell' },
    },
})
