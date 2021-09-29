require("todo-comments").setup{
    keywords =
    {
        DONE = { color = "hint" },
        FIX =
        {
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        HACK = { color = "warning" },
        NOTE = { color = "hint", alt = { "INFO" } },
        PERF = { alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        TODO = { sign = ' ', color = "error" },
        WARN = { color = "warning", alt = { "WARNING", "XXX" } },

    },
    signs = false,
    merge_keywords = true,
    highlight =
    {
        before = "",
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
    },
    colors =
    {
        error   = { "#DC2626" },
        warning = { "#FBBF24" },
        info    = { "#2563EB" },
        hint    = { "#10B981" },
        default = { "#7C3AED" },
    },
}
