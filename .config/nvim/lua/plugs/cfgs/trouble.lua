require("trouble").setup{
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

    fold_closed  = ">", -- icon used for closed folds
    fold_open    = "v", -- icon used for open folds
    icons        = false,
    indent_lines = false,
    mode         = "quickfix",
}
