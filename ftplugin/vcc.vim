compiler vcc
" Copied from taglist.vim's s:tlist_def_c_settings
let tlist_vcc_settings = 'c;d:macro;g:enum;s:struct;u:union;t:typedef;v:variable;f:function'
let tlist_vcc_ctags_args = '-I' . join([
  \ 'always+',
  \ 'claimp+',
  \ 'ensures+',
  \ 'in_group+',
  \ 'invariant+',
  \ 'maintains+',
  \ 'out_param+',
  \ 'reads+',
  \ 'requires+',
  \ 'returns+',
  \ 'spec',
  \ 'vcc+',
  \ 'vcc_attr+',
  \ 'writes+',
  \ ],',')
