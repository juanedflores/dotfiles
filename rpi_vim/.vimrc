syntax on
set number

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'dhruvasagar/vim-railscasts-theme'
call plug#end()

"{{ [ startify settings ]
function JSONparse(str)
	let [null, false, true] = ['', 0, 1]
	let l:stripped = substitute(a:str,'\C"\(\\.\|[^"\\]\)*"','','g')
	if l:stripped !~# "[^,:{}\\[\\]0-9.\\-+Eaeflnr-u \n\r\t]"
		try
			return eval(substitute(a:str, "[\r\n]", "", 'g'))
		catch
		endtry
	endif
endfunction

let wordofday = JSONparse(system('cat ~/GermanLearning/wordofday.json'))

let g:startify_custom_header_quotes = [
			\ ['Word of the Day', '', wordofday.german, wordofday.english, wordofday.spanish]
			\]
let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

set autochdir
set showtabline=0
set splitright splitbelow
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set hidden
syntax on

colorscheme despacio 
set t_Co=256
