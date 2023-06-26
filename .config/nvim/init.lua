vim.g.mapleader = ' '

require('core.utils')
require('core.plugins')
require('core.keymaps')
require('core.autocmds')
require('core.options')

-- vim.g.default_colorscheme = 'nordfox'
vim.g.default_colorscheme = 'lush_despacio'
vim.cmd('colorscheme ' .. vim.g.default_colorscheme)

vim.cmd([[
let g:vimwiki_list = [{'path': '/Users/juanedflores/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Zettelkasten', 'syntax': 'markdown', 'ext': '.md', 'diary_rel_path': 'DailyDiary/'}]
]])
