local cmp = require'cmp'

require "cmp".setup({
    documentation =
    {
        border = 'rounded',
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
        ['<Tab>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        })
    },

    snippet =
    {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },

    sources =
    {
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'orgmode' },
        { name = 'path' },
        { name = 'emoji' },
    },
})