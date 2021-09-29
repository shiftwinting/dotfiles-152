local snips = "/home/j/.config/nvim/utils/snips"

-- filetype.nvim
-- vim.g.did_load_filetypes = 1

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
vim.g.mkdp_preview_options =
{
    disable_sync_scroll = 0,
    disable_filename = 1
}

-- mundo
vim.g.mundo_auto_preview_delay = 100
vim.g.mundo_header = 0
vim.g.mundo_preview_height = 50
vim.g.mundo_right = 1
vim.g.mundo_width = 85

-- outline
vim.g.symbols_outline =
{
    highlight_hovered_item = false,
    show_guides = false,
    auto_preview = false,
}

-- registers
vim.g.registers_window_border = "none"

-- vsnip
vim.g.vsnip_snippet_dir = snips
vim.g.vsnip_filetyes = {}
