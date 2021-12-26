local nmap = U.keymap.nmap
local imap = U.keymap.imap
local vmap = U.keymap.vmap
local xmap = U.keymap.xmap
local omap = U.keymap.omap
local tmap = U.keymap.tmap

-- ===== [ Focus Mode ] =====
-- Toggle ZenMode (f for focus)	
nmap ('<leader>F', ':ZenMode<CR>')

-- ===== [ Last Buffer ] =====
-- go back to last buffer
nmap ('<leader>w', ':b#<CR>')
-- open last buffer on right
nmap ('<leader>W', ':vertical sb#<CR>')

-- ===== [ Lf ] =====
-- open lf file manager
nmap ('<leader>p', ':Lf<CR>')

-- ===== [ Terminal ] =====
-- use esc to leave terminal insert mode
tmap ('<Esc>', [[<C-\><C-n>]])
nmap ('<c-t>', ':2ToggleTerm<CR>')
nmap ('†', ':1ToggleTerm direction=vertical close_on_exit=false<CR>')

-- ===== [ Startify ] =====
-- go to the start screen
nmap ('<leader><leader>', ':Alpha<CR>')

-- ===== [ Telescope ] =====
-- select from currently open buffers
-- nmap ('<leader>o', '<cmd>Telescope buffers<cr>')
nmap ('<leader>ff', '<cmd>Telescope find_files<cr>')
nmap ('<leader>fg', '<cmd>Telescope live_grep<cr>')
nmap ('<leader>fb', '<cmd>Telescope buffers<cr>')
nmap ('<leader>fh', '<cmd>Telescope help_tags<cr>')

-- ===== [ vimrc ] =====
-- open and edit .vimrc file
nmap('<leader>ev', ':vsplit $MYVIMRC<CR>')
nmap('<leader>Ev', ':e $MYVIMRC<CR>')
-- source my .vimrc file
nmap('<leader>sv', ':source $MYVIMRC<CR>')

nmap('Ω', ':FocusEqualise<CR>')
