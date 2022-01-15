U.nvim_create_augroups({
  general = {
    { 'BufWinEnter', '*', 'set fo-=o' }, -- Avoid newline continuation of comments
  },
  glslview = {
    { 'FileType', 'glsl', 'nmap <leader>r :GlslView<CR>' },
    { 'FileType', 'glsl', ':set autoindent<CR>' },
    { 'FileType', 'glsl', ':set cindent<CR>' },
  },
  supercollider = {
    { 'FileType', 'supercollider', 'nmap <leader>fd :Telescope scdoc<CR>' },
  },
})
