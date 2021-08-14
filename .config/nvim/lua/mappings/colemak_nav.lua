-- colemak nmode bindings --

local map  = vim.api.nvim_set_keymap
local nore = { noremap = true }


-- home row: right nav
map( '', 'n', 'j', nore )
map( '', 'e', 'k', nore )

-- home row: left nav
map( '', 's', 'h', nore )
map( '', 't', 'l', nore )

