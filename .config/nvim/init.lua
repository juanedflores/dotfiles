vim.g.mapleader = " "

require("core.utils")
require("core.plugins")
require("core.keymaps")
require("core.autocmds")
require("core.options")

vim.cmd("colorscheme lush_despacio")

vim.cmd("au FileType java lua require'plugin.nvim-lspconfig.server-configs.jdtls'.setup()")
