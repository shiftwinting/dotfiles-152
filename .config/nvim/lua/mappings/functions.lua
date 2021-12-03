-- api docs: https://neovim.io/doc/user/api.html


local api = vim.api


-- toggle num settings ------------------------------------------------
_G.num_toggle = function()

    local set_opt = api.nvim_win_set_option

    -- determine what settings are on
    local num_on    = api.nvim_win_get_option( 0, 'number' )
    local relnum_on = api.nvim_win_get_option( 0, 'relativenumber' )


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




-- put comments into buffer -------------------------------------------
_G.send_comment = function()

    local str =
    {
        c_sl = "// ",
        dash = "-- ",
        latx = "% ",
        text = "- ",
        octo = "# "
    }

    local ft_match_table =
    {
        [ 'c' ]             = str.c_sl,
        [ 'cuda' ]          = str.c_sl,
        [ 'gitcommit' ]     = str.text,
        [ 'gitconfig' ]     = str.octo,
        [ 'javascript' ]    = str.c_sl,
        [ "lua" ]           = str.dash,
        [ "make" ]          = str.octo,
        [ "markdown" ]      = str.text,
        [ "python" ]        = str.octo,
        [ "sh" ]            = str.octo,
        [ "tex" ]           = str.latx,
        [ "txt" ]           = str.text,
        [ "text" ]          = str.text,
        [ "vim" ]           = "\" ",
        [ "yaml" ]          = str.octo,
    }

    local ft = api.nvim_buf_get_option( 0, "filetype" )

    return ft_match_table[ft]
end




--[[
    Make grep a simpler command ----------------------------------------
    Thanks Romain! see https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
]]
vim.cmd
[[
    function! LOOK( ... )
        return system(join([&grepprg] + [expandcmd( join( a:000, ' ' ))], ' '))
    endfunction
]]

vim.cmd ":com -nargs=+ -complete=file_in_path -bar LOOK  cgetexpr LOOK(<f-args>)"
