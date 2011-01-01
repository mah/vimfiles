" Author: Mark Hillebrand
if exists("b:current_syntax")
	finish
endif
syn region bplComment start="//" end="$"
syn region bplComment start="/\*" end="\*/"
syn keyword bplKeyword bool int ref name any type const function returns axiom var procedure requires modifies ensures implementation goto return assert assume havoc call
" Boogie2 (?):
syn keyword bplKeyword free
hi def link bplComment Comment
hi def link bplKeyword Keyword

setlocal iskeyword=a-z,A-Z,48-57,`,\\,',~,#,$,_,.,?,^
" 48-58 would include : which is wrong in quantifiers TODO cross-check with
" Boogie manual
