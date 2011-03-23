autocmd BufNewFile,BufRead *.bpl setfiletype boogie
autocmd BufRead,BufNewFile *.ps1 setfiletype ps1
autocmd BufRead,BufNewFile *.fs set filetype=fs
" (overrides forth)

set guioptions=

runtime vimrc.local
