local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local fortune = require('alpha.fortune')

-- Set header
dashboard.section.header.val = {
  '                                        ',
  '   ▄▄▄▄▄ ▄   ██      ▄   ▄███▄   ██▄    ',
  '  ▀  █    █  █ █      █  █▀   ▀  █  █   ',
  '     █ █   █ █▄▄█ ██   █ ██▄▄    █   █  ',
  '  ▄ █  █   █ █  █ █ █  █ █▄   ▄▀ █  █   ',
  '   ▀   █▄ ▄█    █ █  █ █ ▀███▀   ███▀   ',
  '        ▀▀▀    █  █   ██                ',
  '              ▀                         ',
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
  dashboard.button('f', '  > Find file', ':cd $HOME | Telescope find_files<CR>'),
  dashboard.button('r', '  > Recent', ':Telescope oldfiles<CR>'),
  dashboard.button('c', '  > Configs', ":lua require('plugin.telescope').find_dots{}<CR>"),
  dashboard.button(
    'w',
    '  > Wiki',
    ':e /Users/juanedflores/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten/_Index_of_Zettelkasten.md<CR>'
  ),
  dashboard.button('b', 'ß  > Blog', ':e /Users/juanedflores/Documents/Websites/juanedflores-Website/blog.html<CR>'),
  dashboard.button('x', '󰜎  > LeetCoder', ':Leet<CR>'),
  dashboard.button('t', '†  > Tidal', ':e /Users/juanedflores/Documents/Tidalcycles/DADS/main.tidal<CR>'),
  dashboard.button('s', '§  > SuperCollider', ':e /Users/juanedflores/Documents/SuperCollider/startup.scd<CR>'),
  dashboard.button(
    'm',
    '  > Class',
    ':e /Users/juanedflores/Documents/Teaching/Intro_to_New_Media_Arts/index.html<CR>'
  ),
  dashboard.button('p', 'P  > Processing', ':e /Users/juanedflores/Documents/Processing/my_sketches/test/test.pde<CR>'),
  dashboard.button(
    'i',
    '  > Reminders',
    ':e /Users/juanedflores/.local/share/nvim/lazy/alpha-nvim/lua/alpha/fortune.lua<CR>'
  ),
  dashboard.button('l', '𝕝  > Plugins', ':Lazy<CR>'),
  dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
}

dashboard.section.footer.val = fortune()

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
