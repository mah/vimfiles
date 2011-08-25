function! s:VerifyInternal(options)
    let l:oldmakeprg = &makeprg
    let &makeprg = 'vcc /detectsyntax ' . a:options
    make
    let &makeprg = l:oldmakeprg
endfunction

" Whole file
function! s:Verify()
    call s:VerifyInternal('"%"')
endfunction

" Current file
function! s:VerifyThis()
    call s:VerifyInternal('"%" /loc:"' . expand('%') . ':' . line('.') . '"')
endfunction

" Current file as suite
function! s:VerifySuite()
    call s:VerifyInternal('"%" /s')
endfunction

" Function (via ctags)
function! s:VerifyFunction()
    " Make sure tags are generated...
    if !exists(":Tlist")
        echo "Taglist plugin not present? Cannot look-up tag..."
    else
        silent TlistAddFiles %
        let l:fn = Tlist_Get_Tagname_By_Line()
        if l:fn == ""
            echo "Cannot find a tag"
        else
            " TODO even if non-empty, these tags do not match VCC /f arguments,
            " e.g., typedef struct Match { ... } NoMatch;
            call s:VerifyInternal('"%" /f:' . l:fn)
        endif
    endif
endfunction

command! -nargs=0 Verify call s:Verify()
command! -nargs=0 VerifyThis call s:VerifyThis()
command! -nargs=0 VerifyFunction call s:VerifyFunction()
command! -nargs=0 VerifySuite call s:VerifySuite()
