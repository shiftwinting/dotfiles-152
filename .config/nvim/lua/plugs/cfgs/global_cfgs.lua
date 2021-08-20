local snips = "/home/j/.config/nvim/utils/snips"

-- highlight url
vim.g.highlighturl_guifg = "#7289DA"

-- illuminate
vim.g.Illuminate_delay = 300
vim.g.Illuminate_highlightUnderCursor = 0


-- markdown preview
vim.g.mkdp_auto_start = 1
vim.g.mkdp_auto_close = 1
vim.g.mkdp_browser = "firefox"
vim.g.mkdp_page_title = "${name}.md"


-- mundo
vim.g.mundo_auto_preview_delay = 100
vim.g.mundo_header = 0
vim.g.mundo_preview_height = 50
vim.g.mundo_right = 1
vim.g.mundo_width = 85

-- registers
vim.g.registers_window_border = "none"

-- symbols_outline
vim.g.symbols_outline = {
    highlight_hovered_item = false,
    show_guides = true,
    auto_preview = false,
    position = "right",
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    keymaps =
    {
        close = "q",
        goto_location = "<Cr>",
        focus_location = "<space>",
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


-- vsnip
vim.g.vsnip_snippet_dir = snips
vim.g.vsnip_filetyes = {}
