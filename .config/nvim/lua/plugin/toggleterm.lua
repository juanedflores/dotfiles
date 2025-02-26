local toggleterm = require('toggleterm')

toggleterm.setup({
  size = function(term)
    if term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  start_in_insert = false,
  direction = 'float',
  persist_size = false,
  shade_terminals = false,
  shading_factor = '1',
  highlights = {
    Normal = {
      guifg = '#ffffff',
      guibg = '#1c1e24',
    },
    NormalFloat = {
      guifg = '#ffffff',
      guibg = '#1c1e24',
    },
    FloatBorder = {
      guifg = '#ffffff',
      guibg = '#1c1e24',
    },
  },
  float_opts = {
    border = 'rounded',
    width = 80,
    height = 40,
    -- row = 0,
    -- col = 0,
    winblend = 20,
    -- zindex = <value>,
    title_pos = 'center',
  },
  winbar = {
    enabled = true,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end,
  },
})
