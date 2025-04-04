vim.cmd([[

" let wiki_1 = {}
" let wiki_1.path = '/Users/juanedflores/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Zettelkasten'
" let wiki_1.diary_rel_path = 'DailyDiary/'
" let wiki_1.syntax = 'markdown'
" let wiki_1.ext = '.md'
" let wiki_1.index = '_Index_of_Zettelkasten'
"
" " let g:vimwiki_list = [wiki_1]
" let g:vimwiki_global_ext = 0
" let g:vimwiki_folding = 'custom'
"
" let g:vimwiki_list = [{'path': '/Users/juanedflores/Library/Mobile Documents/iCloud~md~obsidian/Documents/Zettelkasten',
"                       \ 'syntax': 'markdown', 'ext': 'md'}]

" let g:vimwiki_map_prefix = '<leader>u'
" let g:vimwiki_folding = 'expr'
" let g:syntax = 'markdown'

let g:vimwiki_global_ext = 1
let g:vimwiki_ext2syntax = {}
let g:vimwiki_map_prefix = '<Leader>u'

augroup foldwiki
  autocmd!
  " autocmd BufWinEnter *.md colorscheme modus_operandi
  "autocmd BufWinEnter *.md,*.wiki hi VimwikiHeader1 guifg=#7fe3ff gui=bold
  "autocmd BufWinEnter *.md,*.wiki hi VimwikiHeader2 guifg=#C2B02E gui=bold
  "autocmd BufWinEnter *.md,*.wiki hi VimwikiHeader3 guifg=#7a4f2f gui=bold
  "autocmd BufWinEnter *.md,*.wiki hi VimwikiHeader4 guifg=#646C2F gui=bold
  "autocmd BufWinEnter *.md,*.wiki hi VimwikiHeader5 guifg=#326B62 gui=bold
  "autocmd BufWinEnter *.md,*.wiki hi VimwikiHeader6 guifg=#7DA182 gui=bold
  "autocmd BufWinEnter *.md,*.wiki setlocal linebreak nowrap
  "autocmd BufWinEnter *.md,*.wiki :set ft=markdown linebreak wrap
  "autocmd BufWinEnter *.md,*.wiki :set ft=markdown
  autocmd Filetype vimwiki :set ft=markdown
  "autocmd BufWinEnter *.md :echo("hi") foldmethod=expr
  "autocmd BufAdd markdown setlocal foldmethod=expr

  "autocmd FileType vimwiki setlocal foldmethod=expr foldenable foldexpr=VimwikiFoldLevelCustom(v:lnum)
augroup END

function! VimwikiFoldLevelCustom(lnum)
  let pounds = strlen(matchstr(getline(a:lnum), '^#\+'))
  if (pounds)
    return '>' . pounds  " start a fold level
  endif
  if getline(a:lnum) =~? '\v^\s*$'
    if (strlen(matchstr(getline(a:lnum + 1), '^#\+')))
      return '-1' " don't fold last blank line before header
    endif
  endif
  return '=' " return previous fold level
endfunction

" Work with my autogenerated index files from Obsidian
function! VimwikiLinkHandler(link)
 " echom("This is the link: ")
 " echom(a:link)
 let link = a:link
 let l:cur_dir_tail = expand('%:t')

 if strpart(l:cur_dir_tail, 0, 10) == "_Index_of_"
    "echom("WE ARE IN INDEX")
    "echom(fnamemodify(link, ':t'))
    "echom(link)
    let link = "/" . link . ".md"
   "let link = "/" . fnamemodify(link, ':t') . ".md"
   call vimwiki#base#open_link(':e', link)
   return 1
 elseif link =~# '^vfile:'
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

]])
