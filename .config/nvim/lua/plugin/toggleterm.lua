local toggleterm = require('toggleterm')

toggleterm.setup{
  size=function(term)
    if term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  start_in_insert = false,
  direction = 'float',
  persist_size = false,
  shading_factor = '0',
  float_opts = {
    border = 'rounded',
    width = 80,
    height = 40,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
