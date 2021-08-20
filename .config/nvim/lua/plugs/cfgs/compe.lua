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
        orgmode = true,
        path     = true;
        spell    = false;
        vsnip    =
        {
            enable = true;
            priority = 100;
        },
    }
}
