" ===== [ Juan Flores' Neovim Config File ] =====
" ===== [ ------juaneduardoflores.com----- ] =====

"{ [Plugins]
call plug#begin('~/.config/nvim/plugged')
" ===== [ Quality of Life ] =====
" starting screen!
Plug 'mhinz/vim-startify'
" zen mode
Plug 'junegunn/goyo.vim'
" make code far away unhighlighted
Plug 'junegunn/limelight.vim'
" adds the line in the bottom with info
Plug 'itchyny/lightline.vim'
" zoom in on a window when there are multiple
Plug 'troydm/zoomwintab.vim'
" to colorize hex colors
Plug 'chrisbra/Colorizer'

" ===== [ Color Themes ] =====
Plug 'ayu-theme/ayu-vim'
Plug 'AlessandroYorba/Despacio'

" ===== [ Code Editing ] =====
" browse the tags of the current file 
Plug 'majutsushi/tagbar'
" toggle comments
Plug 'tpope/vim-commentary'
" closes any parantheses or quotes.
Plug 'jiangmiao/auto-pairs'
" keybindings for surrounding words or selections with something
Plug 'tpope/vim-surround'
" custom snippets
Plug 'SirVer/ultisnips'
" collection of snippets
Plug 'honza/vim-snippets'
" java script linting
Plug 'dense-analysis/ale'
" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" code completion
" Plug 'ycm-core/YouCompleteMe'
" formatting for file types
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
    \ 'for': ['html','css'] }

" ===== [ Version Control ] =====
" wrapper for git commands
Plug 'tpope/vim-fugitive'

" ===== [ Language Syntax/Highlighting ] =====
" syntax highlighting for multiple languages
Plug 'sheerun/vim-polyglot'
" a json parser
Plug '~/.config/nvim/plugged/vim-json-highlighter'
" highlight variables
Plug 'jaxbot/semantic-highlight.vim'
" highlight tags
Plug 'vim-scripts/TagHighlight'
" editing PICO-8 files
Plug 'justinj/vim-pico8-syntax'

" ===== [ Java Development ] =====
" eclim plugin for communication between Eclipse and nvim
Plug 'starcraftman/vim-eclim'

" ===== [ Terminal ] =====
" a terminal
Plug 'kassio/neoterm'
" floating terminal
Plug 'voldikss/vim-floaterm'

" ===== [ File Navigation ] =====
" fuzzy file finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'
" file manager in terminal
Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'
" shows a tree of files
Plug 'scrooloose/nerdtree'
" icons for nerdtree
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'ryanoasis/vim-devicons'
" syntax for nerdtree on most common file extensions
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" ===== [ Creative Coding ] =====
" tidalcycles
Plug 'tidalcycles/vim-tidal'
" SuperCollider
Plug 'davidgranstrom/scnvim', { 'do': {-> scnvim#install() } }
" Processing
Plug 'sophacles/vim-processing'

" ===== [ Wiki/TaskManager ] =====
" taskwarrior for todo list
Plug 'blindFS/vim-taskwarrior'
" manage notes and documentation
Plug 'vimwiki/vimwiki'
" taskwarrior in vimwiki
Plug 'tbabej/taskwiki'
" Esc ANSI codes
Plug 'powerman/vim-plugin-AnsiEsc'

" ===== [ Writing Documents ] =====
" support for writing LaTeX documents
Plug 'lervag/vimtex'
" preview markdown files in browser
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
" support for pandoc integration
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" support for rmarkdown
Plug 'vim-pandoc/vim-rmarkdown'
call plug#end()

"{{ [ limelight settings ]

" default is 0.5
let g:limelight_default_coefficient = 0.5
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0
" Color of text not in focus
let g:limelight_conceal_guifg = '#1a212e'

"{{ [ lightline settings ]

" noshowmode because -- INSERT -- is unecessary with lightline plugin
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

"{{ [ neoterm settings ]

let g:neoterm_size='40%'
let g:neoterm_autoinsert='0'

"{{ [ NERDTree settings ]

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

"{{ [ ALE settings ]

let g:ale_set_signs = '1'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '.'
let g:ale_sign_highlight_linenrs = 1
let g:ale_fix_on_save = '1'
let g:ale_enabled = 0
let g:ale_sign_column_always = 0
highlight ALEErrorSign guifg=#fb4934 guibg=none
highlight ALEWarningSign guifg=#fe8019 guibg=none
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ 'html': ['prettier'],
 \ 'css': ['prettier'],
 \ 'java': ['prettier'],
 \ 'json': ['prettier']
 \ }
let g:ale_linters = {
  \ 'javascript': ['eslint']
  \}

"{{ [ tidalcycles settings ]

let g:tidal_target = "terminal"
let g:tidal_flash_duration = '450'
let g:haskell_tidal = '1'

" Function to change colorscheme to livecoding when on a tidal file.
function! ChangeColScheme()
  let my_filetype = &filetype
  if (my_filetype == 'tidal')
    colorscheme livecoding
  else 
    " colorscheme despacio 
  endif
endfunction

augroup changescheme
  autocmd!
  autocmd BufEnter * call ChangeColScheme()
augroup END

"{{ [ ultisnips settings ]

let g:UltiSnipsExpandTrigger="ƒ"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsEditSplit="vertical"

"{{ [ fzf settings ]

" hide the status bar in fzf
autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 noshowmode noruler
	\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"{{ [ fzf preview settings ]

let g:fzf_preview_command = 'bat --color=always --style=grid {-1}'
 
"{{ [ lf settings ]

let g:lf_map_keys = 0

"{{ [ startify settings ]

function s:projects()
  return [
	\ { 'line': 'Phages Website', 'path': '~/Documents/Website_Building/Phages/PhagesWebsite/sketch.js' },
	\ { 'line': 'My Website', 'path': '~/vimwiki_Pedagogy/index.html' },
	\ { 'line': 'MASA Debris Installation', 'path': '~/Documents/Processing/Project_MASA/SpaceDebris/SpaceDebris.pde' },
	\ ]
endfunction

let g:startify_lists = [
      \ { 'header': ['   MRU'], 'type': 'files' },
      \ { 'header': ['   Projects'], 'type': function('s:projects') },
      \ { 'header': ['   Configuration'], 'type': 'bookmarks' },
      \ ]

let g:startify_files_number = 15

let g:startify_bookmarks = ['~/.skhdrc', '~/.yabairc', '~/.taskrc', '~/.gitconfig', '~/.eslintrc.json', '~/.zshrc', '~/.tern-config', '~/.eclimrc', '~/.config/kitty/kitty.conf', '~/.config/lf/lfrc', '~/.config/zathura/zathurarc', '~/.vit/config.ini']
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

" display german word of the day
let wordofday = JSONparse(system('cat ~/GermanLearning/wordofday.json'))

let g:startify_custom_header_quotes = [
      \ ['Word of the Day:', '', wordofday.german, wordofday.english, wordofday.spanish]
      \ ] 

let g:startify_custom_header = 'startify#pad(startify#fortune#boxed())'

"{{ [ taskwarrior settings ]

" let g:task_report_name = 'unblocked'
let g:task_report_name = 'mytoday'

"{{ [ vimwiki settings ]

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

let wiki_3 = {}
let wiki_3.path = '~/vimwiki_Productivitylog/'
let wiki_3.path_html = '~/vimwiki_Productivitylog_html'
let wiki_3.auto_toc = 1

let wiki_4 = {}
let wiki_4.path = '~/vimwiki_ProjectDiary/'
let wiki_4.path_html = '~/vimwiki_ProjectDiary_html'
let wiki_4.auto_tags = 1

let wiki_5 = {}
let wiki_5.path = '~/vimwiki_GermanNotes/'
let wiki_5.path_html = '~/vimwiki_GermanNotes_html'
let wiki_5.syntax = 'markdown'
let wiki_5.ext = '.md'
let wiki_5.auto_tags = 1

let g:vimwiki_list = [wiki_1, wiki_2, wiki_3, wiki_4, wiki_5]
let g:vimwiki_folding = 'syntax'

" disable polyglot for markdown to avoid problems
let g:polyglot_disabled = ['markdown']

let g:vimwiki_map_prefix = '<leader>y'

" change appearance and functionality in vimwiki files
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

  " Open vimwiki files in nvim using vfile: 
  function! VimwikiLinkHandler(link)
    " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
    "   1) [[vfile:~/Code/PythonProject/abc123.py]]
    "   2) [[vfile:./|Wiki Home]]
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

  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup END

" make a template for diary entry
augroup diaryTemplate
  autocmd!
  autocmd BufNewFile ~/vimwiki_ProjectTODOList/diary/*.wiki :silent 0r !~/.config/nvim/bin/generate-vimwiki-diary-template.py '%'
augroup END
" TODO : Make a template to work in making a diary for today and tomorrow commands

"{{ [ vim-markdown-preview settings ]

" use John MacFarlane's Pandoc to render HTML
let vim_markdown_preview_pandoc=1

"{{ [ tagbar settings ]

" cursor will move to the Tagbar window when it is opened.
let g:tagbar_autofocus = 1

"{{ [ Goyo settings ]

" Goyo size
let g:goyo_width=85
let g:goyo_height=85

function! s:goyo_enter()
  " Remove artifacts for NeoVim on true colors transparent background.
  " guifg is the terminal's background color.
  " hi! VertSplit gui=NONE guifg=#1b202a guibg=NONE
  " hi! StatusLine gui=NONE guifg=#1b202a guibg=NONE
  " hi! StatusLineNC gui=NONE guifg=#1b202a guibg=NONE

  " map keyshortcuts to work in Goyo
  nnoremap ß :NERDTreeToggle<CR>:Goyo x<CR> 
  nnoremap † :vertical botright Ttoggle<CR>:Goyo x<CR>2<C-w>l
  nnoremap <C-l> <C-w>2l
endfunction

function! s:goyo_leave()
  " re-highlight custom syntax
  hi blockcomment guifg=#3c6b2d gui=bold
  hi vimblockcomment guifg=#3c6b2d
  hi Visual guibg=#3d2254
  hi TerminalColor guibg=#000000
  hi Directory ctermfg=141 ctermbg=NONE cterm=NONE guifg=#646C2F guibg=NONE gui=NONE

  " sometimes number doesn't come back
  set number relativenumber 

  " remap keyshortcuts 
  nnoremap ß :call NERDTreeToggleInCurDir()<CR>
  nnoremap † :vertical botright Ttoggle<CR><C-w>l
  nnoremap <C-l> <C-w>l
endfunction

autocmd! User GoyoEnter
autocmd! User GoyoLeave
autocmd User GoyoEnter nested call <SID>goyo_enter()
autocmd User GoyoLeave nested call <SID>goyo_leave()


"{{ [ Colorizer ]

" auto activate colorizer for css and html files
let g:colorizer_auto_filetype='css,html'
" skip colorizing comments
let g:colorizer_skip_comments=1
" colornames can cause slowdown
let g:colorizer_colornames_disable=1

"{{ [ COC ]

let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-prettier',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-java'
  \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

augroup cocDisable
  autocmd!
  autocmd Filetype * execute "CocDisabl"
augroup END

nnoremap <silent> K :call <SID>show_documentation()<CR>

"{{ [ floaterm ]
let g:floaterm_width=0.9
let g:floaterm_height=0.9
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
augroup END

"{{ [ vimtex ]
let g:vimtex_fold_enabled = '1'
let g:vimtex_view_method = 'zathura'
 

"{ [Builtin Options and Settings]

"{{ [ code folding ]

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

  " TODO : Make a java fold function that folds block comments and functions.
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

"{{ [ paths ]

" links to python executable
  let g:python_host_prog = '/usr/bin/python2'
  let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.8/bin/python3'

"{{ [ shell ]

" set the shell
set shell=/bin/zsh
let &shell='/bin/zsh -i'

"{{ [ basic settings ]

" smart indent for C like languages
set smartindent
" a tab is two spaces
set tabstop=2
" >> << will be two spaces
set shiftwidth=2
" use the appropriate number of space to insert a <Tab>
set expandtab
" a buffer is not unloaded but instead hidden when it is exited.
set hidden
" shows matches as I type for substitute, magic, etc.
set inccommand=nosplit
" don't create a swap file
set noswapfile
"" enable loading the plugin files for specific file types
filetype plugin on
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
"" vertical split will be on right side
set splitright
"" horizontal split will be on the bottom side
set splitbelow
"" do not show tabs. keep it minimalistic
set showtabline=0
"" change nvim directory to whatever the working file is
set autochdir
"" prevent windows from autosizing when in splits
set noequalalways
"" if equalalways, only apply horizontally
set eadirection=hor
"" allow full ability of copying to clipboard in nvim
set clipboard+=unnamedplus
"" keep code from wrapping by default
set nowrap
"" no highlighting search matches
set nohlsearch
"" speed up updatetime so things are quicker. default: 4000
set updatetime=1000
"" formatoptions
augroup formatOpts
  autocmd! 
  autocmd FileType * setlocal formatoptions-=o
augroup END

" ===== [ Save Cursor Position and Viewport When Switching Buffers ] =====
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

" When switching buffers or save file, preserve window view.
" When entering a buffer, restore that window view.
if v:version >= 700
    autocmd BufLeave,BufWritePost * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

" ===== [ For My Website ] =====
" Everytime a markdown file is saved, use pandoc to convert it to html and
" save it in the website directory.
" TODO : Change this function to a toggleable command instead of changing
" a variable value.
let g:updatesite = 0
function ToggleUpdateSite()
  if g:updatesite
    " silent exec "!convertMDtoHTMLDir " . expand('%:r') . " ~/vimwiki_Pedagogy/Blog/Processing"
    " silent exec "!convertMDtoHTMLDirGer " . expand('%:r') . " ~/vimwiki_GermanNotes_html"
    silent exec "!convertMDtoHTMLDirGer " . expand('%:r') . " ~/vimwiki_SpanishNotes_html"
  endif
endfunction

autocmd BufWrite *.md :call ToggleUpdateSite()

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
" Open a floating terminal
nnoremap <C-t> :FloatermToggle<CR>
" Create a terminal window below.
nnoremap <S-Down> :10split<CR> :terminal<CR> :setlocal winhighlight=Normal:TerminalColor<CR>
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
nnoremap <leader>O :FzfPreviewDirectoryFiles<CR>

" ===== [ Code Movement/Editing ] =====
" split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" z. will shift placement of cursor to top 1/4 of file view instead of middle
nnoremap z. z.10<C-E>
" move up and down paragraphs
nnoremap { :normal! {{jz.<CR>9<C-e>
nnoremap } :normal! }jz.<CR>9<C-e>
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
noremap ¶ <C-E>j
" clear a line and enter insert mode
nnoremap Ñ ddO
" make moving up/down viewport larger increments
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
" better tabbing
vnoremap < <gv
vnoremap > >gv
 
" ===== [ Zoom Window ] =====
" toggle zoom in a split window
nnoremap <leader>z :only<CR>
nnoremap <leader>Z :ZoomWinTabToggle<CR>

" ===== [ Startify ] =====
" go to the start screen
nnoremap <leader><leader> :Startify<CR>

" ===== [ vimrc ] =====
" open and edit .vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>Ev :e $MYVIMRC<CR>
" source my .vimrc file
nnoremap <leader>sv :source $MYVIMRC<CR>
" nnoremap <leader>sv :source $MYVIMRC<CR> :call webdevicons#refresh()<CR> :ReadTypes<CR>

" ===== [ LF ] =====
" open lf file manager
nnoremap <leader>p :FloatermNew lf<CR>

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
nmap <leader>uu5 5<Plug>VimwikiIndex
nmap <leader>us <Plug>VimwikiUISelect
nmap <leader>uuu <Plug>VimwikiMakeDiaryNote
" open wikiindex in vsplit
nnoremap <leader>uv1 :vsplit ~/vimwiki_ProjectTODOList/index.wiki<CR>
nnoremap <leader>uv2 :vsplit ~/vimwiki_Programming/index.wiki<CR>
nnoremap <leader>uv3 :vsplit ~/vimwiki_Productivitylog/index.wiki<CR>
nnoremap <leader>uv4 :vsplit ~/vimwiki_ProjectDiary/index.wiki<CR>
nnoremap <leader>uv5 :vsplit ~/vimwiki_GermanNotes/index.wiki<CR>
" remap of vsplit link
nmap <leader>uvl <Plug>VimwikiVSplitLink

" ===== [ Tag Bar ] =====
" open tag bar
nnoremap <F8> :TagbarToggle<CR>

" ===== [ Task Warrior ] =====
" display tasks for today
nnoremap <leader>tw :execute "let g:task_report_name='mytoday'"<CR> :TW<CR>
" display project tasks
nnoremap <leader>twp :execute "let g:task_report_name='unblocked'"<CR> :TW<CR>

" ===== [ Writing/Documents ] =====
" move up and down visual lines that are wrapped
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk
" convert MD file to HTML
nnoremap <F12> :silent exec "!convertMDtoHTML " . expand('%:r')
nnoremap <F13> :silent exec "!convertMDtoHTMLDir " . expand('%:r') .  
nnoremap <F14> :silent exec "!convertMDtoHTMLDirGer " . expand('%:r') . " ~/vimwiki_GermanNotes_html"

" ===== [ Window ] =====
" resize windows evenly
nnoremap Ω <C-w>=
" increase/decrease window size
nnoremap <leader><up> <C-W>+
nnoremap <leader><down> <C-W>-

" ===== [ UltiSnips ] =====
"Open UltiSnips Edit in vsplit
nnoremap <F7> :UltiSnipsEdit<CR>

" ===== [ Fzf ] =====
" use <Esc> key to exit fzf
augroup exit_fzf
  autocmd!
  autocmd FileType fzf tnoremap <buffer> <Esc> <C-c>
augroup END

augroup superC
  autocmd!
  autocmd FileType scnvim,supercollider nnoremap <F15> :execute "normal \<Plug>(scnvim-postwindow-clear)"<CR>
augroup END

" ===== [ Misc. ] =====
" Use enter to open help file link
augroup helpFiles
  autocmd!
  autocmd Filetype help nnoremap <buffer> <CR> <c-]>
augroup END
" Open file location in finder
nnoremap <F1> :silent exec "!open" expand('%:p:h')<CR>

"{ [Color Scheme]
" colorscheme ayu
let g:despacio_Midnight = 1
colorscheme despacio

" ===== [ General ] =====
" my custom color scheme additions
hi Directory  guifg=#646C2F
hi blockcomment guifg=#3c6b2d gui=bold
hi vimblockcomment guifg=#3c6b2d
hi Visual guibg=#3d2254
augroup customHighlights
  autocmd!
  autocmd BufEnter * syn match blockcomment "\v/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/"
  autocmd BufEnter * syn match vimblockcomment "\v^\"\s\={5}\s\[\s.*\s\]\s\={5}$"
augroup END

" ===== [ Java Files ] =====
" Function to update any additional highlighting
function! Handle_BufJava_Enter()
  if &filetype == 'java'
    execute "UpdateTypesFile"
  endif
endfunction
" update tags highlighting for java files
augroup JavaBufManagement
  autocmd!
  autocmd BufEnter,WinEnter *.java call Handle_BufJava_Enter()
augroup END

" ===== [ Terminal ] =====
" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd BufEnter,WinEnter * call Handle_Win_Enter()
augroup END

hi TerminalColor guibg=#000000
" Change highlight group of terminal window
function! Handle_Win_Enter()
  if &filetype == 'neoterm'
    setlocal winhighlight=Normal:TerminalColor
  endif
endfunction

" ===== [ Goyo ] =====
" if sourcing vimrc when in goyo, make sure to remove numberline
augroup checkIfGoyoEnabled
  if (exists('#goyo'))
    set nonumber
    set norelativenumber
  endif
augroup END
