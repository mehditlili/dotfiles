"============================================================================
"File:        roslint_cpplint.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  LCD 47 <lcd047 at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

if exists('g:loaded_syntastic_cpp_roslint_cpplint_checker')
    finish
endif
let g:loaded_syntastic_cpp_roslint_cpplint_checker = 1

if !exists('g:syntastic_cpp_roslint_cpplint_thres')
    let g:syntastic_cpp_roslint_cpplint_thres = 5
endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_cpp_roslint_cpplint_GetLocList() dict
    let makeprg = self.makeprgBuild({ 'args': 'roslint cpplint --verbose=3' })

    let errorformat = '%A%f:%l:  %m [%t],%-G%.%#'

    let loclist = SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'subtype': 'Style',
        \ 'returns': [0, 1] })

    " change error types according to the prescribed threshold
    for e in loclist
        let e['type'] = e['type'] < g:syntastic_cpp_roslint_cpplint_thres ? 'W' : 'E'
    endfor

    return loclist
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'cpp',
    \ 'name': 'roslint_cpplint',
    \ 'exec': 'rosrun'})

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
