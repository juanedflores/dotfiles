local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
  'VeryBlue',
}

local highlight2 = {
  'VeryBlue',
}

local hooks = require('ibl.hooks')
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#bd8f92' })
  vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#c5b69b' })
  vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#8cabc4' })
  vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#b19b86' })
  vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#9cad8f' })
  vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#b596bf' })
  vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#769da2' })
  vim.api.nvim_set_hl(0, 'VeryBlue', { fg = 'blue' })
  -- vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
  -- vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
  -- vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
  -- vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
  -- vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
  -- vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
end)

require('ibl').setup({
  indent = { highlight = highlight },
  -- whitespace = {
  --   highlight = highlight,
  --   remove_blankline_trail = false,
  -- },
  scope = { highlight = highlight2 },
})
