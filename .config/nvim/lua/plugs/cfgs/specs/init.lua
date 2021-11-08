require('specs').setup{
    show_jumps  = true,
    min_jump = 10,
    popup =
    {
        delay_ms = 50,      -- delay before popup displays
        inc_ms   = 12,      -- time increments used for fade/resize effects
        blend    = 45,      -- starting blend, between 0-100 (fully transparent), see :h winblend
        width    = 13,
        winhl    = "specsBG",
        fader    = require('specs').empty_fader,
        resizer  = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes =
    {
        nofile = true,
    },
}
