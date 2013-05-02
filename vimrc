autocmd BufNewFile,BufRead *.bpl setfiletype boogie
"autocmd BufRead,BufNewFile *.ps1 setfiletype ps1
autocmd BufRead,BufNewFile *.dgml setfiletype xml

set formatoptions+=ln
set guioptions=
set nojoinspaces
set tags=./tags,tags,tags;
set wildmode=longest,list:longest,list:full

" Some syntax file options, cf. :help syn-file-remarks
let g:c_space_errors=1
let g:c_no_trail_space_error=1 " :|
let g:c_syntax_for_h=1
let g:perl_fold=1
let g:perl_fold_blocks=1
let g:ruby_fold=1
let g:tex_fold_enabled=1
let g:xml_syntax_folding=1

" Swap file (note: from https://github.com/tpope/vim-sensible.git)
let s:dir = has('win32') ? '$APPDATA/Vim' : match(system('uname'), "Darwin") > -1 ? '~/Library/Vim' : empty($XDG_DATA_HOME) ? '~/.local/share/vim' : '$XDG_DATA_HOME/vim'
if isdirectory(expand(s:dir))
  if &directory =~# '^\.,'
    let &directory = expand(s:dir) . '/swap//,' . &directory
  endif
  if &backupdir =~# '^\.,'
    let &backupdir = expand(s:dir) . '/backup//,' . &backupdir
  endif
  if exists('+undodir') && &undodir =~# '^\.\%(,\|$\)'
    let &undodir = expand(s:dir) . '/undo//,' . &undodir
  endif
endif

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
