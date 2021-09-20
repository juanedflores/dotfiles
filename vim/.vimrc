" ===== [ Juan Flores Neovim Config File ] =====
" ===== [ ------juaneduardoflores.com----- ] =====
"
"{ [ Plugins ]
call plug#begin('~/.config/nvim/plugged')
" ===== [ Quality of Life ] =====
"" Zen Mode
Plug 'junegunn/goyo.vim'
"" toggle comments
Plug 'tpope/vim-commentary'
" auto pairs parantheses like chars
Plug 'jiangmiao/auto-pairs'
"" keybindings for surrounding words or selections with something
Plug 'tpope/vim-surround'

" ===== [ Terminal ] =====
"" floating terminal
Plug 'voldikss/vim-floaterm'
"" terminal
Plug 'kassio/neoterm'

" ===== [ File Navigation ] =====
"" shows a tree of files
Plug 'scrooloose/nerdtree'
call plug#end()

"{{ [ NERDTree settings ]
"" Function to open nerd tree in the current file directory.
function! NERDTreeToggleInCurDir()
	" If NERDTree is open in the current buffer
	if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
		exe ":NERDTreeClose"
	else
		if (expand("%:t") != '')
			exe ":NERDTreeFind"
		else
			exe ":NERDTreeToggle"
		endif
	endif
endfunction


"{ [ Basic Settings ]
"{{ [ Code Folding ]
" Function to handle folding in the init.vim file.
function! VimFolds(lnum)
	" Get content of current line and the line below.
	let l:cur_line = getline(a:lnum)
	let l:next_line = getline(a:lnum+1)
	if l:cur_line =~# '^"{'
		return '>' . (matchend(l:cur_line, '"{*') - 1)
	else
		if l:cur_line ==# '' && (matchend(l:next_line, '"{*') - 1) == 1
			return 0
		else
			return '='
		endif
	endif
endfunction

" Function to handle the text on a fold.
function! MyFoldText()
	let line = getline(v:foldstart)
	let folded_line_num = v:foldend - v:foldstart
	let line_text = substitute(line, '^"{\+', '', 'g')
	let fillcharcount = &textwidth - len(line_text) - len(folded_line_num)
	return '+' . line_text . repeat('.', fillcharcount) . ' (' . folded_line_num . ' L)'
endfunction

"{{ [ General Settings ]
set timeoutlen=1000 ttimeoutlen=0
set number relativenumber
filetype plugin on
set modelineexpr
set modelines=1
set autochdir
set nowrap
set noswapfile

"{ [ Key Mappings ]
let mapleader = "\<Space>"

" ===== [ vimrc ] =====
" open and edit .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>Ev :e $MYVIMRC<CR>
" source my .vimrc file
nnoremap <leader>sv :source $MYVIMRC<CR>

" ===== [ Focus ] =====
"" Toggle ZenMode (f for focus)
nnoremap <leader>F :Goyo<CR>

" ===== [ Terminal ] =====
"" Use esc to leave terminal insert mode
tnoremap <Esc> <C-\><C-n>
"" clear terminal with Ctrl + l
tnoremap <C-l> <C-c><C-l>
"" Toggle between terminal (Alt + T)
nnoremap † :vertical botright Ttoggle<CR>:call MoveRightMost()<CR>
"" Open a floating terminal
nnoremap <C-t> :FloatermToggle<CR>
"" new floating term
nnoremap <leader>nt :FloatermNew<CR>
"" new float term
nnoremap <leader>xt :FloatermNext<CR>

" ===== [ NERDTree ] =====
"" Toggle NERDTree (Alt + B)
nnoremap ß :call NERDTreeToggleInCurDir()<CR>

" ===== [ Last Buffer ] =====
"" go back to last buffer
nnoremap <leader>w :b#<CR>
"" open last buffer on right
nnoremap <leader>W :vertical sb#<CR>

" ===== [ Code Movement/Editing ] =====
"" z. will shift placement of cursor to top 1/4 of file view instead of middle
nnoremap z. :silent execute "normal! z." . winheight(0)/4 . "\<lt>C-E>"<CR>
"" better tabbing
vnoremap < <gv
vnoremap > >gv

"{ [ Color Scheme ]
colorscheme despacio

"" vim:foldmethod=expr foldexpr=VimFolds(v\:lnum) foldtext=MyFoldText() fillchars=fold\:\ :
