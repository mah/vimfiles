if exists("current_compiler")
  finish
endif
let current_compiler = "vcc"
if exists(":CompilerSet") != 2
  command -nargs=* CompilerSet setlocal <args>
endif

if has("win32unix")
  set path+=/cygdrive/c/Program\\\ Files\\\ (x86)/Microsoft\\\ Research/Vcc/Headers
elseif has("win32")
  set path+=c:\Program\\\ Files\\\ (x86)\Microsoft\\\ Research\Vcc\Headers
endif
" todo other options?

" TODO this pattern can probably be simplified, i.e., no multiline needed?
CompilerSet errorformat=
  \%-G%f(%l\\,%c)\ :\ warning\ VC0015:\ %m,
  \%-G%f(%l\\,%c)\ :\ warning\ VC0018:\ %m,
  \%-G%f(%l\\,%c)\ :\ warning\ VC0037:\ %m,
  \%f(%l\\,%c)\ :\ %m,
  \%+ELoop\ entry\ invariant\ '%.%#,
  \%+EAssertion\ '%.%#,
  \%ZLocation\ of\ assertion:\ %f(%l),
  \%+ECall\ '%.%#,
  \%+EPost\ condition\ '%.%#,
  \%+ELoop\ entry\ invariant\ '%.%#,
  \%+EAssertion\ '%.%#,
  \%+CLocation\ of\ post\ condition:\ %.%#,
  \%+CLocation\ of\ call:\ %f(%l),
  \%+C%\\(Location%\\)%\\@!%.%#,
  \%ZLocation\ of\ assertion:\ %f(%l),
  \%+ZLocation\ of\ pre\ condition:\ %.%#,
  \%ZLocation\ of\ return\ statement:\ %f(%l)

" Notes:
" 1. Multi-line pattern with possibly 2 lines only have to be specified twice
"    (e.g., Loop entry invariants).
" 2. The pattern \%+C%\\(Location%\\)%\\@!%.%# (which translates to
"    ^\(Location\)\@!.*) matched non-ending continuation lines, which are
"    identified with a zero-width look-ahead for 'Location'.
CompilerSet makeprg=vcc\ %
