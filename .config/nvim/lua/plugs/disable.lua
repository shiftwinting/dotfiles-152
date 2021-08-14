-- stolen from WBThomason
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
    'rrhelper',
    'spellfile_plugin',
    'tar',
    'tarPlugin',
    'vimball',
    'vimballPlugin',
    'zip',
    'zipPlugin'
}

for index = 1, #to_disable do
    vim.g['loaded_' .. to_disable[index]] = 1 end
