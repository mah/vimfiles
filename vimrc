autocmd BufNewFile,BufRead *.bpl setfiletype boogie
autocmd BufRead,BufNewFile *.ps1 setfiletype ps1
autocmd BufRead,BufNewFile *.dgml setfiletype xml

set formatoptions+=ln
set guioptions=
set nojoinspaces
set tags=./tags,tags,tags;

" Some syntax file options, cf. :help syn-file-remarks
let g:c_space_errors=1
let g:c_no_trail_space_error=1 " :|
let g:c_syntax_for_h=1
let g:perl_fold=1
let g:perl_fold_blocks=1
let g:ruby_fold=1
let g:tex_fold_enabled=1
let g:xml_syntax_folding=1

" Start pathogen
call pathogen#infect()

fun! LucidaConsole(...)
  let points = 16
  if a:0 > 0
      let points = a:1
  endif
  exe "set guifont=Lucida_Console:h" . points . ":cANSI"
endfun

runtime vimrc.local
