setlocal foldlevel=1
setlocal foldenable
setlocal foldmethod=expr
setlocal foldexpr=StackedMarkdownFolds(v:lnum)

function! StackedMarkdownFolds(lnum)
  let thisline = getline(a:lnum)
  let prevline = getline(a:lnum - 1)
  let nextline = getline(a:lnum + 1)
  if thisline =~ '^```.*$' && prevline =~ '^\s*$'  " start of a fenced block
    return ">2"
  elseif thisline =~ '^```$' && nextline =~ '^\s*$'  " end of a fenced block
    return "<2"
  endif

  let level=0
  if thisline =~ '^#\+\s\+'
    let hashCount = len(matchstr(thisline, '^#\{1,6}'))
    if hashCount > 0
      let level = hashCount
    endif
  else
    if thisline != ''
      let nextline = getline(a:lnum + 1)
      if nextline =~ '^=\+\s*$'
        let level = 1
      elseif nextline =~ '^-\+\s*$'
        let level = 2
      endif
    endif
  endif
  
  if level > 0
    return ">1"
  else
    return "="
  endif
endfunction
