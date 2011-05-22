if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

runtime! syntax/c.vim
unlet b:current_syntax

hi def link vccOuter Special

"\ as_array
"\ ispure
syn keyword vccOuter 
  \ maintains0
  \ unwrap_dom
  \ wrap_dom
  \ allocates
  \ always
  \ assert
  \ assume
  \ atomic
  \ atomic_op
  \ atomic_read
  \ axiom
  \ backing_member
  \ begin_update
  \ block
  \ bv_lemma
  \ by_claim
  \ claimp
  \ deep_unwrap
  \ def_group
  \ ensures
  \ expose
  \ frameaxiom
  \ from_bytes
  \ generic_instance
  \ giveup_closed_owner
  \ giveup_owner
  \ hint
  \ in_group
  \ invariant
  \ inv_group
  \ isadmissibilitycheck
  \ join_arrays
  \ known
  \ maintains
  \ member_name
  \ no_admissibility
  \ nospeccast
  \ on_unwrap
  \ out_param
  \ public_writes
  \ reads
  \ requires
  \ returns
  \ set_closed_owner
  \ set_closed_owns
  \ set_owner
  \ set_owns
  \ skinny_expose
  \ skipverification
  \ spec
  \ speccast
  \ speccast_uc
  \ speconly
  \ SPEC_TYPE
  \ split_array
  \ to_bytes
  \ unchecked
  \ unclaim
  \ union_reinterpret
  \ unwrap
  \ unwraps
  \ usevccoptions
  \ vcc
  \ vcc_attr
  \ vcs_force_splits
  \ vcs_keep_going
  \ weak_out_param
  \ wrap
  \ wraps
  \ writes

let b:current_syntax="vcc"
