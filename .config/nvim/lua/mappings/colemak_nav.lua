-- colemak nmode bindings --

local map  = vim.api.nvim_set_keymap
local nore = { noremap = true }


-- home row: right nav
map( '', 'n', 'j', nore )
map( '', 'N', 'J', nore )
map( '', 'e', 'k', nore )
map( '', 'E', 'K', nore )

map( '', 'j', 'n', nore )
map( '', 'J', 'N', nore )
map( '', 'k', 'e', nore )
map( '', 'K', 'E', nore )

-- home row: left nav
map( '', 's', 'h', nore )
map( '', 'S', 'H', nore )
map( '', 't', 'l', nore )
map( '', 'T', 'L', nore )

map( '', 'h', 's', nore )
map( '', 'H', 'S', nore )
map( '', 'l', 't', nore )
map( '', 'L', 'T', nore )
