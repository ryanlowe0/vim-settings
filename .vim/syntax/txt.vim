" Vim syntax file
" Language:	Text
" Maintainer:	Ryan Lowe

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" colorize ascii chess board. One side uppercase, the other lower
syn match chessSideA	"\<[PRNBQK]\>"
syn match chessSideB	"\<[prnbqk]\>"
syn match chessSpace	"^[.]\| [.]"


syn match titleLine     "^[A-Z][A-Z?.]*[a-z.]*\( [A-Z][a-z?.]*\| a\(nd\|[nst]\)\?\| or\| vs[.]\?\)* *$"

syn match bolded    "\*[A-Za-z0-9_.-]*\*"
syn match line	    "^---*"

syn match bulletPoint   "^\* "
syn match diffOnly	"^Only in .*"
syn match diffIdentical	"^Files .* and .* are identical$"
syn match diffDiffer	"^Files .* and .* differ$"
syn match diffBDiffer	"^Binary files .* and .* differ$"
syn match diffIsA	"^File .* is a .* while file .* is a .*"
syn match diffNoEOL	"^No newline at end of file .*"
syn match diffCommon	"^Common subdirectories: .*"

syn match diffChanged	"^! .*"

syn match diffSubname	" @@..*"ms=s+3 contained
syn match diffLine	"^@.*" contains=diffSubname
syn match diffLine	"^\<\d\+\>.*"
syn match diffLine	"^\*\*\*\*.*"

"Some versions of diff have lines like "#c#" and "#d#" (where # is a number)
syn match diffLine	"^\d\+\(,\d\+\)\=[cda]\d\+\>.*"

syn match diffFile	"^diff.*"
syn match diffFile	"^+++ .*"
syn match diffFile	"^Index: .*$"
syn match diffFile	"^==== .*$"
syn match diffOldFile	"^\*\*\* .*"
syn match diffNewFile	"^--- .*"

syn match diffComment	"^#.*"


syn match numbered      "^\d*[.]\>.*"

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link diffOldFile		diffFile
hi def link diffNewFile		diffFile
hi def link diffFile		Type
hi def link diffOnly		Constant
hi def link diffIdentical	Constant
hi def link diffDiffer		Constant
hi def link diffBDiffer		Constant
hi def link diffIsA		Constant
hi def link titleLine		Constant
hi def link diffNoEOL		Constant
hi def link diffCommon		Constant
hi def link bulletPoint		Function
hi def link chessSideA		LineNr
hi def link chessSideB		Special
hi def link chessSpace		Gray
hi def link diffChanged		PreProc
hi def link diffLine		Comment
hi def link diffSubname		PreProc
hi def link diffComment		Comment
hi def link numbered		Comment
hi def link bolded		Structure
hi def link line		Title

let b:current_syntax = "diff"

" vim: ts=8 sw=2
