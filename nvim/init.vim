" ===== [ Juan Flores's vim config file ] =====
" ===== [ ----juaneduardoflores.com---- ] =====

"{ [Plugins]
call plug#begin('~/.config/nvim/plugged')
" starting screen
Plug 'mhinz/vim-startify'
" syntax highlighting for multiple languages
Plug 'sheerun/vim-polyglot'
" java maven projects
"""""" Plug 'mikelue/vim-maven-plugin'
" eclim plugin for communication between Eclipse and nvim
Plug 'starcraftman/vim-eclim'
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
" surround words or selections with something
Plug 'tpope/vim-surround'
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
" make code far away unhighlighted
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
Plug '~/.config/nvim/plugged/vim-json-highlighter'
"Plug 'mklabs/vim-json'
" highlight variables
Plug 'jaxbot/semantic-highlight.vim'
" taskwarrior for todo list
Plug 'blindFS/vim-taskwarrior'
" manage notes and documentation
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'majutsushi/tagbar'
Plug 'powerman/vim-plugin-AnsiEsc'
" to colorize hex colors
Plug 'chrisbra/Colorizer'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
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
let g:limelight_paragraph_span = 0

let g:limelight_conceal_guifg = '#1a212e'

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
" Function to open nerd tree in the current file directory.
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

let s:red = "AE403F"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['java'] = s:red " sets the icon color of java files to red

"{{ ale settings

let g:ale_set_signs = '1'
let g:ale_sign_error = '❌'
"let g:ale_sign_warning = '⚠️'
let g:ale_sign_warning = '.'
let g:ale_sign_highlight_linenrs = 1
let g:ale_fix_on_save = '1'
let g:ale_enabled = 0
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
" let TIDAL_BOOT_PATH= 'Users/juaneduardoflores/.config/nvim/plugged/vim-tidal/Tidal.ghci'
let g:tidal_flash_duration = '450'
let g:haskell_tidal = '1'

" Function to change colorscheme to livecoding when on a tidal file.
function! ChangeColScheme()
  let my_filetype = &filetype
  if (my_filetype == 'tidal')
    colorscheme livecoding
  else 
    " colorscheme ayu
  endif
endfunction

augroup changescheme
  autocmd!
  
  autocmd BufEnter * call ChangeColScheme()

  " autocmd BufEnter *.tidal execute "colorscheme livecoding"
  " autocmd BufHidden *.tidal execute "colorscheme ayu"
  " autocmd BufEnter *.tidal execute "setlocal cursorcolumn"
  " autocmd BufEnter *.tidal execute "setlocal cursorline"
  " autocmd BufHidden *.tidal execute "setlocal nocursorcolumn"
  " autocmd BufHidden *.tidal execute "setlocal nocursorline"
augroup END

"{{ ultisnips settings
let g:UltiSnipsExpandTrigger="ƒ"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsAddFileTyples="md.html"

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

let g:startify_bookmarks = ['~/.skhdrc', '~/.yabairc', '~/.taskrc', '~/.gitconfig', '~/.eslintrc.json', '~/.zshrc', '~/.tern-config', '~/.config/kitty/kitty.conf']
let g:startify_custom_footer = ''


function JSONparse(str)
  let [null, false, true] = ['', 0, 1]
  let l:stripped = substitute(a:str,'\C"\(\\.\|[^"\\]\)*"','','g')
  if l:stripped !~# "[^,:{}\\[\\]0-9.\\-+Eaeflnr-u \n\r\t]"
    try
      return eval(substitute(a:str,"[\r\n]"," ",'g'))
    catch
    endtry
  endif
  " call s:throw("invalid JSON: " . l:stripped)
endfunction

let wordofday = JSONparse(system('cat ~/GermanLearning/wordofday.json'))

let g:startify_custom_header_quotes = [
      \ ['Word of the Day:', '', wordofday.german, wordofday.english, wordofday.spanish]
      \ ] 

let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

"{{ taskwarrior settings

" let g:task_report_name = 'unblocked'
let g:task_report_name = 'mytoday'


" augroup reportToday
"   autocmd!
"   autocmd BufEnter * let g:task_report_name = 'mytoday'
" augroup END

" augroup taskwarrsyntax
"   autocmd!
"   autocmd FileType taskreport hi taskwarrior_due guifg=#ffb60a
" augroup END

"{{ vimwiki settings
"let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown'}]
let wiki_1 = {}
let wiki_1.path = '~/vimwiki_ProjectTODOList/'
let wiki_1.auto_toc = 1

let wiki_2 = {}
let wiki_2.path = '~/vimwiki_Programming/'
let wiki_2.path_html = '~/vimwiki_Programming_html'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let wiki_2.auto_tags = 1
let wiki_2.index = 'programmingindex.html'
" let wiki_2.template_path = wiki_2.path_html . '/template'
" let wiki_2.template_default ='template'
" let wiki_2.template_ext = '.htm'
" let wiki_2.nested_syntaxes = {'python': 'python', 'java': 'java', 'javascript': 'javascript',
      " \'lua': 'lua'}

let wiki_3 = {}
let wiki_3.path = '~/vimwiki_Productivitylog/'
let wiki_3.path_html = '~/vimwiki_Productivitylog_html'
let wiki_3.auto_toc = 1

let wiki_4 = {}
let wiki_4.path = '~/vimwiki_ProjectDiary/'
let wiki_4.path_html = '~/vimwiki_ProjectDiary_html'
" let wiki_4.syntax = 'v'
" let wiki_4.ext = '.md'
let wiki_4.auto_tags = 1

let g:vimwiki_list = [wiki_1, wiki_2, wiki_3, wiki_4]
let g:vimwiki_folding = 'syntax'

" make foldmethod = syntax if enter a wiki file
augroup foldwiki
  autocmd!
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader1 guifg=#646C2F
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader2 guifg=#8E8474
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader3 guifg=#C2B02E
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader4 guifg=#8C5226
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader5 guifg=#326B62
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader6 guifg=#7DA182
  autocmd BufEnter *.md,*.wiki setlocal wrap linebreak
  autocmd BufEnter *.wiki nmap <buffer> <leader>ubb <Plug>Vimwiki2HTMLBrowse
  autocmd BufEnter *.md,*.wiki silent execute "ALEDisable"
  autocmd BufEnter *.md,*.wiki set nospell

  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview

augroup END

" make a template for diary entry
autocmd BufNewFile ~/vimwiki_ProjectTODOList/diary/*.wiki :silent 0r !~/.config/nvim/bin/generate-vimwiki-diary-template.py '%'

"{{ vim-markdown-preview settings
" let vim_markdown_preview_github=1	
let vim_markdown_preview_pandoc=1

"{{ tagbar settings
let g:tagbar_autofocus = 1

"{{ Goyo settings


function! s:goyo_enter()
  " Remove artifacts for NeoVim on true colors transparent background.
  " guifg is the terminal's background color.
  " hi! VertSplit gui=NONE guifg=#1b202a guibg=NONE
  " hi! StatusLine gui=NONE guifg=#1b202a guibg=NONE
  " hi! StatusLineNC gui=NONE guifg=#1b202a guibg=NONE
  " nnoremap † :vertical botright Ttoggle<CR><C-w>2l
  nnoremap ß :call NERDTreeToggleInCurDir()<CR>:Goyo x<CR> 
  nnoremap † :vertical botright Ttoggle<CR>:Goyo x<CR>2<C-w>l
  nnoremap <C-l> <C-w>2l
endfunction

function! s:goyo_leave()
  hi blockcomment guifg=#3c6b2d gui=bold
  hi vimblockcomment guifg=#3c6b2d
  hi Visual guibg=#3d2254
  hi TerminalColor guibg=#000000
  set number relativenumber 
  nnoremap ß :call NERDTreeToggleInCurDir()<CR>
  nnoremap † :vertical botright Ttoggle<CR><C-w>l
  nnoremap <C-j> <C-w>j
endfunction

" function EquilizeWindow()
"   if exists('#goyo')
"     " autocmd! WinEnter * execute "normal \<C-W>\="
"     " execute "normal \<C-W>\="
"     execute "Goyo x"
"     echo "yes"
"   endif
" endfunction

" augroup equilizeWindow
"   autocmd!
"   autocmd WinEnter * call EquilizeWindow()
" augroup END

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd User GoyoEnter nested call <SID>goyo_enter()
autocmd User GoyoLeave nested call <SID>goyo_leave()



"{{ Colorizer

" let g:colorizer_auto_filetype='vim'

"{ [Builtin Options and Settings]
"{{ code folding
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

  " Set fold settings.
  set foldmethod=expr
  set foldexpr=VimFolds(v:lnum)
  set foldtext=MyFoldText()
  " Sets the chars after the FoldText() to just spaces.
  set fillchars=fold:\ 

  " Remembers folds when leave buffer, window, or saving file.
  augroup AutoSaveFolds
   autocmd!
    " view files are about 500 bytes
    " bufleave but not bufwinleave captures closing 2nd tab
    " nested is needed by bufwrite* (if triggered via other autocmd)
    autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
    autocmd BufWinEnter ?* silent! loadview
  augroup end

  " [TODO]: Make a java fold function that folds block comments and functions.
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

"{{ paths
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.8/bin/python3'

"{{ tabstop and shiftwidth for Java
autocmd FileType java setlocal tabstop=2

"{{ handle buffers
" a buffer is not unloaded but instead hidden when it is exited.
set hidden

"{{ basic settings
" Everytime a markdown file is saved, use pandoc to convert it to html and
" save it in the website directory.
" [TODO]: Change this to a function that is toggleable.
let g:updatesite = 0
function ToggleUpdateSite()
  if g:updatesite
    silent exec "!convertMDtoHTMLDir " . expand('%:r') . " ~/vimwiki_Pedagogy"
  endif
endfunction

autocmd BufWrite *.md :call ToggleUpdateSite()

" ===== [ Save Position and View Position When Switching Buffers ] =====
" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif
  

set shiftwidth=2

" shows matches as I type for substitute, magic, etc.
set inccommand=nosplit

set noswapfile
"syntax enable
filetype plugin on
"" keep code from wrapping

set nowrap
"" no highlighting search matches
set nohlsearch
"" enables the mouse to resize windows and scroll buffers
set mouse=a
"" sets numbers on
set number relativenumber
"" set encoding to UTF-8
set encoding=UTF-8
"" true colors support
if (has("termguicolors"))
 set termguicolors
endif
"" formatoptions
set formatoptions=jcrql
"" vertical split will be on right side
set splitright
set splitbelow
"" do not show tabs
set showtabline=0
"" change nvim directory with new file
set autochdir
"" prevent windows from doing weird stuff when opening nerdtree or neoterm
set noequalalways
"" allow copying to clipboard
set clipboard+=unnamedplus

"{{ shell
set shell=/bin/zsh
let &shell='/bin/zsh -i'



"{ [Custom Key Mappings]
let mapleader = "\<Space>"
let maplocalleader="\<Space>"

" ===== [ NERDTree ] =====
" Toggle NERDTree (Alt + B)
nnoremap ß :call NERDTreeToggleInCurDir()<CR>

" ===== [ Goyo ] =====
" Toggle Goyo (f for focus)	
nnoremap <leader>f :Goyo<CR>

" ===== [ Terminal ] =====
" Toggle between terminal (Alt + T)
nnoremap † :vertical botright Ttoggle<CR><C-w>l
" Create a terminal window below.
nnoremap <S-Down> :10split<CR> :terminal<CR>
" Use esc to leave terminal insert mode
tnoremap <Esc> <C-\><C-n>

" ===== [ Last Buffer ] =====
" go back to last buffer
nnoremap <leader>w :b#<CR>
" open last buffer on right
nnoremap <leader>W :vertical sb#<CR>

" ===== [ FZF ] =====
" show and select any opened buffer
nnoremap <leader>o :FzfPreviewBuffers<CR>
nnoremap <leader>O :FzfPreviewProjectFiles<CR>

" ===== [ Movement ] =====
" split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" z. will shift placement of cursor to top 1/4 of file view instead of middle
nnoremap z. 10jz.10k
" move up and down paragraphs
nnoremap { :normal! {{14jz.13k<CR>
nnoremap } :normal! }14jz.13k<CR>
 
" ===== [ Zoom Window ] =====
" toggle zoom in a split window
nnoremap <leader>z :ZoomWinTabToggle<CR>
nnoremap <leader>Z :only<CR>

" ===== [ Startify ] =====
" go to the start screen
nnoremap <leader><leader> :Startify<CR>


" ===== [ vimrc ] =====
" open and edit .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>Ev :e $MYVIMRC<CR>
" source my .vimrc file
nnoremap <leader>sv :source $MYVIMRC<CR> :call webdevicons#refresh()<CR> :ReadTypes<CR>
"nnoremap <leader>sv :source $MYVIMRC<CR>

" ===== [ LF ] =====
" open lf file manager
nnoremap <leader>p :Lf<CR>

" ===== [ vimwiki ] =====
" vimwiki key mappings
nmap <leader>ut <Plug>VimwikiMakeTomorrowDiaryNote
nmap <leader>u<leader>u <Plug>VimwikiMakeYesterdayDiaryNote
nmap <leader>u<leader>y <Plug>VimwikiTabMakeDiaryNote
nmap <leader>u<leader>i <Plug>VimwikiDiaryGenerateLinks
nmap <leader>u<leader>t <Plug>VimwikiTabIndex
nmap <leader>uu1 1<Plug>VimwikiIndex
nmap <leader>uu2 2<Plug>VimwikiIndex
nmap <leader>uu3 <Plug>VimwikiDiaryIndex
nmap <leader>uu4 4<Plug>VimwikiIndex
" nmap <leader>us <Plug>VimwikiUISelect
nmap <leader>uuu <Plug>VimwikiMakeDiaryNote
" open wikiindex in vsplit
nnoremap <leader>uv1 :vsplit ~/vimwiki_ProjectTODOList/index.wiki<CR>
nnoremap <leader>uv2 :vsplit ~/vimwiki_Programming/index.wiki<CR>
nnoremap <leader>uv3 :vsplit ~/vimwiki_Productivitylog/index.wiki<CR>
nnoremap <leader>uv4 :vsplit ~/vimwiki_Pedagogy/index.wiki<CR>
" remap of vsplit link
nmap <leader>uvl <Plug>VimwikiVSplitLink

" ===== [ Tag Bar ] =====
" open tag bar
nnoremap <F8> :TagbarToggle<CR>

" ===== [ Task Warrior ] =====
" open task warrior
nnoremap <leader>tw :execute "let g:task_report_name='mytoday'"<CR> :TW<CR>
nnoremap <leader>twp :execute "let g:task_report_name='unblocked'"<CR> :TW<CR>
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk
" resize windows evenly
nnoremap Ω <C-w>=
" increase/decrease window size
nnoremap <leader><up> <C-W>+
nnoremap <leader><down> <C-W>-

" ===== [ Markdown ] =====
nnoremap <leader>umm :MarkdownPreview<CR>
nnoremap <leader>um- :MarkdownPreviewStop<CR>
nnoremap √ 1z=
nnoremap <F12> :silent exec "!convertMDtoHTML " . expand('%:r')
nnoremap <F13> :silent exec "!convertMDtoHTMLDir " . expand('%:r') .  
nnoremap œ q

" ===== [ UltiSnips ] =====
"Open UltiSnips Edit in vsplit
nnoremap <leader>us :UltiSnipsEdit<CR>

" ===== [ Misc. ] =====
" Open help file link
augroup helpFiles
  autocmd!
  autocmd Filetype help nnoremap <buffer> <CR> <c-]>
augroup END
 
" ===== [ Code Movement/Edit ] =====
" move selected line(s) down (Alt + -)
vnoremap … :m '>+1<CR>gv=gv
" move selected line(s) up (Alt + .)
vnoremap – :m '<-2<CR>gv=gv
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

" my custom color scheme additions
hi blockcomment guifg=#3c6b2d gui=bold
hi vimblockcomment guifg=#3c6b2d
hi Visual guibg=#3d2254
augroup customHighlights
  autocmd!
  autocmd BufEnter * syn match blockcomment "\v/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/"
  " autocmd! BufEnter * syn match vimblockcomment "\v\"\h=====\h[.*?]\h====="
  " autocmd BufEnter * syn match vimblockcomment "\v/^\"\s\={5}\s\[\s.*\s\]\s\={5}/"
  autocmd BufEnter * syn match vimblockcomment "\v^\"\s\={5}\s\[\s.*\s\]\s\={5}$"
augroup END

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
    autocmd! FileType neoterm :nnoremap <buffer> <C-t> :T cd <C-R>=getcwd()<CR><CR>iclear<CR>
  endif
endfunction
