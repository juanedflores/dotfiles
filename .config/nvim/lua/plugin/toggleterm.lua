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
      guibg = '#1c1e24',
      guifg = '#ffffff',
    },
    NormalFloat = {
      guibg = '#1c1e24',
      guifg = '#ffffff',
    },
    FloatBorder = {
      guifg = '#ffffff',
      guibg = '#1c1e24',
      -- guibg = '#1c1e24',
    },
  },
  float_opts = {
    border = 'rounded',
    width = 80,
    height = 40,
  },
})
