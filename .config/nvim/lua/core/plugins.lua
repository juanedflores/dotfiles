local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
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
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  -- {
  --   -- toggle comments
  --   'numToStr/Comment.nvim',
  --   config = function()
  --     require('plugin.comment')
  --   end,
  -- },
  {
    -- visualize indents
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('plugin.indent-blankline')
    end,
  },
  {
    -- fuzzy finder
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugin.telescope')
    end,
  },
  -- Focus Mode
  {
    'folke/zen-mode.nvim',
    config = function()
      require('plugin.zen-mode')
    end,
  },
  -- {
  --   'Pocco81/true-zen.nvim',
  --   config = function()
  --     require('plugin.true-zen')
  --   end,
  -- },
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
    -- config = function()
    --   require('plugin.null-ls')
    -- end,
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
  -- {
  --   'MeanderingProgrammer/markdown.nvim',
  --   main = 'render-markdown',
  --   opts = {},
  --   name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  --   config = function()
  --     require('plugin.markdown')
  --   end,
  -- },
  {
    'OXY2DEV/markview.nvim',
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('plugin.markview')
    end,
  },
  -- {
  --   'joshuadanpeterson/typewriter',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   opts = {},
  --   config = function()
  --     require('typewriter').setup({
  --       enable_with_zen_mode = true,
  --       enable_with_true_zen = true,
  --       keep_cursor_position = true,
  --       enable_notifications = true,
  --       enable_horizontal_scroll = false,
  --     })
  --   end,
  -- },
  {
    -- git diff view
    'sindrets/diffview.nvim',
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
    init = function()
      vim.treesitter.language.register('markdown', 'vimwiki')
      vim.g.vimwiki_list = {
        {
          syntax = 'markdown',
          ext = '.md',
          path = '/Users/juanedflores/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten',
          diary_rel_path = 'DailyDiary/',
          index = '_Index_of_Zettelkasten',
        },
      }
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
      }
      vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki
      vim.g.vimwiki_map_prefix = '<leader>u'
      vim.g.vimwiki_folding = 'custom'
    end,
    config = function()
      require('plugin.vimwiki')
    end,
  },
  {
    -- taskwiki
    'tools-life/taskwiki',
  },
  {
    'epwalsh/obsidian.nvim',
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',

      -- see below for full list of optional dependencies 👇
    },
    config = function()
      require('plugin.obsidian')
    end,
  },
  {
    -- async
    'skywind3000/asyncrun.vim',
  },
  {
    -- my dailydiary plugin
    'juanedflores/DailyDiary',
  },
  {
    -- rose pine colorscheme
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('plugin.rose-pine')
    end,
  },

  {
    -- gray colorscheme
    'yorickpeterse/nvim-grey',
  },
  {
    -- ayu colorscheme
    'Shatur/neovim-ayu',
  },
  {
    'miikanissi/modus-themes.nvim',
    priority = 1000,
    config = function()
      require('plugin.modus-themes')
    end,
  },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = true,
    priority = 1000,
    opts = {},
    config = function()
      require('plugin.solarized-osaka')
    end,
  },
  {
    -- github colorscheme
    'projekt0n/github-nvim-theme',
  },
  {
    'HoNamDuong/hybrid.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'ziontee113/icon-picker.nvim',
    config = function()
      require('icon-picker').setup({ disable_legacy_commands = true })

      local opts = { noremap = true, silent = true }

      vim.keymap.set('n', '<Leader>y', '<cmd>IconPickerYank<cr>', opts) --> Yank the selected icon into register
      vim.keymap.set('i', '<C-i>', '<cmd>IconPickerInsert<cr>', opts)
    end,
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('plugin.nvim-notify')
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    config = function()
      require('plugin.noice')
    end,
  },
  {
    '3rd/image.nvim',
    init = function()
      package.path = package.path .. ';' .. vim.fn.expand('$HOME') .. '/.luarocks/share/lua/5.1/?/init.lua;'
      package.path = package.path .. ';' .. vim.fn.expand('$HOME') .. '/.luarocks/share/lua/5.1/?.lua;'
    end,
    branch = 'feat/toggle-rendering',
    dependencies = {
      'leafo/magick',
      'nvim-treesitter/nvim-treesitter',
      {
        'vhyrro/luarocks.nvim',
        opts = {
          rocks = {
            hererocks = true,
          },
        },
      },
    },
    config = function()
      require('plugin.image')
    end,
  },
  {
    'nvim-neorg/neorg',
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = '*', -- Pin Neorg to the latest stable release
    config = true,
  },
  {
    'fladson/vim-kitty',
  },
  {
    'jghauser/auto-pandoc.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = 'markdown',
    keys = {
      {
        'go',
        function()
          require('auto-pandoc').run_pandoc()
        end,
        desc = 'auto-pandoc: Execute pandoc',
        ft = 'markdown', -- this is for buffer-local keymaps
      },
    },
  },
  {
    'epwalsh/pomo.nvim',
    version = '*', -- Recommended, use latest release instead of latest commit
    lazy = true,
    cmd = { 'TimerStart', 'TimerRepeat' },
    dependencies = {
      -- Optional, but highly recommended if you want to use the "Default" timer
      'rcarriga/nvim-notify',
    },
    opts = {
      -- See below for full list of options 👇
    },
    config = function()
      require('plugin.pomo')
    end,
  },
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require('everforest').setup({
        -- Your config here
        ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
        ---Default is "medium".
        background = 'soft',
        ---How much of the background should be transparent. 2 will have more UI
        ---components be transparent (e.g. status line background)
        transparent_background_level = 0,
        ---Whether italics should be used for keywords and more.
        italics = false,
        ---Disable italic fonts for comments. Comments are in italics by default, set
        ---this to `true` to make them _not_ italic!
        disable_italic_comments = false,
        ---By default, the colour of the sign column background is the same as the as normal text
        ---background, but you can use a grey background by setting this to `"grey"`.
        sign_column_background = 'none',
        ---The contrast of line numbers, indent lines, etc. Options are `"high"` or
        ---`"low"` (default).
        ui_contrast = 'low',
        ---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
        ---
        ---When this option is used in conjunction with show_eob set to `false`, the
        ---end of the buffer will only be hidden inside the active window. Inside
        ---inactive windows, the end of buffer filler characters will be visible in
        ---dimmed symbols. This is due to the way Vim and Neovim handle `EndOfBuffer`.
        dim_inactive_windows = false,
        ---Some plugins support highlighting error/warning/info/hint texts, by
        ---default these texts are only underlined, but you can use this option to
        ---also highlight the background of them.
        diagnostic_text_highlight = false,
        ---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
        diagnostic_virtual_text = 'coloured',
        ---Some plugins support highlighting error/warning/info/hint lines, but this
        ---feature is disabled by default in this colour scheme.
        diagnostic_line_highlight = false,
        ---By default, this color scheme won't colour the foreground of |spell|, instead
        ---colored under curls will be used. If you also want to colour the foreground,
        ---set this option to `true`.
        spell_foreground = false,
        ---Whether to show the EndOfBuffer highlight.
        show_eob = true,
        ---Style used to make floating windows stand out from other windows. `"bright"`
        ---makes the background of these windows lighter than |hl-Normal|, whereas
        ---`"dim"` makes it darker.
        ---
        ---Floating windows include for instance diagnostic pop-ups, scrollable
        ---documentation windows from completion engines, overlay windows from
        ---installers, etc.
        ---
        ---NB: This is only significant for dark backgrounds as the light palettes
        ---have the same colour for both values in the switch.
        float_style = 'bright',
        ---Inlay hints are special markers that are displayed inline with the code to
        ---provide you with additional information. You can use this option to customize
        ---the background color of inlay hints.
        ---
        ---Options are `"none"` or `"dimmed"`.
        inlay_hints_background = 'none',
        ---You can override specific highlights to use other groups or a hex colour.
        ---This function will be called with the highlights and colour palette tables.
        ---@param highlight_groups Highlights
        ---@param palette Palette
        on_highlights = function(highlight_groups, palette) end,
        ---You can override colours in the palette to use different hex colours.
        ---This function will be called once the base and background colours have
        ---been mixed on the palette.
        ---@param palette Palette
        colours_override = function(palette) end,
      })
    end,
  },
  {
    'kawre/leetcode.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      -- "ibhagwan/fzf-lua",
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    opts = {
      -- configuration goes here
    },
    config = function()
      require('plugin.leetcode')
    end,
  },
  {
    'LintaoAmons/scratch.nvim',
    event = 'VeryLazy',
  },
  {
    'geg2102/nvim-python-repl',
    dependencies = 'nvim-treesitter',
    ft = { 'python', 'lua', 'scala' },
    config = function()
      require('nvim-python-repl').setup({
        execute_on_send = true,
        vsplit = true,
      })
    end,
  },
  {
    'sophacles/vim-processing',
  },
  {
    'andrewferrier/wrapping.nvim',
  },
  {
    'normen/vim-pio',
  },
  -- {
  --   'glebzlat/arduino-nvim',
  --   config = {
  --     function()
  --       require('arduino-nvim').setup({
  --         default_fqbn = 'arduino:avr:uno',
  --         clangd = '/usr/bin/clangd', -- path to a clangd executable
  --         arduino = '/opt/homebrew/bin/arduino-cli', -- path to a arduino-cli executable
  --         filetype = 'arduino',
  --       })
  --     end,
  --   },
  -- },
  {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup({
        -- whether to map keybinds or not. default true
        default_mappings = true,
        -- which builtin marks to show. default {}
        builtin_marks = { '.', '<', '>', '^' },
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = false,
        -- how often (in ms) to redraw signs/recompute mark positions.
        -- higher values will have better performance but may cause visual lag,
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 250,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        -- disables mark tracking for specific filetypes. default {}
        excluded_filetypes = {},
        -- disables mark tracking for specific buftypes. default {}
        excluded_buftypes = {},
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_0 = {
          sign = '⚑',
          virt_text = 'hello world',
          -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
          -- defaults to false.
          annotate = false,
        },
        mappings = {},
      })
    end,
  },
})
