" Fuzzy AG search

" Ref: https://github.com/jhawthorn/fzy
function! FzyCommand(choice_command, vim_command, post_cmd, fzy_options)
  try
    let output = system(a:choice_command . " | fzy " . a:fzy_options . " | " . a:post_cmd)
    echom output
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

function! FzySearchCmd(vim_cmd, search_cmd, post_cmd, needle)
    call FzyCommand(a:search_cmd . " " . a:needle, a:vim_cmd, a:post_cmd, "-p 'Narrow Search: '")
endfunction

command! -nargs=* FuzzyGrep :call FzySearchCmd('e', 'ag --vimgrep --smart-case', 'awk -v OFS=" " -F":" "{ line=\"+\" \$2; print line, \$1 }"', <f-args>)
nnoremap \ :FuzzyGrep 
