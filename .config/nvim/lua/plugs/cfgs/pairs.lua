require('nvim-autopairs').setup{
    close_triple_quotes = true,
    check_ts = false,
    enable_check_bracket_line = true,

    -- fast_wrap = {
    --     -- map = '<leader>p',
    --     chars = { '{', '[', '(', '"', "'" },
    --     pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    --     offset = 0, -- Offset from pattern match
    --     end_key = '$',
    --     keys = 'qwertyuiopzxcvbnmasdfghjkl',
    --     check_comma = true,
    --     highlight = 'Search',
    --     highlight_grey='Comment'
    -- },
}
