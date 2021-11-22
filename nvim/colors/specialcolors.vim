"" my custom color scheme additions
" ===== [ Misc. ] =====
hi Directory  guifg=#646C2F
hi Folded guifg=#966b4b

" ===== [ Comments ] =====
sy region javaBlockComment       start='/\*' end='\*/'
hi def link javaBlockComment    BlockComment
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
