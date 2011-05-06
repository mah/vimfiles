autocmd BufNewFile,BufRead *.bpl setfiletype boogie
autocmd BufRead,BufNewFile *.ps1 setfiletype ps1

set formatoptions+=ln
set guioptions=
set nojoinspaces

runtime vimrc.local
