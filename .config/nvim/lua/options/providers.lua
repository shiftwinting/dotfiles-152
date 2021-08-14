-- providers
--  Notes:
--  for providers,  see https://github.com/neovim/neovim/blob/master/runtime/doc/provider.txt

--  turn off python 2, perl, and ruby support for now
vim.g.loaded_node_provider   = 0
vim.g.loaded_perl_provider   = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider   = 0

-- python 3 provider
vim.g.python3_host_prog = '/usr/bin/python3'
