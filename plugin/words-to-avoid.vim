" Setup the syntax highlighting
highlight TechWordsToAvoid ctermbg=red ctermfg=white guibg=red guifg=white

" Look for matches and highlight them
function! MatchTechWordsToAvoid()
    " Only match if the variable was set
    if !exists('b:techWordsToAvoidMatching')
        return
    endif

    " Highlight matches
    match TechWordsToAvoid /\c\<\(obviously\|basically\|simply\|of\scourse\|clearly\|\(^\|\W\)\@<=just\(\W\)\@=\(\W\)\@<!\|everyone\sknows\|however\|so,\|easy\)\>/
endfunction

" Set the flag to enable matches on supported filetypes
autocmd FileType markdown,gitcommit let b:techWordsToAvoidMatching=1

" Run the matcher function on various events
autocmd FileType * call MatchTechWordsToAvoid()
autocmd BufWinEnter * call MatchTechWordsToAvoid()
autocmd InsertEnter * call MatchTechWordsToAvoid()
autocmd InsertLeave * call MatchTechWordsToAvoid()

" Clean up after ourself
autocmd BufWinLeave * call clearmatches()
