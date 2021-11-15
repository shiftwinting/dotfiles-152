-- init

vim.cmd "colorscheme cacophony"

local modules =
{
   "options.init",
   "mappings.init",
   "aucmd",
   "plugs.init",
   "lsp"
}

for index = 1, #modules do
    require( modules[index] )
end
