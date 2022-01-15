local set = U.set

vim.g.python3_host_prog = '/Users/juanedflores/.pyenv/versions/py3nvim/bin/python'

set('termguicolors')
set('hidden')
set('number relativenumber')
set('shiftwidth', '2')
set('mouse', 'a')
set('clipboard', 'unnamedplus')
set('splitright splitbelow')
set('autochdir')
set('noshowmode')
set('nowrap')
set('noswapfile')
set('concealcursor', 'n')
set('foldmethod', 'expr')
set('foldexpr', 'nvim_treesitter#foldexpr()')

vim.cmd([[
if has("gui_vimr")
  " Here goes some VimR specific settings like
  colorscheme zenbones
endif
]])
