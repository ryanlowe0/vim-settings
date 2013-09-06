
if exists('b:did_indent') && b:did_indent
  " be kind. allow users to override this. Does it work?
  finish
endif

setlocal indentexpr=scss_indent#GetIndent(v:lnum)




nmap ]# ^i/*<esc>$<leader>p*/<esc>
vmap ]# dO/*<cr><backspace>/<left><left><left><del><up><esc>p

nmap [# ^xx$xx


" nnoremap [# :s;\v/\*(.*)\*/;\1;<cr>\|:nohlsearch<cr>
 



