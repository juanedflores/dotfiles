local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    -- startup screen
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugin.alpha')
    end,
  },
  {
    -- treesitter highlighting
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('plugin.nvim-treesitter')
    end,
    build = ':TSUpdate',
  },
  {
    -- treesitter playground
    'nvim-treesitter/playground',
  },
  {
    -- status line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugin.lualine')
    end,
  },
  {
    -- toggle comments
    'numToStr/Comment.nvim',
    config = function()
      require('plugin.comment')
    end,
  },
  {
    -- visualize indents
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugin.indent-blankline')
    end,
  },
  {
    -- fuzzy finder
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugin.telescope')
    end,
  },
  {
    'folke/zen-mode.nvim',
    config = function()
      require('plugin.zen-mode')
    end,
  },
  {
    'Pocco81/true-zen.nvim',
    config = function()
      require('plugin.true-zen')
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugin.nvim-tree')
    end,
  },
  {
    -- package manager for installing lsp servers, dap, linters, formatters
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
  },
  {
    -- amongst your other plugins
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('plugin.toggleterm')
    end,
  },
  {
    -- lsp
    'neovim/nvim-lspconfig',
    config = function()
      require('plugin.nvim-lspconfig')
    end,
  },
  {
    -- bridges lspconfig and mason
    'williamboman/mason-lspconfig.nvim',
  },
  {
    -- debug adapter protocol
    'mfussenegger/nvim-dap',
    config = function()
      require('plugin.dap')
    end,
  },
  {
    -- linter
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('plugin.null-ls')
    end,
  },
  {
    -- for colorschemes
    'rktjmp/lush.nvim',
  },
  {
    -- to use lf file manager
    'is0n/fm-nvim',
    config = function()
      require('plugin.fm-nvim')
    end,
  },
  {
    -- autopair brackets
    'windwp/nvim-autopairs',
    config = function()
      require('plugin.nvim-autopairs')
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-cmdline',
    },
    event = 'InsertEnter',
    config = function()
      require('plugin.nvim-cmp')
    end,
  },
  {
    'SirVer/ultisnips',
    dependencies = {
      'quangnguyen30192/cmp-nvim-ultisnips',
    },
  },
  {
    -- supercollider
    'davidgranstrom/scnvim',
    config = function()
      require('plugin.scnvim')
    end,
  },
  {
    -- tidalcycles
    'tidalcycles/vim-tidal',
    config = function()
      require('plugin.vim-tidal')
    end,
  },
  {
    -- vimwiki
    'vimwiki/vimwiki',
    event = 'VimEnter',
    config = function()
      require('plugin.vimwiki')
    end,
  },
  {
    -- taskwiki
    'tools-life/taskwiki',
  },
  {
    -- my dailydiary plugin
    'juanedflores/DailyDiary',
  },
})
