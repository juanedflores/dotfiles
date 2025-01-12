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
    { 'BufWinEnter', '*.scd', 'set ft=supercollider' },
    { 'FileType', 'supercollider', 'nmap <leader>fd :Telescope scdoc<CR>' },
  },
  processing = {
    { 'BufWinEnter', '*.pde', 'nmap <leader>r :make<CR>' },
  },
  blog = {
    {
      'BufWritePost',
      '/*Blog/*.md',
      'AsyncRun -cwd=<root>/Blog make',
    },
  },
  teaching_electronics = {
    {
      'BufWritePost',
      '/*electronic_component_database/*.md',
      'AsyncRun -cwd=<root> make',
    },
  },
  teaching_mechanisms = {
    {
      'BufWritePost',
      '/*mechanisms/*.md',
      'AsyncRun -cwd=<root> make',
    },
  },
  teaching_arduino = {
    {
      'BufWritePost',
      '/*arduino_sketches/*.md',
      'AsyncRun -cwd=<root> make',
    },
  },
  obsidian = {
    {
      'BufWritePost',
      '/*Zettelkasten/*/*.md',
      'AsyncRun -cwd=<root> make',
    },
  },
  tidal = {
    { 'BufWinEnter', '*.tidal', 'set nosmartindent' },
    { 'BufWinEnter', '*.tidal', "lua vim.bo.commentstring = '--%s'" },
  },
  markdown = {
    { 'BufWinEnter', '*.md', 'set wrap' },
  },
  love = {
    { 'FileType', 'lua', 'nmap <leader>r :AsyncRun -cwd=<root> /Applications/love.app/Contents/MacOS/love .<CR>' },
  },
  remember_folds = {
    -- { 'BufWinLeave', '*.*', ':mkview<CR>' },
    -- { 'BufWinEnter', '*.*', ':silent! loadview<CR>' },
    { 'BufWinLeave', '?*', 'mkview 1' },
    { 'BufWinEnter', '?*', 'silent! loadview 1' },
  },
  javascript = {
    { 'FileType', 'javascript', 'set foldmethod=expr' },
  },
})
