-- <leader> is spacebar
vim.g.mapleader = ' '

require('core.utils')
require('core.plugins')
require('core.keymaps')
require('core.autocmds')
require('core.options')

vim.g.vimwiki_ext2syntax = {}

-- vim.g.default_colorscheme = 'ayu'
-- vim.g.default_colorscheme = 'lush_despacio'
-- vim.g.default_colorscheme = 'solarized-osaka'
-- vim.g.default_colorscheme = 'retrobox'
-- vim.g.default_colorscheme = 'quiet'
-- vim.g.default_colorscheme = 'rose-pine'
vim.g.default_colorscheme = 'everforest'

vim.o.background = 'light'

vim.cmd('colorscheme ' .. vim.g.default_colorscheme)
