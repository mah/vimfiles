if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  " Overrides detection of *.fs as Forth filetype
  autocmd BufRead,BufNewFile *.fs setfiletype fs
augroup END
