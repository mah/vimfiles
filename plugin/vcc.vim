function! s:Verify()
    let l:oldmakeprg = &makeprg
    let &makeprg = "vcc /detectsyntax %"
    make
    let &makeprg = l:oldmakeprg
endfunction

function! s:VerifyFunction()
    " Make sure tags are generated...
    let l:oldmakeprg = &makeprg
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
            let l:oldmakeprg = &makeprg
            let &makeprg = "vcc /detectsyntax % /f:" . l:fn
            make
        endif
        let &makeprg = l:oldmakeprg
    endif
endfunction

command! -nargs=0 Verify call s:Verify()
command! -nargs=0 VerifyFunction call s:VerifyFunction()
