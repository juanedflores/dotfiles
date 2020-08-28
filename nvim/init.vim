" ===== [ Juan Flores' Neovim Config File ] =====
" ===== [ ------juaneduardoflores.com----- ] =====

"{ [ Plugins ]
call plug#begin('~/.config/nvim/plugged')
" ===== [ Quality of Life ] =====
"" starting screen
Plug 'mhinz/vim-startify'
" remove everything but code
Plug 'junegunn/goyo.vim'
" code focusing
Plug 'junegunn/limelight.vim'
" adds the line in the bottom with info
Plug 'itchyny/lightline.vim'

" ===== [ Code Editing ] =====
"" toggle comments
Plug 'tpope/vim-commentary'
" auto pairs parantheses like chars
Plug 'jiangmiao/auto-pairs'
"" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" keybindings for surrounding words or selections with something
Plug 'tpope/vim-surround'
"" custom snippets
Plug 'SirVer/ultisnips'
"" browse the tags of the current file 
Plug 'majutsushi/tagbar'

" ===== [ Version Control ] =====
"" git wrapper
Plug 'tpope/vim-fugitive'

" ===== [ Terminal ] =====
"" floating terminal
Plug 'voldikss/vim-floaterm'
"" terminal
Plug 'kassio/neoterm'

" ===== [ File Navigation ] =====
"" fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
"" file manager in terminal
Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'
"" shows a tree of files
Plug 'scrooloose/nerdtree'
" syntax for nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" icons for nerdtree
Plug 'ryanoasis/vim-devicons'

" ===== [ Creative Coding ] =====
"" tidalcycles
Plug 'tidalcycles/vim-tidal'
"" SuperCollider
Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
"" Processing
Plug 'sophacles/vim-processing'

" ===== [ Wiki/TaskManager ] =====
"" manage notes and documentation
Plug 'vimwiki/vimwiki'
"" taskwarrior in vimwiki
Plug 'tools-life/taskwiki'

" ===== [ Java Development ] =====
"" eclim plugin for communication between Eclipse and vim
Plug 'starcraftman/vim-eclim'
"" better Java syntax highlighting
Plug 'juaneduardoflores/java-syntax.vim'

" ===== [ Writing Documents ] =====
"" support for writing LaTeX documents
Plug 'lervag/vimtex'
call plug#end()


"{{ [ lightline settings ]
"" noshowmode because -- INSERT -- is unecessary with lightline plugin
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

"{{ [ Goyo settings ]
"" Goyo size
let g:goyo_width=85
let g:goyo_height=85

"{{ [ limelight settings ]
"" Color of text not in focus
let g:limelight_conceal_guifg = '#1a212e'

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

"{{ [ ultisnips settings ]
let g:UltiSnipsExpandTrigger="ƒ"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsEditSplit="vertical"

"{{ [ fzf settings ]
"" hide the status bar in fzf
autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"{{ [ lf settings ]
let g:lf_map_keys = 0
let g:NERDTreeHijackNetrw = 0
let g:lf_replace_netrw = 1

"{{ [ neoterm settings ]
let g:neoterm_size='40%'
let g:neoterm_autoinsert='0'

function! HasWinToRight()
  let l:rightedge = win_screenpos(0)[1] + winwidth(0) - 1
  for l:win in range(1, winnr('$'))
      if l:win != winnr() && win_screenpos(l:win)[1] > l:rightedge
	return 1
      endif
  endfor
  return 0
endfunction

function! MoveRightMost()
  let l:v = 0
  let l:checkwin = HasWinToRight()
  while l:checkwin == 1
    execute "wincmd l"
    let l:checkwin = HasWinToRight()
    let l:v = l:v + 1
  endwhile
  return l:v 
endfunction

"{{ [ floaterm ]
"" size of floating terminal
let g:floaterm_width=0.8
let g:floaterm_height=0.7

"{{ [ startify settings ]
function s:projects()
  return [
	\ { 'line': 'Phages Website', 'path': '~/Documents/Websites/Phages/PhagesWebsite/sketch.js' },
	\ { 'line': 'Artist Website', 'path': '~/Documents/Websites/ArtistWebsite/index.html' },
	\ { 'line': 'MASA Debris Installation', 'path': '~/Documents/Processing/Project_MASA/SpaceDebris/SpaceDebris.pde' },
	\ ]
endfunction

let g:startify_lists = [
      \ { 'header': ['   MRU'], 'type': 'files' },
      \ { 'header': ['   Projects'], 'type': function('s:projects') },
      \ { 'header': ['   Configuration'], 'type': 'bookmarks' },
      \ ]

let g:startify_bookmarks = ['~/.skhdrc', '~/.yabairc', '~/.taskrc', '~/.gitconfig', '~/.eslintrc.json', '~/.zshrc', '~/.tern-config', '~/.eclimrc', '~/.config/kitty/kitty.conf', '~/.config/lf/lfrc', '~/.config/zathura/zathurarc', '~/.vit/config.ini']
let g:startify_files_number = 15
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
endfunction

" display german word of the day
let wordofday = JSONparse(system('cat ~/GermanLearning/wordofday.json'))

let g:startify_custom_header_quotes = [
      \ ['Word of the Day:', '', wordofday.german, wordofday.english, wordofday.spanish]
      \ ] 

let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

"{{ [ vimwiki settings ]
let wiki_1 = {}
let wiki_1.path = '~/wiki/'

let wiki_2 = {}
let wiki_2.path = '~/wiki/Notes/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let wiki_2.index = 'notes_index.html'

let wiki_3 = {}
let wiki_3.path = '~/wiki/Progress_Projects/'

let wiki_4 = {}
let wiki_4.path = '~/wiki/German_Notes/'
let wiki_4.syntax = 'markdown'
let wiki_4.ext = '.md'

let g:vimwiki_list = [wiki_1, wiki_2, wiki_3, wiki_4]
let g:vimwiki_folding = 'syntax'

let g:vimwiki_map_prefix = '<leader>u'

"" change appearance and functionality in vimwiki files
augroup foldwiki
  autocmd!
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader1 guifg=#646C2F
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader2 guifg=#8E8474
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader3 guifg=#C2B02E
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader4 guifg=#8C5226
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader5 guifg=#326B62
  autocmd BufEnter *.md,*.wiki hi VimwikiHeader6 guifg=#7DA182
  autocmd BufEnter *.md,*.wiki set linebreak wrap
augroup END

" Open vimwiki files in nvim using vfile: 
function! VimwikiLinkHandler(link)
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
   return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'tabnew ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction

"" make a template for diary entry
augroup diaryTemplate
  autocmd!
  autocmd BufNewFile ~/wiki/diary/*.wiki :silent 0r !~/.config/nvim/bin/generate-vimwiki-diary-template.py '%'
augroup END

"{{ [ tidalcycles ]
let g:tidal_target = "terminal"
let g:tidal_flash_duration = '450'
let g:haskell_tidal = '1'

"{{ [ scnvim ]
let g:scnvim_scdoc = 1
let g:scnvim_postwin_auto_toggle = 1
let g:scnvim_eval_flash_repeats = 2

"{{ [ vim-processing ]
let g:processing_fold = 1
augroup processing
  autocmd!
  autocmd FileType processing setl cms=//%s
  autocmd FileType processing set foldmethod=syntax
  autocmd FileType processing set nosmartindent
  autocmd FileType processing set cindent
augroup END

"{{ [ vimtex ]
let g:vimtex_fold_enabled = '1'
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'skim'

"{{ [ coc ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"{ [ Builtin Options and Settings ]
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

" Sets the chars after the FoldText() to just spaces.
" Remembers folds when leave buffer, window, or saving file.
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup END 

"{{ [ Basic Settings ]
""" enable loading the plugin files for specific file types
filetype plugin on
"" true colors support
if (has("termguicolors"))
 set termguicolors
endif
"" a buffer is not unloaded but instead hidden when it is exited.
set hidden
"" sets numbers on
set number relativenumber
""" no highlighting search matches
set nohlsearch
"" >> << will be two spaces
set shiftwidth=2
"" use mouse
set mouse=a
"" allow full clipboard ability to copy and paste in vim
set clipboard+=unnamedplus
""" turn on modelineexpr for vimrc settings
set modelineexpr
"" vertical split will be on right side, horizontal lower side
set splitright splitbelow
"" do not show tabs. keep it minimalist
set showtabline=0
"" change nvim directory to whatever the working file is
set autochdir
"" make the default file not wrap
set nowrap
"" formatoptions
augroup formatOpts
  autocmd! 
  autocmd BufNewFile,BufRead * setlocal formatoptions-=o
augroup END

" ===== [ Save Cursor Position and Viewport When Switching Buffers ] =====
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
\ |   exe "normal! g`\""
\ | endif

"" python paths
let g:python_host_prog = '/Users/juaneduardoflores/.pyenv/versions/py2nvim/bin/python'
let g:python3_host_prog = '/Users/juaneduardoflores/.pyenv/versions/py3nvim/bin/python'

"{ [ Key Mappings ]
let mapleader = "\<Space>"

" ===== [ Goyo ] =====
"" Toggle Goyo (f for focus)	
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

" ===== [ Last Buffer ] =====
"" go back to last buffer
nnoremap <leader>w :b#<CR>
"" open last buffer on right
nnoremap <leader>W :vertical sb#<CR>

" ===== [ FZF ] =====
"" show and select any opened buffer
nnoremap <leader>o :CocCommand fzf-preview.Buffers<CR>
nnoremap <leader>O :CocCommand fzf-preview.DirectoryFiles<CR>

" ===== [ LF ] =====
"" open lf file manager
nnoremap <leader>p :FloatermNew lf<CR>
nnoremap <leader>P :LfCurrentDirectory<CR>
"" moving files
nnoremap <leader>c :FloatermNew<CR>

" ===== [ NERDTree ] =====
"" Toggle NERDTree (Alt + B)
nnoremap ß :call NERDTreeToggleInCurDir()<CR>

" ===== [ Code Movement/Editing ] =====
"" split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"" z. will shift placement of cursor to top 1/4 of file view instead of middle
nnoremap z. :silent execute "normal! z." . winheight(0)/3 . "\<lt>C-E>"<CR>
"" make moving up/down viewport larger increments
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
"" better tabbing
vnoremap < <gv
vnoremap > >gv
"" pretty up buffer
nmap <leader>f  <Plug>(coc-format-selected)

" ===== [ Zoom Window ] =====
"" toggle zoom in a split window
nnoremap <leader>Z :only<CR>

" ===== [ Startify ] =====
"" go to the start screen
nnoremap <leader><leader> :Startify<CR>

" ===== [ vimrc ] =====
" open and edit .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>Ev :e $MYVIMRC<CR>
" source my .vimrc file
nnoremap <leader>sv :source $MYVIMRC<CR>

" ===== [ vimwiki ] =====
"" vimwiki key mappings
nmap <leader>uu1 1<Plug>VimwikiIndex
nmap <leader>uu2 2<Plug>VimwikiIndex
nmap <leader>uu3 3<Plug>VimwikiIndex
nmap <leader>uu4 4<Plug>VimwikiIndex
nmap <leader>uui <Plug>VimwikiDiaryIndex
nmap <leader>uuu <Plug>VimwikiMakeDiaryNote

" ===== [ Window ] =====
"" resize windows evenly
nnoremap Ω <C-w>=
"" increase/decrease window size
nnoremap <C-up> 5<C-W>+
nnoremap <C-down> 5<C-W>-
nnoremap <left> 5<C-W><
nnoremap <right> 5<C-W>>

" ===== [ Tag Bar ] =====
"" open tag bar
nnoremap <F11> :TagbarToggle<CR>
" ===== [ UltiSnips ] =====
""Open UltiSnips Edit in vsplit
nnoremap <F12> :UltiSnipsEdit<CR>

" ===== [ Misc. ] =====
"" Use enter to open help file link
augroup helpFiles
  autocmd!
  autocmd Filetype help nnoremap <buffer> <CR> <c-]>
augroup END
"" Open file location in finder
nnoremap <F1> :silent exec "!open" expand('%:p:h')<CR>

"{ [ Color Scheme ]
let g:despacio_Sunset = 1
colorscheme despacio
" ===== [ General ] =====
"" my custom color scheme additions
hi Directory  guifg=#646C2F
hi Folded guifg=#966b4b

"" special comments
hi BlockComment guifg=#3c6b2d
augroup blockComments 
  autocmd!
  autocmd BufEnter *vim syn match vimblockcomment "\v^\"\s\={5}\s\[\s.*\s\]\s\={5}$"
augroup END
hi link vimblockcomment BlockComment

" ===== [ Terminal ] =====
"" Change highlight group of terminal window
hi TerminalColor guibg=#000000
augroup blackTerminal 
  autocmd!
  autocmd FileType neoterm setlocal winhighlight=Normal:TerminalColor
augroup END

" vim: foldmethod=expr foldexpr=VimFolds(v\:lnum) foldtext=MyFoldText() fillchars=fold\:\ 
