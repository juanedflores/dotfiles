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
  arduino = {
    {
      'BufWritePost',
      '/*Arduino/*.md',
      'AsyncRun -cwd=<root>/Arduino make',
    },
  },
  weeks = {
    {
      'BufWritePost',
      '/*weeks/*.md',
      'AsyncRun -cwd=<root>/weeks make',
    },
  },
  menu = {
    {
      'BufWritePost',
      '/*menu/*.md',
      'AsyncRun -cwd=<root>/menu make',
    },
  },
  electronics = {
    {
      'BufWritePost',
      '/Electronics/*.md',
      'AsyncRun -cwd=<root>/Electronics make',
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
  -- wiki = {
  --   { 'BufWinEnter', '/*Zettelkasten/*.md', ':ObsidianOpen' },
  -- },
  love = {
    { 'FileType', 'lua', 'nmap <leader>r :AsyncRun -cwd=<root> /Applications/love.app/Contents/MacOS/love .<CR>' },
  },
  html = {
    { 'FileType', 'html', 'set nowrap' },
  },
  pico8 = {
    { 'FileType', 'pico8', ':set nolist | nmap <leader>r :Pico8Run<CR>' },
  },
  -- markdown = {
  --   { 'FileType', 'markdown', 'set nowrap' },
  -- },
  remember_folds = {
    -- { 'BufWinLeave', '*.*', ':mkview<CR>' },
    -- { 'BufWinEnter', '*.*', ':silent! loadview<CR>' },
    -- { 'BufWinLeave', '?*', ':mkview 1' },
    -- { 'BufWinEnter', '?*', ':silent! loadview 1' },
  },
  javascript = {
    { 'FileType', 'javascript', 'set foldmethod=expr' },
  },
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '/*Zettelkasten/*.md',
  -- callback = function()
  --     if vim.cmd('expand("%:r")') ~= "DailyDiary" then
  --         return
  --     end
  --     -- do the rest of the callback
  -- end,
  -- pattern = { '*.yaml', '*.yml' },
  callback = function()
    -- if vim.fn.search([[hosts:\|tasks:]], 'nw') then
    --   vim.opt.filetype = 'yaml.ansible'
    -- end
    if
      vim.fn.expand('%:p:h')
      == '/Users/juanedflores/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten/DailyDiary'
    then
      return
    end

    vim.cmd('ObsidianOpen')
  end,
})

-- Create an autocommand for "BufRead" events
-- vim.api.nvim_create_autocmd('BufRead', {
--   -- This autocommand will only trigger if the buffer name matches the following patterns
--   pattern = { '*.yaml', '*.yml' },
--   -- The autocommand will trigger the following lua function
--   callback = function()
--     -- In lua, `[[ ... ]]` is a literal string. If i used double quotes
--     -- instead, then next line would look like this:
--     --
--     -- `if vim.fn.search("hosts:\\|tasks:", "nw") then`
--     --
--     -- Notice how i had to escape the backslash
--     if vim.fn.search([[hosts:\|tasks:]], 'nw') then
--       -- Thi uses Neovim's options api. Alternatively, you could do this:
--       --
--       -- `vim.cmd("set filetype = yaml.ansible")`
--       vim.opt.filetype = 'yaml.ansible'
--     end
--   end,
-- })
