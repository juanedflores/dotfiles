vim.g.mapleader = " "

require("core.utils")
require("core.plugins")
require("core.keymaps")
require("core.autocmds")
require("core.options")

require("nvim-treesitter.install").compilers = { "gcc" }

vim.cmd("colorscheme lush_despacio")
