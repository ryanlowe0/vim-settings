
nmap pr Biconsole.log<space><esc>
nnoremap pl ^Daconsole.log<space>"<esc>pa",<space><esc>p\

" insert/remove this.
nmap th bithis.<esc>
nmap dt bdt.x
nmap @ bi@<esc>
nmap d@ b<left>x

nmap $ bi$(<esc>ea)<esc>




map  ]#   :call PythonCommentSelection()<CR>
vmap ]#   :call PythonCommentSelection()<CR>
map  [#   :call PythonUncommentSelection()<CR>
vmap [#   :call PythonUncommentSelection()<CR>



" Comment out selected lines
" commentString is inserted in non-empty lines, and should be aligned with
" the block
function! PythonCommentSelection()  range
  let commentString = "#"
  let cl = a:firstline
  let ind = 1000    " I hope nobody use so long lines! :)

  " Look for smallest indent
  while (cl <= a:lastline)
    if strlen(getline(cl))
      let cind = indent(cl)
      let ind = ((ind < cind) ? ind : cind)
    endif
    let cl = cl + 1
  endwhile
  if (ind == 1000)
    let ind = 1
  else
    let ind = ind + 1
  endif

  let cl = a:firstline
  execute ":".cl
  " Insert commentString in each non-empty line, in column ind
  while (cl <= a:lastline)
    if strlen(getline(cl))
      execute "normal ".ind."|i".commentString
    endif
    execute "normal \<Down>"
    let cl = cl + 1
  endwhile
  execute "normal \<Up>"
endfunction

" Uncomment selected lines
function! PythonUncommentSelection()  range
  " commentString could be different than the one from CommentSelection()
  " For example, this could be "# \\="
  let commentString = "#"
  let cl = a:firstline
  while (cl <= a:lastline)
    let ul = substitute(getline(cl),
             \"\\(\\s*\\)".commentString."\\(.*\\)$", "\\1\\2", "")
    call setline(cl, ul)
    let cl = cl + 1
  endwhile
endfunction







