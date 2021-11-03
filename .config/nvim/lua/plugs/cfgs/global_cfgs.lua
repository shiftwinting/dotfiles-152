local g = vim.g
local snips = "/home/j/.config/nvim/utils/snips"

-- filetype.nvim
g.did_load_filetypes = 1

-- highlight url
g.highlighturl_guifg = "#7289DA"

-- indent_blankline
g.indent_blankline_max_indent_increase = 1
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_char_list = {'┊'}

-- illuminate
g.Illuminate_delay                  = 300
g.Illuminate_highlightUnderCursor   = 0

-- markdown preview
g.mkdp_auto_start       = 1
g.mkdp_auto_close       = 1
g.mkdp_browser          = "firefox"
g.mkdp_page_title       = "${name}.md"
g.mkdp_preview_options  =
{
    disable_sync_scroll = 0,
    disable_filename    = 1
}

-- mundo
g.mundo_auto_preview_delay  = 100
g.mundo_header              = 0
g.mundo_preview_height      = 50
g.mundo_right               = 1
g.mundo_width               = 85

-- outline
g.symbols_outline =
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

-- vimtex
g.tex_flavor                = 'latex'
g.vimtex_compiler_latexmk   =
{
    build_dir  = "build",
    callback   = 1,
    continuous = 1,
    executable = "/usr/bin/latexmk",
    options =
    {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode'
    }
}
g.vimtex_compiler_silent    = 1
g.vimtex_fold_enabled       = 1
g.vimtex_mappings_enabled   = 0
g.vimtex_view_method        = 'zathura'

-- vsnip
g.vsnip_snippet_dir = snips
g.vsnip_filetyes    = {}
