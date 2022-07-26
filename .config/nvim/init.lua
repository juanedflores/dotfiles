vim.g.mapleader = ' '

require('core.utils')
require('core.plugins')
require('core.keymaps')
require('core.autocmds')
require('core.options')

vim.g.default_colorscheme = 'nightfox'
vim.cmd('colorscheme ' .. vim.g.default_colorscheme)
