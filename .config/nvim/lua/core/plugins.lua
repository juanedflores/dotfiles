vim.cmd('packadd packer.nvim | au BufWritePost plugins.lua PackerCompile')
vim.opt.rtp = vim.opt.rtp + '~/.local/share/nvim/site/pack/packer/opt/*'

local packer = require('packer')
local plugin_path = U.os.data .. '/site/pack/packer/opt/'
local packer_compiled = U.os.data .. '/site/plugin/packer_compiled.vim'

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return packer.startup(function(use)
  packer.init({ compile_path = packer_compiled, opt_default = true })

  -- Plugin Manager
  use({ 'wbthomason/packer.nvim' })

  -- LSP
  use({ 'williamboman/nvim-lsp-installer', event = 'BufRead' })
  use({ 'neovim/nvim-lspconfig', setup = [[require('plugin.nvim-lspconfig')]] })
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    setup = [[require('plugin.null-ls')]],
  })
  -- typescript
  use('jose-elias-alvarez/nvim-lsp-ts-utils')

  -- Java LSP
  use({ 'mfussenegger/nvim-jdtls', setup = [[require("plugin.jdtls")]] })
  use({ 'mhartington/formatter.nvim', setup = [[require('plugin.formatter')]] })
  use({ 'mfussenegger/nvim-dap', setup = [[require('plugin.dap')]] })

  -- UltiSnips
  use('SirVer/ultisnips')

  -- Auto Complete
  use('rafamadriz/friendly-snippets')
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/vim-vsnip' },
      { 'hrsh7th/vim-vsnip-integ' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/cmp-calc' },
      { 'hrsh7th/cmp-cmdline' },
      { 'quangnguyen30192/cmp-nvim-ultisnips' },
      config = function()
        -- optional call to setup (see customization section)
        require('cmp_nvim_ultisnips').setup({})
      end,
    },
    config = function()
      require('plugin.nvim-cmp')
    end,
    event = 'InsertEnter',
  })
  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    commit = '668de0951a36ef17016074f1120b6aacbe6c4515',
    run = ':TSUpdate',
    setup = [[require('plugin.nvim-treesitter')]],
  })
  use({ 'nvim-treesitter/playground' })
  -- Special Highlighting
  use('fladson/vim-kitty')

  -- Startup Screen
  use({
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    setup = [[require('plugin.alpha')]],
    opt = false,
  })

  -- Status Line
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    setup = [[require('plugin.lualine')]],
  })

  -- Toggle Comments
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    setup = [[require('plugin.comment')]],
    opt = false,
  })

  -- Focus Mode
  use({ 'folke/zen-mode.nvim' })

  -- File Manager for Lf
  use({ 'is0n/fm-nvim', setup = [[require('plugin.fm-nvim')]] })
  use({
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    setup = [[require('plugin.nvim-tree')]],
    tag = 'nightly',
    commit = 'f43b8af8f40004e476cc43d178b82350b3249d1a',
    opt = false,
  })

  -- Stabilize windows
  use({
    'luukvbaal/stabilize.nvim',
    config = function()
      require('stabilize').setup()
    end,
  })

  -- Fuzzy Finder
  use({
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' } },
    setup = [[require('plugin.telescope')]],
  })

  -- SuperCollider
  use({
    'davidgranstrom/scnvim',
    opt = false,
    setup = [[require('plugin.scnvim')]],
  })
  use({ 'davidgranstrom/telescope-scdoc.nvim' })

  use('xiyaowong/telescope-emoji.nvim')

  -- Colorscheme
  use({
    'mcchrish/zenbones.nvim',
    requires = 'rktjmp/lush.nvim',
  })
  use('projekt0n/github-nvim-theme')
  use('EdenEast/nightfox.nvim')

  -- Terminal
  use({
    'akinsho/toggleterm.nvim',
    setup = [[require('plugin.toggleterm')]],
    opt = false,
  })

  use({
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end,
    opt = false,
  })

  use({
    'lukas-reineke/indent-blankline.nvim',
    setup = [[require('plugin.indent-blankline')]],
    opt = false,
  })

  -- Note Taking
  use({ 'vimwiki/vimwiki', opt = true, setup = [[require('plugin.vimwiki')]] })
  use({ 'tools-life/taskwiki', ft = { 'vimwiki' }, opt = false, event = 'VimEnter' })

  use({ 'windwp/nvim-autopairs', setup = [[require('plugin.nvim-autopairs')]] })

  use({ 'tidalcycles/vim-tidal', setup = [[require('plugin.vim-tidal')]] })

  use({ 'timtro/glslView-nvim', ft = 'glsl' })

  -- Github Copilot
  use('github/copilot.vim')
  use({ 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' })

  use('sheerun/vim-polyglot')

  -- KRL (Robots)
  use('KnoP-01/krl-for-vim')

  use('skywind3000/asyncrun.vim')

  use({ 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async', setup = [[require('plugin.ufo')]] })

  use('AndrewRadev/tagalong.vim')

  use({
    'juanedflores/DailyDiary',
  })
  -- Autoinstall/compile plugins
  if vim.fn.isdirectory(vim.fn.glob(plugin_path)) > 0 then
    packer.install()
  end
  if vim.fn.empty(vim.fn.glob(packer_compiled)) > 0 then
    packer.compile()
  end
end)
