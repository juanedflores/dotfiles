local set = U.set
-- vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
vim.g.python3_host_prog = '/Users/juanedflores/.pyenv/shims/python3'

set('termguicolors')
set('hidden')
set('number relativenumber')
set('shiftwidth', '2')
set('tabstop', '2')
set('expandtab')
set('mouse', 'a')
set('clipboard', 'unnamedplus')
set('splitright splitbelow')
set('autochdir')
set('noshowmode')
set('nowrap')
set('linebreak')
set('noswapfile')
set('concealcursor', 'n')
set('foldmethod', 'expr')
set('foldexpr', 'nvim_treesitter#foldexpr()')
set('nohlsearch')
set('smartindent')
set('conceallevel', '2')
set('list')
set('listchars=tab:@', ',trail:-,eol:$')

-- set('shcf', '-ic')
-- ultisnips
vim.cmd([[
let g:UltiSnipsEditSplit="vertical"
]])

-- vimr
vim.cmd([[
if has("gui_vimr")
  " Here goes some VimR specific settings like
  colorscheme zenbones
endif
]])

-- copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
