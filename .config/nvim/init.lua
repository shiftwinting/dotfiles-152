-- init

vim.cmd "colorscheme cacophony"

local modules =
{
   "options.init",
   "mappings.init",
   "aucmd.init",
   "plugs.init",
   "lsp_init"
}

for index = 1, #modules do
    require( modules[index] )
end
