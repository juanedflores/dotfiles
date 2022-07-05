U.nvim_create_augroups({
  general = {
    { 'BufWinEnter', '*', 'set fo-=o' }, -- Avoid newline continuation of comments
  },
  glslview = {
    { 'FileType', 'glsl', 'nmap <leader>r :GlslView<CR>' },
    { 'FileType', 'glsl', ':set autoindent<CR>' },
    { 'FileType', 'glsl', ':set cindent<CR>' },
    { 'BufWinEnter', '*.frag', 'set ft=c' },
  },
  supercollider = {
    { 'FileType', 'supercollider', 'nmap <leader>fd :Telescope scdoc<CR>' },
  },
  blog = {
    {
      'BufWritePost',
      '/*Blog/*.md',
      'AsyncRun -cwd=<root>/Blog make',
    },
  },

  remember_folds = {
    { 'BufWinLeave', '*.*', 'mkview' },
    { 'BufWinEnter', '*.*', 'silent! loadview' },
  },
})
