-- api docs: https://neovim.io/doc/user/api.html


local M = {}
local fn = vim.fn

-- automatically make dirs if they do not
-- exist, upon save
function M.mkdirs()
    local dir = fn.expand( '%:p:h' )

    if fn.isdirectory( dir ) == 0 then
        fn.mkdir( dir, 'p' )
    end
end


return M
