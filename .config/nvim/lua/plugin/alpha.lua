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
  dashboard.button('w', '  > Wiki', ":lua require('plugin.telescope').find_wiki{}<CR>"),
  dashboard.button('b', 'ß  > Blog', ':e /Users/juanedflores/Documents/Websites/juanedflores-Website/blog.html<CR>'),
  dashboard.button('t', '†  > Tidal', ':e /Users/juanedflores/Documents/Tidalcycles/DADS/main.tidal<CR>'),
  dashboard.button('s', '§  > SuperCollider', ':e /Users/juanedflores/Documents/SuperCollider/startup.scd<CR>'),
  dashboard.button('p', 'P  > Processing', ':e /Users/juanedflores/Documents/Processing/my_sketches/test/test.pde<CR>'),
  dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
}

dashboard.section.footer.val = fortune()

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
