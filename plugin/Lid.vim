" Derived from https://github.com/pydave/vim-ack.git
"
" TODO warn if s:prg not defined
" TODO check for AsyncCommand?
if exists('g:loaded_lid')
    finish
endif
let g:loaded_lid = 1

let s:save_cpo = &cpo
set cpo&vim

if exists('g:lid_prg')
  let s:prg = g:lid_prg
elseif executable('lid')
  let s:prg = 'lid'
endif

function! Lid(command, args)
  let cmd = s:prg . " --result=grep " . a:args
  let format = "%f:%l:%m"
  let title = '[Found: %s] Lid ' . substitute(a:args, '%', '%%', 'g')
  let env = call(a:command, [format, title])
  call asynccommand#run(cmd, env)
endfunction

command! -nargs=+ -complete=file Lid     call Lid("asynchandler#quickfix",     <q-args>)
command! -nargs=+ -complete=file LidAdd  call Lid("asynchandler#quickfix_add", <q-args>)
command! -nargs=+ -complete=file LLid    call Lid("asynchandler#loclist",      <q-args>)
command! -nargs=+ -complete=file LLidAdd call Lid("asynchandler#loclist_add",  <q-args>)

let &cpo = s:save_cpo
