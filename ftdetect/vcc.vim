" Must override VCC detection after C
au BufRead,BufNewFile *.c,[^.]* if match(getline(1).getline(2).getline(3),'# *include *["<]\(vcc\|verification\|vcc2test\)\.h[">]',0) >= 0 | set filetype=vcc | endif
