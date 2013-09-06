
nmap $ bi$(<esc>ea)<esc>
nmap " bi"<esc>ea"<esc>
nmap ' bi'<esc>ea'<esc>
nmap d" bXe<right>x
nmap d' bXe<right>x

nnoremap 1<right> x$p
nnoremap 2<right> 2x$p
nnoremap 3<right> 3x$p

nmap pr Biconsole.info(<esc>ea);<esc>

" insert self.
nmap se biself.<esc>
" insert this.
nmap th bithis.<esc>
" remove xxx. prefix
nnoremap dx bdt.x

map  ]#   :call CommentSelection()<CR>
vmap ]#   :call CommentSelection()<CR>
map  [#   :call UncommentSelection()<CR>
vmap [#   :call UncommentSelection()<CR>


" Comment out selected lines
" commentString is inserted in non-empty lines, and should be aligned with
" the block
function! CommentSelection()  range
  let commentString = "//" 
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
endfunction

" Uncomment selected lines
function! UncommentSelection()  range
  " commentString could be different than the one from CommentSelection()
  " For example, this could be "# \\="
  let commentString = "//" 
  let cl = a:firstline
  while (cl <= a:lastline)
    let ul = substitute(getline(cl),
             \"\\(\\s*\\)".commentString."\\(.*\\)$", "\\1\\2", "") 
    call setline(cl, ul) 
    let cl = cl + 1 
  endwhile
endfunction




