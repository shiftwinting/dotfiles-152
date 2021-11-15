require("trouble").setup {
    height      = 7,
    action_keys =
    {
        toggle_fold = ";"
    },

    signs =
    {
        error       = "error",
        warning     = "warn",
        hint        = "hint",
        information = "info"
    },

    auto_open    = false,
    auto_close   = false,
    fold_closed  = ">", -- icon used for closed folds
    fold_open    = "v", -- icon used for open folds
    icons        = false,
    indent_lines = false,
    mode         = "quickfix",
}
