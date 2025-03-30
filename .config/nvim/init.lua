--' <leader> is spacebar
vim.g.mapleader = ' '

require('core.utils')
require('core.keymaps')
require('core.autocmds')
require('core.options')
require('core.plugins')

-- vim.g.default_colorscheme = 'lush_despacio'
-- vim.g.default_colorscheme = 'ayu'
-- vim.g.default_colorscheme = 'rose-pine'
-- vim.g.default_colorscheme = 'gruvbox-material'
-- vim.g.default_colorscheme = 'lackluster-hack'
-- vim.g.default_colorscheme = 'melange'
-- vim.g.default_colorscheme = 'solarized-osaka'
-- vim.g.default_colorscheme = 'miasma'
-- vim.g.default_colorscheme = 'modus'
vim.g.default_colorscheme = 'horizon'

-- vim.o.background = 'light'
vim.o.background = 'dark'

vim.cmd('colorscheme ' .. vim.g.default_colorscheme)
-- (
vim.cmd('highlight! link WinBar lualine_c_normal')

if vim.g.default_colorscheme == 'modus' and vim.o.background == 'dark' then
  vim.cmd('highlight Normal guibg=none')
end

-- vim.cmd('highlight MarkviewCode guibg=#001419')
--
vim.cmd('hi markdownH1 guifg=#c85151 gui=bold')
vim.cmd('hi markdownH2 guifg=#ca7b3e gui=bold')
vim.cmd('hi markdownH3 guifg=#bca442 gui=bold')
vim.cmd('hi markdownH4 guifg=#a2ca67 gui=bold')
vim.cmd('hi markdownH5 guifg=#9cecfb gui=bold')
vim.cmd('hi markdownH6 guifg=#83a4d4 gui=bold')

--
vim.cmd('hi MarkviewPalette1 guifg=#384fac guibg=#f3c95b')
-- vim.cmd('hi MarkviewPalette2 guifg=#ca7b3e guibg=#211409')
-- vim.cmd('hi MarkviewPalette3 guifg=#bca442 guibg=#1e1a0a')
-- vim.cmd('hi MarkviewPalette4 guifg=#a2ca67 guibg=#1b240d')
-- vim.cmd('hi MarkviewPalette5 guifg=#9cecfb guibg=#02353e')
-- vim.cmd('hi MarkviewPalette6 guifg=#83a4d4 guibg=#233e66')

vim.cmd('hi Markviewheading1Sign guifg=#384fac guibg=#f3c95b')
-- vim.cmd('hi Markviewheading2Sign guifg=#ca7b3e guibg=#533117')
-- vim.cmd('hi Markviewheading3Sign guifg=#bca442 guibg=#4b421a')
-- vim.cmd('hi Markviewheading4Sign guifg=#a2ca67 guibg=#435a20')
-- vim.cmd('hi Markviewheading5Sign guifg=#9cecfb guibg=#06859c')
-- vim.cmd('hi Markviewheading6Sign guifg=#83a4d4 guibg=#233e66')

-- vim.cmd('hi HelpviewPalette1Fg guifg=#c85151')
-- vim.cmd('hi HelpviewPalette2Fg guifg=#ca7b3e')
-- vim.cmd('hi HelpviewPalette3Fg guifg=#bca442')
-- vim.cmd('hi HelpviewPalette4Fg guifg=#a2ca67')
-- vim.cmd('hi HelpviewPalette5Fg guifg=#9cecfb')
-- vim.cmd('hi HelpviewPalette6Fg guifg=#83a4d4')

vim.keymap.set('n', '<CR>', '<Plug>(leap-anywhere)')

-- vim.g.pico8_config = {}
-- vim.g.pico8_config.pico8_path = '/Applications/PICO-8.app/Contents/MacOS/pico8'
