--[[
    Thanks Iron-E!
    https://gitlab.com/Iron_E/dotfiles/-/blob/b8b8cc921b08d4be84a0dea343ec7cf8698bea14/.config/nvim/lua/init/config.lua#L101
]]
_G.fold_func = function()

    local first_line_str =
        vim.api.nvim_buf_get_lines(
            0,
            vim.v.foldstart - 1,
            vim.v.foldstart,
            true
        )[1]

    local folded_line_count = vim.v.foldend - vim.v.foldstart

    local fold_str =
        string.format(
            "%s {%s more lines}",
            first_line_str,
            folded_line_count
        )

    return fold_str
end
