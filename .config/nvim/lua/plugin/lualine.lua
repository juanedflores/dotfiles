require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {},
    -- lualine_c = { 'filename' },
    lualine_x = {
      function()
        local ok, pomo = pcall(require, 'pomo')
        if not ok then
          return ''
        end

        local timer = pomo.get_first_to_finish()
        if timer == nil then
          return ''
        end

        return '󰄉 ' .. tostring(timer)
      end,
      'encoding',
      'fileformat',
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    -- lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})

-- DIAGNOSTICS
-- error = '󰅚 ', -- x000f015a
-- warn = '󰀪 ', -- x000f002a
-- info = '󰋽 ', -- x000f02fd
-- hint = '󰌶 ', -- x000f0336
