local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local fortune = require("alpha.fortune")

-- Set header
dashboard.section.header.val = {
  '                                        ',
  '   ▄▄▄▄▄ ▄   ██      ▄   ▄███▄   ██▄    ',
  '  ▀  █    █  █ █      █  █▀   ▀  █  █   ',
  '     █ █   █ █▄▄█ ██   █ ██▄▄    █   █  ',
  '  ▄ █  █   █ █  █ █ █  █ █▄   ▄▀ █  █   ',
  '   ▀   █▄ ▄█    █ █  █ █ ▀███▀   ███▀   ',
  '        ▀▀▀    █  █   ██                ',
  '              ▀                         '
}

-- Set menu
dashboard.section.buttons.val = {
  dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button( "f", "  > Find file", ":cd $HOME | Telescope find_files<CR>"),
  dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
  dashboard.button( "c", "  > Configs" , ":lua require('plugin.telescope').find_dots{}<CR>"),
  dashboard.button( "w", "  > Wiki" , ":lua require('plugin.telescope').find_wiki{}<CR>"),
  dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
-- return require('packer').startup(function()
--   use 'wbthomason/packer.nvim'
--   use {
--     'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--     requires = {'BlakeJC94/alpha-nvim-fortune'},
--     config = function() require("config.alpha") end
--   }
-- end)

dashboard.section.footer.val = fortune()

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
