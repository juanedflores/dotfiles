vim.cmd 'packadd packer.nvim | au BufWritePost plugins.lua PackerCompile'
vim.opt.rtp = vim.opt.rtp + '~/.local/share/nvim/site/pack/packer/opt/*'

local packer = require 'packer'
local plugin_path = U.os.data .. '/site/pack/packer/opt/'
local packer_compiled = U.os.data .. '/site/plugin/packer_compiled.vim'

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return packer.startup(function(use)
  packer.init { compile_path = packer_compiled, opt_default = true }

  -- Plugin Manager
  use { 'wbthomason/packer.nvim' }

  -- Startup Screen
  use { 'goolord/alpha-nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  setup = [[require('plugin.alpha')]],
  opt = false
  }

  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    setup = [[require('plugin.lualine')]]
  }

  -- Toggle Comments 
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end,
    setup = [[require('plugin.comment')]]
  }

  use { 'folke/zen-mode.nvim' }

  -- File Manager
  use {'is0n/fm-nvim', setup = [[require('plugin.fm-nvim')]]}

  -- Note Taking
  -- use { 'vimwiki/vimwiki' }
  -- use { 'tools-life/taskwiki' }

  -- Stabilize windows
  use {
    'luukvbaal/stabilize.nvim',
    config = function()
      require('stabilize').setup()
    end,
  }

  -- Fuzzy Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep'} },
    setup = [[require('plugin.telescope')]]
  }

  -- Colorscheme
  use {
      "mcchrish/zenbones.nvim",
      requires = "rktjmp/lush.nvim",
  }

  -- use { "beauwilliams/focus.nvim", config = function() require("focus").setup({winhighlight = true, number = false, excluded_filetypes = { 'fterm', 'term', 'toggleterm' } }) end, opt = false }

  -- Terminal 
  use {"akinsho/toggleterm.nvim", setup = [[require('plugin.toggleterm')]]}

  -- Autoinstall/compile plugins
  if vim.fn.isdirectory(vim.fn.glob(plugin_path)) > 0 then
    packer.install()
  end
  if vim.fn.empty(vim.fn.glob(packer_compiled)) > 0 then
    packer.compile()
  end
end)
