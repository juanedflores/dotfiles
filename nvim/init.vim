" Juan Flores vimrc file
" juaneduardoflores.com

"{ [Custom Functions]
function! VimFolds(lnum)
  " get content of current line and the line below
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

function! JavaFolds(lnum)
  let l:cur_line = getline(a:lnum)
  let l:next_line = getline(a:lnum+1)

  if l:cur_line =~# '^\s*\/\*\*'
    return '>1'
  else 
    if l:cur_line =~# '^\s*.+'
      return '='
    else 
      return '<1'
  endif
endfunction

function! MyFoldText()
  let line = getline(v:foldstart)
  let folded_line_num = v:foldend - v:foldstart
  let line_text = substitute(line, '^"{\+', '', 'g')
  let fillcharcount = &textwidth - len(line_text) - len(folded_line_num)
  return '+' . line_text . repeat('.', fillcharcount) . ' (' . folded_line_num . ' L)'
endfunction

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

"{ [Plugins]
call plug#begin('~/.config/nvim/plugged')
" starting screen
Plug 'mhinz/vim-startify'
" syntax highlighting for multiple languages
Plug 'sheerun/vim-polyglot'
" java maven projects
Plug 'mikelue/vim-maven-plugin'
" eclipse with vim
Plug 'starcraftman/vim-eclim'
" plugin for tests
Plug 'janko/vim-test'
" adds the line in the bottom with info
Plug 'itchyny/lightline.vim'
" zoom in a split window
Plug 'troydm/zoomwintab.vim'
" shows a tree of files
Plug 'scrooloose/nerdtree'
" syntax for nerdtree on most common file extensions
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" icons for nerdtree
Plug 'ryanoasis/vim-devicons'
" closes any parantheses or quotes.
Plug 'jiangmiao/auto-pairs'
" toggle comments
Plug 'tpope/vim-commentary'
" a terminal
Plug 'kassio/neoterm'
" file manager in terminal
Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'
" fuzzy file finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'
" zen mode
Plug 'junegunn/goyo.vim'
" make code far away gray
Plug 'junegunn/limelight.vim'
"a color theme
Plug 'ayu-theme/ayu-vim'
" code completion
Plug 'ycm-core/YouCompleteMe'
" custom snippets
Plug 'SirVer/ultisnips'
" collection of snippets
Plug 'honza/vim-snippets'
" tidalcycles
Plug 'tidalcycles/vim-tidal'
" java script linting
Plug 'dense-analysis/ale'
" a json parser
Plug 'mklabs/vim-json'
" highlight variables
Plug 'jaxbot/semantic-highlight.vim'
" taskwarrior for todo list
Plug 'blindFS/vim-taskwarrior'
" manage notes and documentation
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'majutsushi/tagbar'
" highlight tags
Plug 'vim-scripts/TagHighlight'
" formatting for file types
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
    \ 'for': ['html','css'] }
call plug#end()

"{{ limelight settings
" Default: 0.5
let g:limelight_default_coefficient = 0.5
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 3

"{{ vim-operator-highlight settings
let g:ophigh_color_gui = "#F6FF00"

"{{ lightline settings
" noshowmode because -- INSERT -- is unecessary with lightline plugin
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

"{{ commentary settings
map <leader>- gcc

"{{ rainbow settings

let g:rainbow_active = 0

let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'java': {
\ 			'guifgs': ['#e6d965', '#c88be0', '#74c3e8', '#DDC58E', 'darkorchid3']
\		}
\	}
\ }

"{{ neoterm settings
let g:neoterm_size='40%'
let g:neoterm_autoinsert='0'

"{{ NERDTree settings
let s:red = "AE403F"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['java'] = s:red " sets the color of css files to blue

"{{ ale settings
let g:ale_set_signs = '1'
let g:ale_sign_error = '❌'
"let g:ale_sign_warning = '⚠️'
let g:ale_sign_warning = '.'
let g:ale_fix_on_save = '1'
highlight ALEErrorSign guifg=#fb4934 guibg=none
highlight ALEWarningSign guifg=#fe8019 guibg=none
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'html': ['prettier'],
 \ 'css': ['prettier'],
 \ 'java': ['prettier'],
 \ 'json': ['prettier']
 \ }

"{{ tidalcycles settings
let g:tidal_target = "terminal"
let g:TIDAL_BOOT_PATH= '~/.config/nvim/plugged/vim-tidal/myStuff.ghci'
let g:tidal_flash_duration = '450'
let g:haskell_tidal = '1'

"{{ ultisnips settings
let g:UltiSnipsExpandTrigger="ƒ"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

"{{ fzf settings
" hide the status bar in fzf
autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"{{ fzf preview settings
let g:fzf_preview_command = 'ccat --color=always {-1}'
let g:fzf_preview_layout = 'bot split new'

"{{ lf settings
let g:lf_map_keys = 0

"{{ startify settings

let s:todolist = JSON#parse(system('cat ~/todo.json'))

function s:todo()
  let count = 0
  let todocontent = []
  while len(todocontent) != s:todolist.count
      let todocontent += [{'line': s:todolist.tasks[count-1].title, 'path': s:todolist.tasks[count-1].filepath}]
      let count += 1
  endwhile
  return todocontent
endfunction

function s:projects()
  return [
	\ { 'line': 'German Vocab', 'path': '~/Documents/Website_Building/GermanWords/sketch.js' },
	\ { 'line': 'Phages Website', 'path': '~/Documents/Website_Building/Phages/PhagesWebsite/sketch.js' },
	\ { 'line': 'Current Task Window', 'path': '~/Documents/currentTask/index.js' },
	\ { 'line': 'MoodEmoji Display', 'path': '~/Documents/moodemojis/index.js' }
	\ ]
endfunction

"\ { 'header': ['   TODO'], 'type': function('s:todo') }
let g:startify_lists = [
      \ { 'header': ['   MRU'], 'type': 'files' },
      \ { 'header': ['   Projects'], 'type': function('s:projects') },
      \ { 'header': ['   Configuration'], 'type': 'bookmarks' },
      \ ]

let g:startify_files_number = 15

let g:startify_bookmarks = ['library/Application\ support/min/userscripts/global.js','~/.zshrc', '~/.skhdrc', '~/.yabairc', '~/.taskrc']
let g:startify_custom_footer = ''

let wordofday = JSON#parse(system('cat ~/GermanLearning/wordofday.json'))

let g:startify_custom_header_quotes = [
      \ ['Word of the Day:', '', wordofday.german, wordofday.english, wordofday.spanish]
      \ ] 

let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

"{{ taskwarrior settings
let g:task_report_name = 'unblocked'
augroup taskwarrsyntax
  autocmd!
  autocmd FileType taskreport hi taskwarrior_due guifg=#ffb60a
augroup END

"{{ vimwiki settings
"let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown'}]
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'java': 'java', 'javascript': 'js',
      \'lua': 'lua'}
let g:vimwiki_list = [wiki]

" make foldmethod = syntax if enter a wiki file
augroup foldwiki
  autocmd!
  autocmd BufEnter *.wiki setlocal foldmethod=syntax 
  autocmd BufEnter *.wiki hi VimwikiHeader2 guifg=#ff85f5
  autocmd BufEnter *.wiki hi VimwikiHeader3 guifg=#ffff6e
  autocmd BufEnter *.wiki hi VimwikiHeader4 guifg=#ff6e6e
  autocmd BufEnter *.wiki hi VimwikiHeader5 guifg=#6ec0ff
  autocmd BufEnter *.wiki setlocal wrap linebreak
  augroup AutoSaveFoldswiki
   autocmd!
    " view files are about 500 bytes
    " bufleave but not bufwinleave captures closing 2nd tab
    " nested is needed by bufwrite* (if triggered via other autocmd)
    autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
    autocmd BufWinEnter ?* silent! loadview
  augroup end
augroup END

"{{ tagbar settings
let g:tagbar_autofocus = 1

"{{ Goyo settings
augroup mycolors
  autocmd!
  " autocmd ColorScheme * 
augroup END

"{ [Builtin Options and Settings]
"{{ code folding
  " set fold settings
  set foldmethod=expr
  set foldexpr=VimFolds(v:lnum)
  set foldtext=MyFoldText()
  set fillchars=fold:\ 
  " remembers folds
  augroup AutoSaveFolds
   autocmd!
    " view files are about 500 bytes
    " bufleave but not bufwinleave captures closing 2nd tab
    " nested is needed by bufwrite* (if triggered via other autocmd)
    autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
    autocmd BufWinEnter ?* silent! loadview
  augroup end

"{{ paths
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.8/bin/python3'

"{{ tabstop and shiftwidth for Java
autocmd FileType java setlocal tabstop=2
set shiftwidth=2

"{{ handle buffers
set hidden

"{{ basic settings
syntax enable
" keep code from wrapping
set nowrap
" no highlighting search matches
set nohlsearch
" enables the mouse to resize windows and scroll buffers
set mouse=a
" sets numbers on
set number relativenumber
" set encoding to UTF-8
set encoding=UTF-8
" true colors support
if (has("termguicolors"))
 set termguicolors
endif
" formatoptions
set formatoptions=jcrql
" vertical split will be on right side
set splitright
" show tabline to off
set showtabline=0
" change directory with new file
set autochdir
set filetype
set noequalalways
"set filetype
" make .json files have javascript syntax highlighting
autocmd BufNewFile,BufRead,BufWrite *.json set ft=json
" copy to clipboard
set clipboard+=unnamedplus
" don't fully quit nvim when pressing q on help file
augroup quitHelpFile
  autocmd!
  autocmd FileType help noremap <leader>y :echo "hello world"<CR>
augroup END

"{ [Custom Key Mappings]
let mapleader = "\<Space>"
let maplocalleader="\<Space>"

nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" for live coding
nnoremap  :syntax enable<CR> :hi normal guibg=none<CR> :Goyo<CR> :hi visual guibg=red<CR> :hi StatusLine ctermbg=red<CR>
" faster to quit
nnoremap q :q<CR>
" Toggle NERDTree (Alt + B)
nnoremap ß :NERDTreeToggle %<CR>
" Toggle Goyo
nnoremap <leader>f :Goyo<CR> :so ~/.config/nvim/init.vim<CR> :call webdevicons#refresh()<CR> :ReadTypes<CR>
" toggle between terminal
nnoremap <C-i> :vertical botright Ttoggle<CR><C-w>l
" format code
nnoremap <leader>s :YcmCompleter Format<CR>
" go back to last buffer
nnoremap <leader>w :b#<CR>
" open last buffer on right
nnoremap <leader>W :vertical sb#<CR>
" show and select a opened buffer
nnoremap <leader>o :BuffersPreview<CR>
nnoremap <leader>O :Buffers<CR>
" split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" toggle zoom in a split window
nnoremap <leader>z :only<CR>
nnoremap <leader>Z :ZoomWinTabToggle<CR>
" nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>cd :call NERDTreeToggleInCurDir()<cr>
" go to the start screen
nnoremap <leader><leader> :Startify<CR>
" delete a line that cursor is on
nnoremap - "_dd
" add a line below cursor position
nnoremap + m`o<Esc>``
" scroll one line down (Shift + (-))
nnoremap § <C-Y>k
" scroll:one line up (Shift + (.))
nnoremap ¶ <C-E>j
" clear a line and enter insert mode
nnoremap Ñ ddO
" open and edit .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>Ev :e $MYVIMRC<CR>
" source my .vimrc file
nnoremap <leader>sv :source $MYVIMRC<CR> :call webdevicons#refresh()<CR> :ReadTypes<CR>
"nnoremap <leader>sv :source $MYVIMRC<CR>
" open lf file manager
nnoremap <leader>p :Lf<CR>
" open vimwiki index file
nmap <leader>uu <Plug>VimwikiIndex
nmap <leader>ut <Plug>VimwikiTabIndex
nmap <leader>us <Plug>VimwikiUISelect
nmap <leader>ui <Plug>VimwikiDiaryIndex
nmap <leader>u<leader>u <Plug>VimwikiMakeDiaryNote
nmap <leader>u<leader>t <Plug>VimwikiTabMakeDiaryNote
nmap <leader>u<leader>y <Plug>VimwikiMakeYesterdayDiaryNote
nmap <leader>u<leader>m <Plug>VimwikiMakeTomorrowDiaryNote
nmap <leader>u<leader>i <Plug>VimwikiDiaryGenerateLinks
" open tag bar
nnoremap <F8> :TagbarToggle<CR>
" open task warrior
nnoremap <leader>tw :TW<CR>
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk

" exit insert mode in terminal
tnoremap <Esc> <C-\><C-n>

" move selected line(s) down (Alt + -)
vnoremap … :m '>+1<CR>gv=gv
" move selected line(s) up (Alt + .)
vnoremap – :m '<-2<CR>gv=gv

" move one space ahead (for after a parens, quotes, etc)
inoremap å <right>
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Up> <C-o>gk

" treat p as i( to remove contents inside a parentheses when pressing dp 
onoremap p i(
" insert mode in next parens after deleting its contents
onoremap in( :<C-u>normal! f(vi(<CR>
" insert mode in last parens after deleting its contents
onoremap il( :<C-u>normal! F)vi(<CR>

" use <Esc> key to exit fzf
augroup exit_fzf
  autocmd!
  autocmd FileType fzf tnoremap <buffer> <Esc> <C-c>
augroup END

"{ [Custom Abbreviations]
augroup if_statement
  autocmd!
  autocmd FileType javascript,java :iabbrev <buffer> iff if(){<CR>}<up><right><right>
augroup END

"{ [Color Scheme]
colorscheme ayu

" update tags highlighting for java files
augroup JavaBufManagement
  autocmd!
  autocmd BufEnter,WinEnter *.java call Handle_BufJava_Enter()
augroup END

function! Handle_BufJava_Enter()
  if &filetype == 'java'
    execute "UpdateTypesFile"
  endif
endfunction

" highlight all operators
let g:ophigh_color_gui = "#F6FF00"
fun! HighlightOperators()
  syntax match OperatorChars "?\|+\|-\|\*\|;\|:\|,\|<\|>\|&\||\|!\|\~\|%\|=\|)\|(\|{\|}\|\.\|\[\|\]\|/\(/\|*\)\@!"
  exec "hi OperatorChars guifg=" . g:ophigh_color_gui . " gui=NONE"
endfunction

"augroup operatorHighlight
"  autocmd!
"  au Syntax * call HighlightOperators()
"  au ColorScheme * call HighlightOperators()
"augroup END

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

hi TerminalColor guibg=#000000
" Change highlight group of terminal window
function! Handle_Win_Enter()
  if &filetype == 'neoterm'
    setlocal winhighlight=Normal:TerminalColor
    " a keymapping to go to cwd in terminal
    autocmd FileType neoterm :nnoremap <buffer> <C-t> :T cd <C-R>=getcwd()<CR><CR>iclear<CR>
  endif
endfunction
