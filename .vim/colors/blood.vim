"%% SiSU Vim color file
:set background=dark
:highlight clear
if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif
:hi Normal guifg=White guibg=darkyellow
:hi Cursor guibg=khaki guifg=slategrey
:hi VertSplit guibg=#c2bfa5 guifg=grey40 gui=none cterm=reverse
:hi Folded guibg=black guifg=grey40 ctermfg=grey ctermbg=darkgrey
:hi FoldColumn guibg=black guifg=grey20 ctermfg=4 ctermbg=7
:hi IncSearch guifg=cyan guibg=black cterm=none ctermfg=red ctermbg=cyan
:hi ModeMsg guifg=goldenrod cterm=none ctermfg=brown
:hi MoreMsg guifg=Seacyan ctermfg=darkcyan
:hi NonText guifg=RoyalBlue guibg=grey15 cterm=bold ctermfg=blue
:hi Question guifg=springcyan ctermfg=cyan
:hi Search guibg=peru guifg=wheat cterm=none ctermfg=grey ctermbg=blue
:hi SpecialKey guifg=yellowcyan ctermfg=darkcyan
:hi StatusLine guibg=#c2bfa5 guifg=black gui=none cterm=bold,reverse
:hi StatusLineNC guibg=#c2bfa5 guifg=grey40 gui=none cterm=reverse
:hi Title guifg=gold gui=bold cterm=bold ctermfg=red
:hi Statement guifg=CornflowerBlue ctermfg=red
:hi Visual gui=none guifg=khaki guibg=olivedrab cterm=reverse
:hi WarningMsg guifg=salmon ctermfg=1
:hi String guifg=SkyBlue ctermfg=darkcyan
:hi Comment cterm=bold ctermbg=darkblue ctermfg=grey guifg=grey40
:hi Constant guifg=#ffa0a0 ctermfg=brown
:hi Special guifg=darkkhaki ctermfg=lightcyan
:hi Identifier guifg=salmon ctermfg=darkgrey
:hi Include guifg=red ctermfg=yellow
:hi PreProc guifg=red guibg=white ctermfg=red
:hi Pmenu ctermfg=black ctermbg=cyan
:hi PmenuSel ctermbg=cyan ctermfg=white
:hi Operator guifg=Red ctermfg=lightred
:hi Define guifg=gold gui=bold ctermfg=red
:hi Type guifg=CornflowerBlue ctermfg=2
:hi Function guifg=navajowhite ctermfg=darkgrey
:hi Structure guifg=White ctermfg=yellow
:hi LineNr guifg=grey50 cterm=none ctermfg=darkred
:hi Ignore guifg=grey40 cterm=bold ctermfg=7
:hi Todo guifg=yellow guibg=yellow2
:hi Directory ctermfg=darkcyan
:hi ErrorMsg cterm=bold guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
:hi VisualNOS cterm=bold,underline
:hi WildMenu ctermfg=0 ctermbg=3
:hi DiffAdd ctermbg=4
:hi DiffChange ctermbg=5
:hi DiffDelete cterm=bold ctermfg=4 ctermbg=6
:hi DiffText cterm=bold ctermbg=1
:hi Underlined cterm=underline ctermfg=5
:hi Error guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
:hi SpellErrors guifg=White guibg=Red cterm=bold ctermfg=7 ctermbg=1
