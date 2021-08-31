-- api docs: https://neovim.io/doc/user/api.html


local send_keys = function(str)
    return vim.api.nvim_replace_termcodes( str, true, true, true )
end


-- functions
_G.num_toggle = function()

    local set_opt = vim.api.nvim_win_set_option

    -- determine what settings are on
    local num_on    = vim.api.nvim_win_get_option( 0, 'number' )
    local relnum_on = vim.api.nvim_win_get_option( 0, 'relativenumber' )


    -- if number is off, turn it on
    if not num_on then
        set_opt( 0, 'number', true )

    -- if number is on but relnum is off, turn on relnum
    elseif num_on and not relnum_on then
        set_opt( 0, 'relativenumber', true )

    -- if relnum is on, turn all off
    else
        set_opt( 0, 'number', false )
        set_opt( 0, 'relativenumber', false )
    end


    return ''
end


-- compe
_G.arrow_down = function()
    return vim.fn.pumvisible() == 1 and send_keys "<C-n>" or send_keys "<down>"
end


_G.arrow_up = function()
    return vim.fn.pumvisible() == 1 and send_keys "<C-p>" or send_keys "<up>"
end


-- commenting
_G.send_comment = function()

    local comment_dict =
    {
        [ 'c' ] = "//",
        [ "lua" ] = "--",
        [ "python" ] = '#',
        [ "sh" ] = '#'
    }

    local ft = vim.api.nvim_buf_get_option( 0, "filetype" )

    local comment_str = comment_dict[ ft ] .. '<Space>'

    if vim.api.nvim_get_mode()[ "mode" ]  == 'n' then
        comment_str = 'a' .. comment_str
    end

    return send_keys( comment_str )
end
