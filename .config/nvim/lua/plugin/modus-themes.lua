-- Default options
require('modus-themes').setup({
  -- Theme comes in two styles `modus_operandi` and `modus_vivendi`
  -- `auto` will automatically set style based on background set with vim.o.background
  style = 'auto',
  variant = 'default', -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
  dim_inactive = true, -- "non-current" windows are dimmed
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    VimwikiH1Folding = { italic = true },
  },

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors)
    colors.VimwikiHeader1 = colors.red_faint -- Change error color to the "faint" variant
  end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})
