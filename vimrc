autocmd BufNewFile,BufRead *.bpl setfiletype boogie
autocmd BufRead,BufNewFile *.ps1 setfiletype ps1

set formatoptions+=ln
set guioptions=
set nojoinspaces

" Some syntax file options, cf. :help syn-file-remarks
let g:c_space_errors=1
let g:c_syntax_for_h=1
let g:perl_fold=1
let g:perl_fold_blocks=1
let g:ruby_fold=1
let g:tex_fold_enabled=1
let g:xml_syntax_folding=1

runtime vimrc.local
