-- api docs: https://neovim.io/doc/user/api.html


local api = vim.api


-- prefer nvim_input for sending strings that are not
-- special, e.g. <C-o>, because it is {fast}
local send_keys = function(str)
    return api.nvim_replace_termcodes( str, true, true, true )
end




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
        [ 'c' ]         = str.c_sl,
        [ 'gitcommit' ] = str.text,
        [ "lua" ]       = str.dash,
        [ "markdown" ]  = str.text,
        [ "python" ]    = str.octo,
        [ "sh" ]        = str.octo,
        [ "tex" ]       = str.latx,
        [ "txt" ]       = str.text,
        [ "text" ]      = str.text,
        [ "vim" ]       = "\" ",
        [ "yaml" ]      = str.octo,
    }

    local ft = api.nvim_buf_get_option( 0, "filetype" )

    api.nvim_input( ft_match_table[ft] )

    return ''
end




-- Make grep a simpler command ----------------------------------------
-- Thanks Romain! see https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
vim.cmd
[[
    function! LOOK(...)
        return system(join([&grepprg] + [expandcmd( join( a:000, ' ' ))], ' '))
    endfunction
]]

vim.cmd ":com -nargs=+ -complete=file_in_path -bar LOOK  cgetexpr LOOK(<f-args>)"




-- Align on equals sign with Neat -------------------------------------
--  Instructions:
--      1. highlight range in visual
--      2. Enter ex mode
--      3. Type Neat and hit enter
--  Future Plans: allow for optional/default args
--  Sources:
--      http://vimdoc.sourceforge.net/htmldoc/map.html#:command-completion
--      https://stackoverflow.com/questions/8964953/align-text-on-an-equals-sign-in-vim/51462785#51462785
--      https://stackoverflow.com/questions/10572996/passing-command-range-to-a-function/10573044#10573044
--      https://www.man7.org/linux/man-pages/man1/column.1.html
vim.cmd ":com -range Neat :'<,'>! column -t -s= -o="
