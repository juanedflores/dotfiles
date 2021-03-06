" ===== [ Juan Flores Neovim Config File ] =====
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
" run terminal commands asynchronously
Plug 'skywind3000/asyncrun.vim'
" nvim in the browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

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
Plug 'preservim/tagbar'
"" Highlight matching html tag
Plug 'gregsexton/MatchTag' 
"" Language packs (installed for better html indentation)
Plug 'sheerun/vim-polyglot'
"" Code Formatter
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"" Zen Mode
Plug 'folke/zen-mode.nvim'

" ===== [ Windows ] =====
"" zoom/in out of windows
Plug 'juanedflores/vimzoom'

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
"" fzf-preview
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
"" Pico-8 Syntax
Plug 'aquova/vim-pico8-syntax'

" ===== [ Wiki/TaskManager ] =====
"" manage notes and documentation
Plug 'vimwiki/vimwiki'
"" taskwarrior in vimwiki
Plug 'tools-life/taskwiki'

" ===== [ Java Development ] =====
"" eclim plugin for communication between Eclipse and vim
Plug 'starcraftman/vim-eclim'
"" better Java syntax highlighting
Plug 'juanedflores/java-syntax.vim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'mfussenegger/nvim-dap'

" ===== [ Writing Documents ] =====
"" support for writing LaTeX documents
Plug 'lervag/vimtex'
"" grammar check
Plug 'dpelle/vim-LanguageTool' 
"" syntastic for proselint
Plug 'vim-syntastic/syntastic' 

" ===== [ Markdown ] =====
" fold markdown headers
" Plug 'masukomi/vim-markdown-folding'

" ===== [ Color Schemes ] =====
"" contrasting colors
Plug 'srcery-colors/srcery-vim'
"" random colorscheme
Plug 'Sammyalhashe/random_colorscheme.vim'

" ===== [ Visual ] =====
" color code
Plug 'chrisbra/Colorizer'

" ===== [ Neovim 0.5 ] =====
" configure LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" ===== [ My Plugins ] =====
"" add vimwiki link directory info
" Plug 'juanedflores/vimwiki-memorymachine', { 'do': ':UpdateRemotePlugins' }
" daily diary
Plug 'juanedflores/DailyDiary'
call plug#end()

"{{ [ lightline settings ]
"" noshowmode because -- INSERT -- is unecessary with lightline plugin
set noshowmode
let g:lightline = {
			\ 'colorscheme': 'jellybeans',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'cocstatus', 'readonly', 'filename', 'modified' ],
			\		    [ 'zoomed', 'gitbranch' ] ]
			\ },
			\ 'component_expand': {
			\	  'zoomed': 'IsZoomed',
			\ },
			\ 'component_function': {
			\   'cocstatus': 'coc#status',
			\   'gitbranch': 'FugitiveHead',
			\ },
			\ 'component_type': {
			\   'zoomed': 'warning',
			\}
			\ }

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"{{ [ Goyo settings ]
"" Goyo size
let g:goyo_width=85
let g:goyo_height=85

function! s:goyo_enter()
	set nowrap
	set noshowmode
	set noshowcmd
	execute "normal \<C-W>="
	execute "normal 0"
endfunction
function! s:goyo_leave()
	execute "source ~/.config/nvim/colors/specialcolors.vim"
	execute "edit"
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

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
" let g:UltiSnipsExpandTrigger="ƒ"
let g:UltiSnipsEditSplit="vertical"
" if !exists("g:UltiSnipsJumpForwardTrigger")
"     let g:UltiSnipsJumpForwardTrigger = "©"
" endif
" let g:UltiSnipsJumpBackwardTrigger="∑"

"{{ [ tagbar ]
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_previewwin_pos = "topleft"
let g:no_status_line = 0
let g:tagbar_jump_offset = winheight(0) / 4
" let g:tagbar_highlight_follow_insert = 1
" let g:tagbar_autoclose = 1
" let g:tagbar_autopreview = 1

"{{ [ fzf settings ]
"" hide the status bar in fzf
autocmd! FileType fzf
autocmd FileType fzf set laststatus=0 noshowmode noruler
			\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

"{{ [ lf settings ]
let g:lf_map_keys = 0
let g:NERDTreeHijackNetrw = 0
" make lf that default directory viewer
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
let g:floaterm_opener='edit'

"{{ [ startify settings ]
function s:projects()
	return [
				\ { 'line': 'Phages Website', 'path': '~/Documents/Websites/Phages/PhagesWebsite/js/sketch.js' },
				\ { 'line': 'Artist Website', 'path': '~/Documents/Websites/ArtistWebsite/index.html' },
				\ { 'line': 'MASA Debris Installation', 'path': '~/Documents/Processing/Project_MASA/SpaceDebris/SpaceDebris.pde' },
				\ ]
endfunction

let g:startify_lists = [
			\ { 'header': ['   MRU'], 'type': 'files' },
			\ { 'header': ['   Projects'], 'type': function('s:projects') },
			\ { 'header': ['   Configuration'], 'type': 'bookmarks' },
			\ ]

let g:startify_bookmarks = ['~/.skhdrc', '~/.yabairc', '~/.taskrc', '~/.gitconfig', '~/.eslintrc.json', '~/.zshrc', '~/.tern-config', '~/.eclimrc', '~/.config/kitty/kitty.conf', '~/.config/lf/lfrc', '~/.config/zathura/zathurarc', '~/.vit/config.ini', '~/Documents/Websites/ArtistWebsite/Blog/', '~/.hammerspoon/init.lua']
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
let wiki_1.path = '~/vimwiki/'

let wiki_2 = {}
let wiki_2.path = '~/vimwiki/Notes/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let wiki_2.index = 'notes_index.html'

let wiki_3 = {}
let wiki_3.path = '~/vimwiki/Progress_Projects/'

let wiki_4 = {}
let wiki_4.path = '~/vimwiki/German_Notes/'
let wiki_4.syntax = 'markdown'
let wiki_4.ext = '.md'

let g:vimwiki_list = [wiki_1, wiki_2, wiki_3, wiki_4]
let g:vimwiki_map_prefix = '<leader>u'
let g:vimwiki_folding = 'expr'

"" change appearance and functionality in vimwiki files
augroup foldwiki
	autocmd!
	autocmd BufEnter *.md,*.wiki hi VimwikiHeader1 guifg=#646C2F
	autocmd BufEnter *.md,*.wiki hi VimwikiHeader2 guifg=#8E8474
	autocmd BufEnter *.md,*.wiki hi VimwikiHeader3 guifg=#C2B02E
	autocmd BufEnter *.md,*.wiki hi VimwikiHeader4 guifg=#8C5226
	autocmd BufEnter *.md,*.wiki hi VimwikiHeader5 guifg=#326B62
	autocmd BufEnter *.md,*.wiki hi VimwikiHeader6 guifg=#7DA182
	autocmd BufEnter *.md,*.wiki setlocal linebreak wrap
	" autocmd BufEnter *.md,*.wiki setlocal wm=5
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


"{{ [ tidalcycles ]
let g:tidal_target = "terminal"
let g:tidal_flash_duration = '450'
let g:haskell_tidal = '1'

"{{ [ scnvim ]
let g:scnvim_scdoc = 1
let g:scnvim_postwin_auto_toggle = 1
let g:scnvim_eval_flash_repeats = 2

"{{ [ vim-processing ]
" set the 'foldmethod' to syntax
let g:processing_fold = 1
augroup processing
	autocmd!
	autocmd FileType processing setl cms=//%s
	autocmd FileType processing setl nosmartindent
	autocmd FileType processing setl cindent
	autocmd FileType processing nnoremap <buffer> <leader>r :RunProcessing<CR>
augroup END

"{{ [ vimtex ]
let g:vimtex_fold_enabled = '1'
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'skim'

"{{ [ coc ]
command! -nargs=0 Prettier :CocCommand prettier.formatFile

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocActionAsync('doHover')
	endif
endfunction

"{{ [ auto-pairs ]
" let g:AutoPairsShortcutToggle = '<C-p>'

"{{ [ vim-move ]
let g:move_key_modifier = 'C'

"{{ [ lens ]
let g:lens#disabled_filetypes = ['neoterm', 'fzf']

"{{ [ languagetool ]
let g:languagetool_jar='/Users/juaneduardoflores/LanguageTool-5.1/languagetool-commandline.jar'
let g:languagetool_disable_rules='UPPERCASE_SENTENCE_START'

"{{ [ syntastic ]
let g:syntastic_markdown_checkers = ['proselint']
let g:syntastic_mode_map = { 'mode': 'passive',
			\'active_filetypes': ["markdown"],
			\'passive_filetypes': [] 
			\}
" let g:syntastic_mode = "passive"


"{{ [ memorymachine ]
let g:MemMachineEnable = 1
let g:MemMachineIndex = "/Users/juaneduardoflores/vimwiki/Notes/notes_index.html.md"

"{{ [ pico-8 ]
function! ChangeLightlineCol()
	let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
	let s:palette.normal.middle = [['#000000', '#FF004D', 0, 21]]
	" let s:palette.tabline.middle = [['#000000', '#FF004D', 0, 21]]
	call lightline#colorscheme()
endfunction

augroup pico8 
	autocmd!
	autocmd BufEnter *.p8 setlocal ft=pico8
	autocmd BufEnter *.p8 setlocal shiftwidth=2
	autocmd BufEnter *.p8 setlocal colorcolumn=
	autocmd BufEnter *.p8 execute "normal gg=G"
	autocmd BufEnter *.p8 colorscheme pico
	autocmd BufEnter *.p8 call ChangeLightlineCol() 
	autocmd BufEnter *.p8 command! -buffer Pico8Run call RunPico8()
	autocmd BufEnter *.p8 nnoremap <buffer> <leader>r :silent execute '! /Applications/PICO-8.app/Contents/MacOS/pico8 -frameless 1 -run ' . '/Users/juaneduardoflores/Library/Application\ Support/pico-8/carts/' . '%:p:h:t' . '/' . '%'<CR>
augroup END

function! RunPico8() 
	let cmdline = '"' . "!/Applications/PICO-8.app/Contents/MacOS/pico8" . '" -run %:p'
	echom cmdline
	execute "AsyncRun -cwd=cmdline"
endfunction


"{{ [ prettier ]
" let g:prettier#autoformat_config_present = 1
let g:prettier#autoformat_config_files = ['/Users/juaneduardoflores/.prettierrc']

"{{ [ zen-mode ]
lua << EOF
  require("zen-mode").setup {
    window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    width = 100, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    tmux = true, -- disables the tmux statusline
    -- this will change the font size on kitty when in Zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      -- font = "+4", -- font size increment
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
  }
EOF

"{{ [ lspconfig install ]
lua << EOF
-- keymaps
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
 	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end 

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- lsp-install
local function setup_servers()
  require'lspinstall'.setup()

  -- get all installed servers
  local servers = require'lspinstall'.installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()

		-- language specific config
    if server == "python" then
      config.settings = lua_settings
    end

    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- Make diagnostics apepar in floating window
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
  }
)
vim.cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
vim.cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
EOF


"{{ [ nvim-jdtls ]
if has('nvim-0.5')
  augroup lsp
    au!
		au FileType java lua require'jdtls_config'.setup()
    " au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
  augroup end
endif

"{ [ Builtin Options and Settings ]
"{{ [ Basic Settings ]
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

"" enable loading the plugin files for specific file types
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
"" don't create a swap file
set noswapfile
"" formatoptions
augroup formatOpts
	autocmd! 
	autocmd BufNewFile,BufRead * setlocal formatoptions-=o
augroup END

" ===== [ Java ] =====
augroup JavaWorkflow
	setl shiftwidth=8
augroup END

" ===== [ Writing ] =====
set dictionary+=/usr/share/dict/words

" ===== [ Blog ] =====
augroup blogMake
	autocmd!
	autocmd BufWritePost /*Blog/*.md execute "AsyncRun -cwd=<root>/Blog make"
augroup END

" ===== [ Language Lessons ] =====
augroup lessonsMake
	autocmd!
	autocmd BufWritePost /*Spanish_Lessons/*.md execute "AsyncRun -cwd=<root>/Spanish_Lessons make"
augroup END

" ===== [ Save Cursor Position and Viewport When Switching Buffers ] =====
autocmd BufReadPost *
			\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
			\ |   exe "normal! g`\""
			\ | endif

" ===== [ Saving Command Output to Buffer or fzf ] =====
" e.g. 
" ':P messages' will place all the messages in a temporary buffer.
" ':P! messages' will allow you to search the output of messages via fzf.
function! s:split(expr) abort
	let lines = split(execute(a:expr, 'silent'), "[\n\r]")
	let name = printf('capture://%s', a:expr)

	if bufexists(name) == v:true
		execute 'bwipeout' bufnr(name)
	end

	execute 'botright' 'vnew' name

	setlocal buftype=nofile
	setlocal bufhidden=hide
	setlocal noswapfile
	setlocal filetype=vim

	call append(line('$'), lines)
endfunction

function! s:fzf(expr) abort
	let lines = split(execute(a:expr, 'silent'), "[\n\r]")

	return fzf#run({
				\  'source': lines,
				\  'options': '--tiebreak begin --ansi --header-lines 1'
				\})
endfunction

function s:capture(expr, bang) abort
	if a:bang
		call s:fzf(a:expr)
	else
		call s:split(a:expr)
	endif
endfunction

command! -nargs=1 -bang -complete=command P call s:capture(<q-args>, <bang>0)

"" python paths
let g:python_host_prog = '/Users/juaneduardoflores/.pyenv/versions/py2nvim/bin/python'
let g:python3_host_prog = '/Users/juaneduardoflores/.pyenv/versions/py3nvim/bin/python'

" ===== [ FileType Specific Settings ] =====
augroup pythonShift
	autocmd!
	autocmd FileType python setlocal shiftwidth=4
augroup END


"{ [ Key Mappings ]
let mapleader = "\<Space>"

" ===== [ Goyo ] =====
"" Toggle ZenMode (f for focus)	
nnoremap <leader>F :ZenMode<CR>

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

" ===== [ FZF ] =====
"" show and select any opened buffer
nnoremap <leader>o :CocCommand fzf-preview.Buffers<CR>
nnoremap <leader>O :CocCommand fzf-preview.DirectoryFiles<CR>

" ===== [ LF ] =====
"" open lf file manager
nnoremap <leader>p :FloatermNew lf<CR>
nnoremap <leader>P :LfCurrentDirectory<CR>

" ===== [ Code Movement/Editing ] =====
"" z. will shift placement of cursor to top 1/4 of file view instead of middle
nnoremap z. :silent execute "normal! z." . winheight(0)/4 . "\<lt>C-E>"<CR>
"" better tabbing
vnoremap < <gv
vnoremap > >gv
"" change inner word with 0 buffer (clipboard)
nnoremap <C-p> ciw<C-r>0<Esc>
"" make moving up/down viewport larger increments
nnoremap <C-e> 5<C-e>5j
nnoremap <C-y> 5<C-y>5k
"" move viewport by one line up/down
nnoremap § <C-Y>k
noremap ¶ <C-E>j
"" open a vsplit to the right
nnoremap √ :vsplit<CR>
"" close a buffer
nnoremap œ :q<CR>

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
nmap <leader>uuv :exec "vsplit"<CR> :exec "VimwikiMakeDiaryNote"<CR>
nmap <leader>d :call DailyDiaryToggle()<CR>

" ===== [ Window ] =====
"" resize windows evenly
nnoremap Ω <C-w>=
"" increase/decrease window size
nnoremap <C-up> 5<C-W>+
nnoremap <C-down> 5<C-W>-
nnoremap <left> 5<C-W><
nnoremap <right> 5<C-W>>
"" toggle zoom in a split window
nnoremap <leader>z :only<CR>
nnoremap <leader>Z :Zoom<CR>

" ===== [ Tag Bar ] =====
"" open tag bar
nnoremap <F11> :TagbarToggle<CR>
" ===== [ UltiSnips ] =====
""Open UltiSnips Edit in vsplit
nnoremap <F12> :UltiSnipsEdit<CR>

" ===== [ COC ] =====
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" [coc-snippets]
" Use ƒ for trigger snippet expand.
imap ƒ <Plug>(coc-snippets-expand)
" " Use <C-n> for select text for visual placeholder of snippet.
vmap <C-m> <Plug>(coc-snippets-select)
" Use <C-n> for jump to next placeholder
let g:coc_snippet_next = '<c-m>'
" Use <C-b> for jump to previous placeholder
let g:coc_snippet_prev = '<c-b>'

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" ===== [ SuperCollider ] =====
nmap <leader>cl <Plug>(scnvim-postwindow-clear)

" ===== [ Misc. ] =====
"" Use enter to open help file link
augroup helpFiles
	autocmd!
	autocmd Filetype help nnoremap <buffer> <CR> <c-]>
augroup END
"" Open file location in finder
nnoremap <F1> :silent exec "!open" "%:p:h"<CR>
" copy path of current buffer to clipboard
nnoremap <leader>cp :silent execute '! echo %:p \| pbcopy'<CR>
" run the makefile
nnoremap <F4> :make<CR>
" go to marker set
nnoremap <leader>k 'k:silent execute "normal! z." . winheight(0)/4 . "\<lt>C-E>"<CR>
" copy last message to clipboard
nnoremap <leader>cm :exec 'redir @+ \| 1message \| redir END'

"{ [ Color Scheme ]
let g:despacio_Sunset = 1

colorscheme despacio
let g:default_theme = 'despacio'

let g:random_theme = 1

highlight LspDiagnosticsDefaultError guifg=#af5f5f

" ===== [ Keywords ] =====
syn match myNOTE "\<\l\{2\}\NOTE\>"
hi def link myNOTE SignColumn 

" ===== [ General ] =====
execute "source ~/.config/nvim/colors/specialcolors.vim"
" vim: foldmethod=expr foldexpr=VimFolds(v\:lnum) foldtext=MyFoldText() fillchars=fold\:\ 
