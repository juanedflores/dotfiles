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
nmap('<D-f>', ':TZFocus<CR>')

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
nmap('ß', ':NvimTreeToggle<CR>')
nmap('<leader>r', ':NvimTreeRefresh<CR>')
nmap('<leader>n', ':NvimTreeFindFile<CR>')

-- ===== [ Terminal ] =====
-- use esc to leave terminal insert mode
tmap('<Esc>', [[<C-\><C-n>]])
nmap('<leader>t', ':1ToggleTerm direction=float close_on_exit=false<CR>')
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

-- ===== [ DailyDiary ] =====
nmap('<leader>d', ':call DailyDiaryToggle()<CR>')

-- ===== [ Fold Preview ] =====
nmap('<C-k>', ":lua require('ufo').peekFoldedLinesUnderCursor()<CR>")

-- ===== [ SuperCollider Snippets ] =====
imap('ƒ', [[<cmd>lua return require'snippets'.expand_or_advance(1)<CR>]])

-- ===== [ Cursorcerer ] =====
nmap(
  '<leader>cc',
  ':AsyncRun /Users/juanedflores/Library/PreferencePanes/Cursorcerer.prefPane/Contents/Resources/Cursorcerer.app/Contents/MacOS/Cursorcerer<CR>'
)

-- ===== [ Tidalcycles ] =====
-- local command =
--   'find,.,-maxdepth,1,-type,d,|,while,read,-r,dir,do,printf,"%s:\t","$dir";,find,"$dir",-type,f,|,wc,-l;,done'
-- nmap('<leader>sa', [[:Telescope find_files find_command=]] .. command .. [[<CR>]])
-- command .. [[:Telescope find_files find_command=ls,-n,/Users/juanedflores/Documents/SuperCollider/Dirt/samples/ prompt_prefix=🔍 previewer=false<CR>]]
nmap('<leader>sa', [[:Lf /Users/juanedflores/Documents/SuperCollider/Dirt/samples<CR>]])

-- ===== [ UltiSnips ] =====
nmap('<leader>ue', ':UltiSnipsEdit<CR>')

-- ===== [ Notify ] =====
nmap('∂', ':lua require("noice").cmd("dismiss")<CR>')

-- ===== [ Pasting (Put) ] =====
nmap('p', "p=']")
nmap('P', "P=']")

vmap('<C-e>', ":lua require('nvim-python-repl').send_visual_to_repl()<CR>")
