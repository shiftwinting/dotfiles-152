local g = vim.g


-- highlight url
g.highlighturl_guifg = "#7289DA"


-- illuminate
g.Illuminate_delay                  = 300
g.Illuminate_highlightUnderCursor   = 0


-- vsnip
g.vsnip_snippet_dir = "$HOME/.config/nvim/utils/snips"
g.vsnip_filetyes    = {}


-- filetype.nvim
g.did_load_filetypes = 1


-- markdown preview
vim.g.mkdp_auto_start       = 1
vim.g.mkdp_auto_close       = 1
vim.g.mkdp_browser          = "firefox"
vim.g.mkdp_page_title       = "${name}.md"
vim.g.mkdp_preview_options  = {
    disable_sync_scroll = 0,
    disable_filename    = 1
}

-- symbol outline
vim.g.symbols_outline =
{
    auto_preview            = false,
    highlight_hovered_item  = true,
    show_guides             = false,
    symbols = {
        Array           = {icon = "", hl = "TSConstant"},
        Boolean         = {icon = "⊨", hl = "TSBoolean"},
        Class           = {icon = ":", hl = "TSType"},
        Constant        = {icon = "𝝿", hl = "TSConstant"},
        Constructor     = {icon = "", hl = "TSConstructor"},
        Enum            = {icon = "ℰ", hl = "TSType"},
        EnumMember      = {icon = "", hl = "TSField"},
        Event           = {icon = "🗲", hl = "TSType"},
        Field           = {icon = "->", hl = "TSField"},
        File            = {icon = "", hl = "TSURI"},
        Function        = {icon = "ƒ", hl = "TSFunction"},
        Interface       = {icon = "ﰮ", hl = "TSType"},
        Key             = {icon = "🔐", hl = "TSType"},
        Method          = {icon = "ƒ", hl = "TSMethod"},
        Module          = {icon = "", hl = "TSNamespace"},
        Namespace       = {icon = "", hl = "TSNamespace"},
        Null            = {icon = "NULL", hl = "TSType"},
        Number          = {icon = "#", hl = "TSNumber"},
        Object          = {icon = "⦿", hl = "TSType"},
        Operator        = {icon = "+", hl = "TSOperator"},
        Package         = {icon = "", hl = "TSNamespace"},
        Property        = {icon = "->", hl = "TSMethod"},
        String          = {icon = "𝓐", hl = "TSString"},
        Struct          = {icon = "𝓢", hl = "TSType"},
        TypeParameter   = {icon = "𝙏", hl = "TSParameter"},
        Variable        = {icon = "χ", hl = "TSConstant"},
    },
    width = 45,
}
