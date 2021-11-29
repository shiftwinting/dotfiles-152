local M = {}

M.hi_long_lines = function()
    -- get textwidth
    local textwidth = '%'..vim.api.nvim_get_option( 'textwidth' )

    -- hightlight long lines with Error hi group
    vim.cmd( string.format( [[match Error /\%sv.\+/]], textwidth ))
end


return M
