



nmap ]# :call SQLCommentSelection()<cr>
nmap [# :call SQLUnCommentSelection()<cr>
vmap ]# :call SQLCommentSelection()<cr>
vmap [# :call SQLUnCommentSelection()<cr>



function! SQLCommentSelection()  range
  let commentString = "-- " 
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


function! SQLUncommentSelection()  range
  let commentString = "-- " 
  let cl = a:firstline
  while (cl <= a:lastline)
    let ul = substitute(getline(cl),
             \"\\(\\s*\\)".commentString."\\(.*\\)$", "\\1\\2", "") 
    call setline(cl, ul) 
    let cl = cl + 1 
  endwhile
endfunction

