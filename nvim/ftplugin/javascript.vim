function! MyFoldText()
	let line = getline(v:foldstart)
	let folded_line_num = v:foldend - v:foldstart
	let line_text = substitute(line, '^"{\+', '', 'g')
	let fillcharcount = &textwidth - len(line_text) - len(folded_line_num)
	return '+' . line_text . repeat('.', fillcharcount) . ' (' . folded_line_num . ' L)'
endfunction

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldtext=MyFoldText()
setlocal fillchars=fold\:\ 
