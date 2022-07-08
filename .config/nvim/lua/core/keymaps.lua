local nmap = U.keymap.nmap
local imap = U.keymap.imap
local vmap = U.keymap.vmap
local xmap = U.keymap.xmap
local omap = U.keymap.omap
local tmap = U.keymap.tmap

nmap('z.', [[:silent execute "normal! z." . winheight(0)/4 . "\<lt>C-E>"<CR>]])

-- ===== [ Focus Mode ] =====
-- Toggle ZenMode (f for focus)
nmap('<leader>F', ':ZenMode<CR>')

-- ===== [ Last Buffer ] =====
-- go back to last buffer
nmap('<leader>w', ':b#<CR>')
-- open last buffer on right
nmap('<leader>W', ':vertical sb#<CR>')

-- ===== [ Lf ] =====
-- open lf file manager
nmap('<leader>p', ':Lf<CR>')

-- ===== [ nvim-tree ] =====
-- file navigation
nmap('ß', ':lua require"nvim-tree".toggle(false, true)<CR>')
nmap('<leader>r', ':NvimTreeRefresh<CR>')
nmap('<leader>n', ':NvimTreeFindFile<CR>')

-- ===== [ Terminal ] =====
-- use esc to leave terminal insert mode
tmap('<Esc>', [[<C-\><C-n>]])
nmap('<c-t>', ':ToggleTerm direction=float close_on_exit=false<CR>')
nmap('†', ':2ToggleTerm direction=vertical close_on_exit=false<CR>')

-- ===== [ Startify ] =====
-- go to the start screen
nmap('<leader><leader>', ':Alpha<CR>')

-- ===== [ Telescope ] =====
-- select from currently open buffers
-- nmap ('<leader>o', '<cmd>Telescope buffers<cr>')
nmap('<leader>ff', '<cmd>Telescope find_files<cr>')
nmap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nmap('<leader>fb', '<cmd>Telescope buffers<cr>')
nmap('<leader>fh', '<cmd>Telescope help_tags<cr>')
nmap('<leader>fc', '<cmd>Telescope commands<cr>')

-- ===== [ vimrc ] =====
-- open and edit .vimrc file
nmap('<leader>ev', ':vsplit $MYVIMRC<CR>')
nmap('<leader>Ev', ':e $MYVIMRC<CR>')
-- source my .vimrc file
nmap('<leader>sv', ':source $MYVIMRC<CR>')

-- ===== [ Vimwiki ] =====
-- open and edit .vimrc file
nmap('<leader>uu1', ':VimwikiIndex 1<CR>')
nmap('<leader>uu2', ':VimwikiIndex 2<CR>')
nmap('<leader>uu3', ':VimwikiIndex 3<CR>')

nmap('<leader>d', ':call DailyDiaryToggle()<CR>')

-- ===== [ SuperCollider Snippets ] =====
imap('ƒ', [[<cmd>lua return require'snippets'.expand_or_advance(1)<CR>]])
-- ===== [ SuperCollider ] =====
vim.cmd([[nmap ∂ <Plug>(scnvim-postwindow-clear)]])

-- ===== [ UltiSnips ] =====
nmap('<leader>ue', ':UltiSnipsEdit<CR>')
