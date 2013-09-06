

:call TextEnableCodeSnip('sql', "sql = '''", "'''", 'SpecialComment')
:call TextEnableCodeSnip('sql', 'sql = \"\"\"', '\"\"\"', 'SpecialComment')


" set ; = : since : are WAY more frequent in python code
inoremap ; :
inoremap ;; <right>:<cr><left> 
inoremap ,, <right>, 
inoremap <leader>; ;
set list
set listchars=tab:\..   " highlight tab characters


nmap exit osys.exit()<esc>

nmap imp ^iimport<space><esc>

nmap tool magg<down><down>ofrom tools import *<esc>`a

" common main line
nmap main Oif __name__ == '__main__':<cr>

" create a def <current_word>(): at 1st blank line above
nnoremap def bvey{O<cr>def<space><esc>pa():<left><left>

" prefix print/with label
nmap pr ^iprint<space><esc>
nmap pl bveyiprint<space>'<esc>pa',<space><esc>
nnoremap PL ^v$<left>cprint<space>'<esc>pa =',<space><esc>p
nnoremap LA ^v$<left>cprint<space>label('<esc>pa',<space><esc>pa)<esc>

" wrap word/line pprint
nnoremap ppr ciwpprint.pprint()<esc><left>p
nnoremap PPR ^ipprint.pprint(<esc>A)<esc>

" wrap word/line with str()
nnoremap str ciwstr()<esc><left>p
nnoremap STR ^istr(<esc>A)<esc>

nnoremap enu ciwenumerate()<esc><left>p?for<cr>4lii, <esc>:nohlsearch<cr>$

" wrap line with try/except
nnoremap try Otry:<esc><down>>>o<backspace>except Exception, e:<cr>
nnoremap try2 Otry:<esc><down>>><down>>>o<backspace>except Exception, e:<cr>

imap try<cr> try:<cr><backspace>except:<esc>O

imap A( .append()
inoremap R( .replace('', '')<esc>5<left>i
imap S> self.
imap IN( def __init__(self, )<left>
imap @P @property<cr>
imap TT True
imap FF False
imap NN None
inoremap (" ('')<left><left>

" shifting in insert mode
imap << <esc>mM<<`M3<left>i
imap >> <esc>mM>>`M4<right>a


nnoremap pdb oimport pdb;pdb.set_trace()<esc>

nnoremap lr ciWlightred()<esc><left>p
nnoremap lg ciWlightgreen()<esc><left>p
nnoremap ly ciWlightyellow()<esc><left>p
nnoremap lb ciWlightblue()<esc><left>p
nnoremap lm ciWlightmagenta()<esc><left>p
nnoremap lc ciWlightcyan()<esc><left>p
nnoremap dr ciWdarkred()<esc><left>p
nnoremap dg ciWdarkgreen()<esc><left>p
nnoremap dy ciWdarkyellow()<esc><left>p
nnoremap db ciWdarkblue()<esc><left>p
nnoremap dm ciWdarkmagenta()<esc><left>p
nnoremap dc ciWdarkcyan()<esc><left>p

vnoremap ''' C'''<cr>'''<up><esc>p
vnoremap """ C"""<cr>"""<up><esc>p

" insert/remove self.
nmap se biself.<esc>
nmap ds bdt.x

" misc
" ----

" delete current and join next line without extra space
nmap DJ DJx


" TODO: when using a mapped function (like maybe), check if its been
" imported. If not, do so in addition to applying it. Opposite on remove.



