set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set hlsearch incsearch
set ignorecase smartcase
set hidden
set backspace=indent,eol,start
set nolazyredraw
set scrolloff=10
set showcmd showmode
set number
set magic
set ruler
set viminfo='10,\"100,:50,%,h
set completeopt=longest,menuone
set wildmenu
set wildmode=list:longest,full
" searches default to global replace - /g re-mapped to "first occurrence"
set gdefault


" Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" Restore cursor position when re-entering a file
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END


filetype on
filetype plugin on
filetype indent on

syntax on

colorscheme myboard
" colorscheme blood

"""""""""""""""" yank / paste """"""""""""""""
" hold shift with right-click for xterm paste with mouse=a
"set mouse=a         " mouse can control visual, works in putty not mac term

" set paste mode on/numbers off with <leader>p. undo with <esc>
au InsertLeave * set number | set nopaste
nnoremap <leader>p :set nonumber<cr>:set paste<cr>a
inoremap <leader>p <esc>:set nonumber<cr>:set paste<cr>a
"nnoremap v :set mouse=a<cr>v

" yank to end of line (excluding \n)
nmap Y v$<left>y
" paste over the rest of the line
nmap P "_Dp`.<down>

" paste buffer in command / search
cmap <leader>p <c-r>"

nmap <space> i<space><esc>

" save and quit from insert mode too
inoremap ZZ <esc>:wq<cr>
inoremap WW <esc>:w<cr>a
inoremap QQ <esc>:q!<cr>
nnoremap WW :w<cr>
nnoremap QQ :q!<cr>
nnoremap s * 
nnoremap S # 
nmap # ]#
vmap # ]#
nmap * [#
vmap * [#


" list buffers and set up for selecting the buffer number
nnoremap buf :buffers<cr>:buffer<space>
" make switch to previous buffer <c-^> cycle rather than toggle
nnoremap <c-^> :bprev<cr>
nnoremap :bq :bd<cr> 

" fix menu to show matches as you type rather than auto-selecting the 1st

" make ; = : so no shift key required!
nmap ; :

" SEARCH

" use PERL-style regex by default
nnoremap / /\v
nnoremap ;/ :%s;\v;;<left><left>
cmap ;\ \(\)<left><left>

" clear search highlight
nmap <silent> ./ :nohlsearch<cr>


vnoremap <leader>s :sort<cr>

nnoremap j gj
nnoremap k gk

" strip trailing whitespace
nnoremap \W :%s/\s\+$//<cr>" :let @/=''<cr>

" no shift required
nmap ;qq :q!


" put cursor in middle of delimiters
inoremap () ()<left>
inoremap (): ():<cr>
inoremap [] []<left>
inoremap {} {}<left>
inoremap ()<space> ()<space>
inoremap []<space> []<space>
inoremap {}<space> {}<space>
inoremap ()<cr> ()<cr>
inoremap []<cr> []<cr>
inoremap {}<cr> {}<cr>
inoremap "" ""<left>
inoremap '' ''<left>
inoremap '', '',<space>
inoremap "", "",<space>
inoremap ''' '''
inoremap """ """


" Default commenting with #

map  ]#   :call CommentSelection()<CR>
vmap ]#   :call CommentSelection()<CR>
map  [#   :call UncommentSelection()<CR>
vmap [#   :call UncommentSelection()<CR>



" swap comment with adjacent line
nmap ]<down> [#<down>]#
nmap ]<up> [#<up>]#

" (un)wrap with quotes
nnoremap '' ciw'<esc>pa'<esc>
nnoremap "" ciw"<esc>pa"<esc>
nnoremap d' ma?'<cr>x/'<cr>x\|:nohlsearch<cr>`a
nnoremap d" ma?"<cr>x/"<cr>x\|:nohlsearch<cr>`a
" nnoremap '' ?^.*' ? ciw'<esc>pa'<esc> : ma?'<cr>x/'<cr>x\|:nohlsearch<cr>`a
" nnoremap '' ?^.*' ? 'ciw\'<lt>esc>pa\'<lt>esc>' : 'ma?\'<lt>cr>x/\'<lt>cr>x\|:nohlsearch<lt>cr>`a'

nnoremap 1<right> x$p
nnoremap 2<right> 2x$p
nnoremap 3<right> 3x$p


" underline current line
nnoremap -- yyp:s;\.;-;<cr>:nohlsearch<cr>


" match indent for rest of block without highlighting
nmap ]= V]e=

" nnoremap ! :!
inoremap !! <esc>:r!
nnoremap @ :Cmd<space>
vnoremap @ :Cmd<space>

" calls cmd.py
func! CmdWithMeta(arg)
    " do meaningless edit and erase it so if cmd is undone, the cursor pos
    " will not be lost
    let r = line('.') - 1
    let c = col('.')
    " let vs = [a:firstline, a:lastline]
    norm ix
    norm x
    " save cursor and window pos
    norm mkHml
    silent! exec '%!cmd "' . join([a:arg . '"', r, c], ' ')
    " restore cursor and window pos
    norm `lzt`k
    " TODO cant change the cursor position using external script
    " possible solution: figure how to get return val from script
    " including new cursor pos
endfunc
command! -nargs=1 Cmd call CmdWithMeta(<q-args>)
" command! -nargs=1 Cmd call WithCursorLine('CmdWithMeta', <q-args>) 


nnoremap ! q:i

autocmd BufNewFile,BufRead *.txt set filetype=txt
autocmd BufNewFile,BufRead *.opf set filetype=xml
autocmd BufNewFile,BufRead *.ncx set filetype=xml
autocmd BufNewFile,BufRead *.cu set filetype=cuda
autocmd BufNewFile,BufRead *.haml set filetype=haml
"autocmd BufNewFile,BufRead *.scss set filetype=sass
autocmd BufNewFile,BufRead *.conf set filetype=conf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coffeescript
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

func! g:CompileCoffee()
    silent !coffee -c %
endfunc
autocmd BufWritePost *.coffee call g:CompileCoffee()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python stuff

" tab completion via prediction
let g:pydiction_location = '/home/rlowe/pydiction/complete-dict'
" TODO: make post dot. Tab show matches in the previous name space

" code setup
" py from vim import *
" py buf = current.buffer


" add execute permissions to new .py files
func! g:ChmodOnWrite()
    set autoread
    silent !chmod 775 %
    set autoread<       " restore to global setting
endfunc
autocmd BufWritePost *.py call g:ChmodOnWrite()


" add shebang line
au BufEnter *.py if getline(1) == "" | :call setline(1, "#!/usr/bin/env python") | endif

" save and run current program with ctr-e
au BufEnter *.py map <buffer> <c-e> :w<cr>:!/usr/bin/env python -u % <cr>
au BufEnter *.py imap <buffer> <c-e> <esc>:w<cr>:!/usr/bin/env python -u % <cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" NOTES
"
"
" [[ and ]] go back and forward to python def/class
" { and } go back and forward to blank lines
" ]P pastes at current indent level
" Gd goto def (actually first word match)
" * and # goto next/pref occurrence of word under cursor
" ]> ]< indent/decent block of code (from plug-in)
" ]# [# comment/uncomment vis highlighted code (from plug-in)
" ]D ]c highlight current func/class (from plugin)
" ]v highlight current block (from plugin)
" gg and G goto beginning/end of file
"
"
"
"



function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)


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

" Allows multiple language highlighting in same file
function! TextEnableCodeSnip(filetype, start, end, textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction


au BufEnter *.html set tabstop=2 | set softtabstop=2 | set shiftwidth=2
au BufEnter *.haml set tabstop=2 | set softtabstop=2 | set shiftwidth=2
au BufEnter *.css set tabstop=2 | set softtabstop=2 | set shiftwidth=2
au BufEnter *.scss set tabstop=2 | set softtabstop=2 | set shiftwidth=2
au BufEnter *.xml set tabstop=2 | set softtabstop=2 | set shiftwidth=2
au BufEnter *.opf set tabstop=2 | set softtabstop=2 | set shiftwidth=2
au BufEnter *.ncx set tabstop=2 | set softtabstop=2 | set shiftwidth=2
au BufEnter *.rb set tabstop=2 | set softtabstop=2 | set shiftwidth=2
au BufEnter *.js set tabstop=2 | set softtabstop=2 | set shiftwidth=2
au BufEnter *.coffee set tabstop=2 | set softtabstop=2 | set shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

