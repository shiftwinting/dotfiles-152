--[[
    Align on equals sign with Neat -------------------------------------
    Sources:
        http://vimdoc.sourceforge.net/htmldoc/map.html#:command-completion
        https://stackoverflow.com/questions/8964953/align-text-on-an-equals-sign-in-vim/51462785#51462785
        https://stackoverflow.com/questions/10572996/passing-command-range-to-a-function/10573044#10573044
        https://www.man7.org/linux/man-pages/man1/column.1.html
        https://vi.stackexchange.com/questions/2410/how-to-make-a-vimscript-function-with-optional-arguments
    Instructions:
        1. highlight range in visual
        2. Enter ex mode
        3. a. type Neat and
           b. provide an arg to align on that char/string
           c. provide no arg to align on '='
        4. hit enter
]]
-- This works but requires an arg. We want it to be optional
-- vim.cmd ":com -nargs=1 -range Neat :'<,'>! column -t -s<args> -o<args>"

vim.cmd
[[
    function! NEAT( arg = '=' )
        execute "silent '<,'>!" . "column -t -s" . a:arg . " -o" . a:arg
    endfunction
]]

vim.cmd ":com -nargs=? -range Neat '<,'>call NEAT(<f-args>)"
