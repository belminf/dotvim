" Fuzzy AG search

" Ref: https://github.com/jhawthorn/fzy
function! FzyCommand(choice_command, vim_command, post_cmd, fzy_cmd)
  try
    let output = system(a:choice_command . " | " . a:fzy_cmd . " | " . a:post_cmd)
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
  if executable('fzy')
    call FzyCommand(a:search_cmd . " " . a:needle, a:vim_cmd, a:post_cmd, "fzy -p 'Narrow Search: '")
  elseif executable('pick')
    call FzyCommand(a:search_cmd . " " . a:needle, a:vim_cmd, a:post_cmd, "pick")
  else
    echoerr 'Could not find `fzy` or `pick`'
  endif
endfunction

command! -nargs=* FuzzyGrep :call FzySearchCmd('e', 'ag --vimgrep --smart-case', 'awk -v OFS=" " -F":" "{ line=\"+\" \$2; print line, \$1 }"', <f-args>)
nnoremap \ :FuzzyGrep 
