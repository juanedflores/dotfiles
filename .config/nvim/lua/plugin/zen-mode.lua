require('zen-mode').setup({
  window = {
    -- backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    backdrop = 1.0,
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 120, -- width of the Zen window
    height = 50, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = 'no', -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      foldcolumn = '0', -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = true,
      font = '-4', -- font size increment
    },
  },

  -- on_open = function(win)
  --   if vim.bo.filetype == 'tidal' then
  --     vim.cmd([[ colorscheme livecoding]])
  --   else
  --     -- vim.cmd([[colorscheme ]] .. vim.g.default_colorscheme)
  --   end
  -- end,
  -- -- callback where you can add custom code when the Zen window closes
  -- on_close = function()
  --   if vim.bo.filetype == 'tidal' then
  --     vim.cmd([[ colorscheme livecoding | set nosmartindent]])
  --     -- vim.cmd([[ set nosmartindent ]])
  --   else
  --     -- vim.cmd([[colorscheme ]] .. vim.g.default_colorscheme)
  --   end
  -- end,
  on_open = function()
    -- vim.cmd('TWEnable')
    -- vim.cmd('colorscheme ' .. vim.g.default_colorscheme)
  end,
  on_close = function()
    -- vim.cmd('TWDisable')
  end,
})
