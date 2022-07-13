local scnvim = require('scnvim')
scnvim.setup()

local map = scnvim.map
scnvim.setup({
  keymaps = {
    ['<M-e>'] = map('editor.send_line', { 'i', 'n' }),
    ['<C-e>'] = {
      map('editor.send_block', { 'i', 'n' }),
      map('editor.send_selection', 'x'),
    },
    ['<CR>'] = map('postwin.toggle'),
    ['<M-CR>'] = map('postwin.toggle', 'i'),
    ['∂'] = map('postwin.clear', { 'n', 'i' }),
    ['<C-k>'] = map('signature.show', { 'n', 'i' }),
    ['<F12>'] = map('sclang.hard_stop', { 'n', 'x', 'i' }),
    ['<leader>st'] = map(scnvim.start),
    ['<leader>sk'] = map(scnvim.recompile),
    -- ['<F1>'] = map_expr('s.boot'),
    -- ['<F2>'] = map_expr('s.meter'),
  },
})
