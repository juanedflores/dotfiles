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
    -- alpha: startup screen
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugin.alpha')
    end,
  },
  {
    -- treesitter: parser generator tool
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('plugin.nvim-treesitter')
    end,
  },
  {
    -- nvim-treesitter-textsubjects: better visual selection
    'RRethy/nvim-treesitter-textsubjects',
  },
  {
    -- lualine: status line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugin.lualine')
    end,
  },
  -- {
  --   -- dropbar: top bar breadcrumbs
  --   'Bekaboo/dropbar.nvim',
  --   dependencies = {
  --     'nvim-telescope/telescope-fzf-native.nvim',
  --     build = 'make',
  --   },
  --   config = function()
  --     require('plugin.dropbar')
  --   end,
  -- },
  {
    -- toggleterm: terminal
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('plugin.toggleterm')
    end,
  },
  {
    -- nvim-focus: makes windows splits bigger when focused
    'nvim-focus/focus.nvim',
    version = false,
    config = function()
      require('plugin.focus')
    end,
  },
  {
    -- vim-matchup : highlights tags
    'andymass/vim-matchup',
    config = function()
      require('plugin.vim-matchup')
    end,
  },
  {
    -- nvim-ts-autotag : replace html tags
    'windwp/nvim-ts-autotag',
    config = function()
      require('plugin.nvim-ts-autotag')
    end,
  },
  {
    -- leep.nvim : 2 char move cursor
    'ggandor/leap.nvim',
  },
  {
    -- nvim-highlight-colors: highlights colors in realtime
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup({})
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('plugin.ufo')
    end,
  },
  {
    -- mini.move : move lines or visual selections easily
    'echasnovski/mini.move',
    version = '*',
    config = function()
      require('plugin.mini_move')
    end,
  },
  {
    -- mini.jump : improves f, F, t, and T
    'echasnovski/mini.jump',
    version = '*',
    -- config = function()
    --   require('mini.jump').setup()
    -- end,
  },
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    dependencies = { 'folke/snacks.nvim', lazy = true },
    config = function()
      require('plugin.yazi')
    end,
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        '<leader>p',
        mode = { 'n', 'v' },
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      {
        -- Open in the current working directory
        '<leader>cw',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
      {
        '<c-up>',
        '<cmd>Yazi toggle<cr>',
        desc = 'Resume the last yazi session',
      },
    },
  },
  {
    -- trouble: adds sidebar for LSP diagnostics, symbols
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    -- nvim-surround: surround keybindings
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({})
    end,
  },
  {
    -- indent-blankline: visualize indents
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('plugin.indent-blankline')
    end,
  },
  {
    -- telescope: fuzzy finder
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugin.telescope')
    end,
  },
  {
    -- telescope-symbols: telescope command for symbols
    'nvim-telescope/telescope-symbols.nvim',
  },
  {
    -- zen-mode: focus mode
    'folke/zen-mode.nvim',
    config = function()
      require('plugin.zen-mode')
    end,
  },
  {
    -- nvim-tree: file explorer
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugin.nvim-tree')
    end,
  },
  {
    -- mason: package manager for installing lsp servers, dap, linters, formatters
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
  },
  {
    -- mason-lspconfig: bridges lspconfig and mason
    'williamboman/mason-lspconfig.nvim',
  },
  {
    -- nvim-lspconfig: lsp
    'neovim/nvim-lspconfig',
    config = function()
      require('plugin.nvim-lspconfig')
    end,
  },
  {
    -- nvim-dap: debug adapter protocol
    'mfussenegger/nvim-dap',
    config = function()
      require('plugin.dap')
    end,
  },
  -- {
  --   -- null-ls: linter
  --   'jose-elias-alvarez/null-ls.nvim',
  --   config = function()
  --     require('plugin.null-ls')
  --   end,
  -- },
  {
    'stevearc/conform.nvim',
    config = function()
      require('plugin.conform')
    end,
    opts = {},
  },
  {
    -- markview: render markdown files
    'OXY2DEV/markview.nvim',
    lazy = false,
    config = function()
      require('plugin.markview')
    end,
  },
  -- {
  --   -- fm-nvim: to use lf file manager
  --   'is0n/fm-nvim',
  --   config = function()
  --     require('plugin.fm-nvim')
  --   end,
  -- },
  -- {
  --   -- typewriter: center text in the screen
  --   'joshuadanpeterson/typewriter',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   opts = {},
  --   config = function()
  --     require('typewriter').setup({
  --       enable_with_zen_mode = false,
  --       enable_with_true_zen = false,
  --       keep_cursor_position = false,
  --       enable_notifications = false,
  --       enable_horizontal_scroll = false,
  --     })
  --   end,
  -- },
  {
    -- diffview: git diff view
    'sindrets/diffview.nvim',
  },
  {
    -- nvim-autopairs: autopair
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  {
    'github/copilot.vim',
  },
  {
    -- blink-cmp: completion plugin
    'saghen/blink.cmp',
    version = '0.11.0',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    signature = { enable = true },
    opts = {
      -- snippets = { preset = 'luasnip' },
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          snippets = {
            opts = {
              search_paths = { '/Users/juanedflores/.config/nvim/snippets' },
            },
          },
          -- copilot = {
          --   name = 'copilot',
          --   module = 'blink-cmp-copilot',
          --   score_offset = 100,
          --   async = true,
          -- },
        },
      },
    },
    opts_extend = { 'sources.default' },
  },
  {
    -- nvim-scissors: add and edit json snippets
    'chrisgrieser/nvim-scissors',
    dependencies = 'nvim-telescope/telescope.nvim',
  },
  {
    -- vimwiki: wiki in vim
    'vimwiki/vimwiki',
    init = function()
      vim.g.vimwiki_map_prefix = '<Leader>u'
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
        ['.wiki'] = 'markdown',
      }
      vim.g.vimwiki_global_ext = 0
      -- vim.g.vimwikidiaryPath = '~/DailyDiary/'
      vim.g.vimwiki_list = {
        {
          syntax = 'markdown',
          ext = '.md',
          path = '/Users/juanedflores/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten',
          diary_rel_path = 'DailyDiary/',
          index = '_Index_of_Zettelkasten',
        },
      }
    end,
    config = function()
      require('plugin.vimwiki')
    end,
  },
  {
    -- taskwiki: manage taskwarrior tasks in vimwiki
    'tools-life/taskwiki',
  },
  {
    -- dailydiary: my dailydiary plugin for taskwarrior
    'juanedflores/DailyDiary',
  },
  {
    -- obsidian: Obsidian commands in neovim
    'epwalsh/obsidian.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('plugin.obsidian')
    end,
  },
  {
    -- async: run commands asynchronously
    'skywind3000/asyncrun.vim',
  },
  {
    -- nvim-notify: notifications
    'rcarriga/nvim-notify',
    config = function()
      require('plugin.nvim-notify')
    end,
  },
  {
    -- noice: replaces the command line
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('plugin.noice')
    end,
  },
  {
    -- pomo: timer
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
    -- leetcode:
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
    -- helpview: render help files nicer
    'OXY2DEV/helpview.nvim',
    lazy = false,
  },
  {
    -- scratch: make quick scratch files
    'LintaoAmons/scratch.nvim',
    event = 'VeryLazy',
  },
  {
    -- nvim-python-repl: repl for python
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
  -- {
  --   -- marks: display marks
  --   'chentoast/marks.nvim',
  --   config = function()
  --     require('plugin.marks')
  --   end,
  -- },
  {
    -- vim-processing: work with processing
    'sophacles/vim-processing',
  },
  {
    -- vim-pio: easy to work with arduino without IDE
    'normen/vim-pio',
  },
  {
    -- lazygit: git integration
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    -- typr: practice typing
    'nvzone/typr',
    dependencies = 'nvzone/volt',
    opts = {},
    cmd = { 'Typr', 'TyprStats' },
  },
  {
    -- scnvim : supercollider
    'davidgranstrom/scnvim',
    config = function()
      require('plugin.scnvim')
    end,
  },
  {
    'madskjeldgaard/nvim-supercollider-piano',
  },
  {
    -- vim-tidal : tidalcycles:
    'tidalcycles/vim-tidal',
    config = function()
      require('plugin.vim-tidal')
    end,
  },
  {
    -- smear-cursor:
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
  {
    -- lush: for making custom colorschemes
    'rktjmp/lush.nvim',
  },
  {
    -- player-one.nvim : sounds with keypresses and events
    'jackplus-xyz/player-one.nvim',
    -- opts = {
    --   is_enabled = false,
    --   -- theme = 'chiptune',
    --   theme = 'crystal',
    --   -- theme = 'synth',
    -- },
    config = function()
      require('plugin.player-one')
    end,
  },
  {
    -- snacks.nvim : smooth scrolling, ts scope
    'folke/snacks.nvim',
    ---@type snacks.Config
    opts = {
      scope = {
        -- absolute minimum size of the scope.
        -- can be less if the scope is a top-level single line scope
        min_size = 2,
        -- try to expand the scope to this size
        max_size = nil,
        cursor = true, -- when true, the column of the cursor is used to determine the scope
        edge = true, -- include the edge of the scope (typically the line above and below with smaller indent)
        siblings = false, -- expand single line scopes with single line siblings
        -- what buffers to attach to
        filter = function(buf)
          return vim.bo[buf].buftype == ''
        end,
        -- debounce scope detection in ms
        debounce = 30,
        treesitter = {
          -- detect scope based on treesitter.
          -- falls back to indent based detection if not available
          enabled = true,
          injections = true, -- include language injections when detecting scope (useful for languages like `vue`)
          ---@type string[]|{enabled?:boolean}
          blocks = {
            enabled = false, -- enable to use the following blocks
            'function_declaration',
            'function_definition',
            'method_declaration',
            'method_definition',
            'class_declaration',
            'class_definition',
            'do_statement',
            'while_statement',
            'repeat_statement',
            'if_statement',
            'for_statement',
          },
          -- these treesitter fields will be considered as blocks
          field_blocks = {
            'local_declaration',
          },
        },
        -- These keymaps will only be set if the `scope` plugin is enabled.
        -- Alternatively, you can set them manually in your config,
        -- using the `Snacks.scope.textobject` and `Snacks.scope.jump` functions.
        keys = {
          ---@type table<string, snacks.scope.TextObject|{desc?:string}>
          textobject = {
            ii = {
              min_size = 2, -- minimum size of the scope
              edge = false, -- inner scope
              cursor = false,
              treesitter = { blocks = { enabled = false } },
              desc = 'inner scope',
            },
            ai = {
              cursor = false,
              min_size = 2, -- minimum size of the scope
              treesitter = { blocks = { enabled = false } },
              desc = 'full scope',
            },
          },
          ---@type table<string, snacks.scope.Jump|{desc?:string}>
          jump = {
            ['[i'] = {
              min_size = 1, -- allow single line scopes
              bottom = false,
              cursor = false,
              edge = true,
              treesitter = { blocks = { enabled = false } },
              desc = 'jump to top edge of scope',
            },
            [']i'] = {
              min_size = 1, -- allow single line scopes
              bottom = true,
              cursor = false,
              edge = true,
              treesitter = { blocks = { enabled = false } },
              desc = 'jump to bottom edge of scope',
            },
          },
        },
      },
      scroll = {
        animate = {
          duration = { step = 20, total = 100 },
          easing = 'linear',
        },
        -- faster animation when repeating scroll after delay
        animate_repeat = {
          delay = 100, -- delay in ms before using the repeat animation
          duration = { step = 5, total = 25 },
          easing = 'linear',
        },
        -- what buffers to animate
        filter = function(buf)
          return vim.g.snacks_scroll ~= false
            and vim.b[buf].snacks_scroll ~= false
            and vim.bo[buf].buftype ~= 'terminal'
        end,
      },
    },
  },
  {
    -- colorscheme horizon :
    'akinsho/horizon.nvim',
  },
  {
    -- colorscheme gruvbox material :
    'sainnhe/gruvbox-material',
  },
  {
    -- colorscheme hybrid :
    'HoNamDuong/hybrid.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    -- colorscheme melange :
    'savq/melange-nvim',
  },
  {
    -- colorscheme hybrid :
    'craftzdog/solarized-osaka.nvim',
    lazy = true,
    priority = 1000,
    opts = {},
    config = function()
      require('plugin.solarized-osaka')
    end,
  },
  {
    -- miasma colorscheme:
    'xero/miasma.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme miasma')
    end,
  },
  {
    -- colorscheme kanagawa-paper :
    'sho-87/kanagawa-paper.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    -- colorscheme lackluster :
    'slugbyte/lackluster.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    -- colorscheme ayu :
    'Shatur/neovim-ayu',
  },
  {
    -- colorscheme modus :
    'miikanissi/modus-themes.nvim',
    priority = 1000,
    config = function()
      require('plugin.modus-themes')
    end,
  },
  {
    -- colorscheme rose pine :
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('plugin.rose-pine')
    end,
  },
  {
    'eandrju/cellular-automaton.nvim',
    config = function()
      require('plugin.cellular-automaton')
    end,
  },
  {
    'oflisback/obsidian-bridge.nvim',
    config = function()
      require('plugin.obsidian-bridge')
    end,
    opts = {
      -- your config here
    },
    event = {
      'BufReadPre *.md',
      'BufNewFile *.md',
    },
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'ribelo/taskwarrior.nvim',
    config = function()
      require('plugin.taskwarrior')
    end,
  },
  {
    'Bakudankun/PICO-8.vim',
    init = function()
      vim.g.pico8_config = {
        pico8_path = '/Applications/PICO-8.app/Contents/MacOS/pico8',
      }
    end,
  },
  {
    'BordenJardine/pico8-vim-colorscheme',
  },
  {
    'Mofiqul/vscode.nvim',
  },
})
