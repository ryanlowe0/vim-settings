

inoremap ,, <right>, 
set list
set listchars=tab:\..   " highlight tab characters


" prefix print/with label
nmap pr ^iputs<space><esc>
nmap pl bveyiputs<space>'<esc>pa',<space><esc>


" shifting in insert mode
imap << <esc>mM<<`M3<left>i
imap >> <esc>mM>>`M4<right>a


" insert/remove self.
nmap se biself.<esc>
nmap ds bdt.x

nmap @ bi@<esc>
nmap d@ b<left>x


map  ]#   :call CommentSelection()<CR>
vmap ]#   :call CommentSelection()<CR>
map  [#   :call UncommentSelection()<CR>
vmap [#   :call UncommentSelection()<CR>



" Comment out selected lines
" commentString is inserted in non-empty lines, and should be aligned with
" the block
function! CommentSelection()  range
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
function! UncommentSelection()  range
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



