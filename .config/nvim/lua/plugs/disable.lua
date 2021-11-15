-- default plugins: https://neovim.io/doc/user/index.html#standard-plugin-list

-- disable default plugins
local to_disable =
{
    '2html_plugin',
    'getscript',
    'getscriptPlugin',
    'gzip',
    'logiPat',
    'matchit',
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'remote_plugins',
    'rrhelper',
    'spellfile_plugin',
    'spec',
    'tar',
    'tarPlugin',
    'vimball',
    'vimballPlugin',
    'zip',
    'zipPlugin'
}

for _, plug in ipairs( to_disable) do
    vim.g['loaded_' .. plug] = 1
end


-- disable runtime filetype files
vim.g.python_recommended_style = 0
