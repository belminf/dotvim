" Key mapping
let mapleader=","
"" Maintains cursor pos when switching buffer
au BufEnter * silent! normal! g`""`
"" Move buffers
nmap <silent> <Tab><Tab> :bn<CR>
nmap <silent> <S-Tab><S-Tab> :bp<CR>
"" CtrlP
map <silent><Space> :CtrlP<CR>
"" Clear highlighting
map <silent><F3> :nohl<CR>
"" Toggle number
map <silent><F4> :set number!<CR>
"" AG search
nmap ' :Ack<Space>
"" Browse
map <silent> - :NERDTreeToggle<CR>
"" Selection
nmap ` <Plug>(wildfire-quick-select)
"" Motion
nmap = <Plug>(easymotion-s2)
vmap = <Plug>(easymotion-s2)
"" Comment out a line or block
nmap # <Plug>NERDCommenterToggle
xmap # <Plug>NERDCommenterToggle
"" fuzzysearch
nmap \ :FuzzyGrep 


"" Go to next
nmap <silent>{ :cb<CR>
nmap <silent>} :cn<CR>

" Toggle the quickfix window.
" Src: http://vim.wikia.com/wiki/Toggle_to_open_or_close_the_quickfix_window
function! ToggleQuickfix()
    if exists("g:qfix_win")
	cclose
    else
	execute "copen 10"
    endif
endfunction

" Track quickfix
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

" Mapping of F2
nmap <silent> <F2> :call ToggleQuickfix()<CR>

" Close after you hit Enter in quickfix
autocmd BufReadPost quickfix nnoremap <silent> <buffer> <CR> <CR>:cclose<CR>

function! CloseOnLast()
  let cnt = 0

  for i in range(0, bufnr("$"))
    if buflisted(i)
      let cnt += 1
    endif
  endfor

  if cnt <= 1
    q
  else
    bw
  endif
endfunction

"" Quit and close windows
map <silent>q :call CloseOnLast()<CR>

" Disabled mappings
"" Disable F1
"nmap <silent> <F1> <Nop>
"" Navigate errors
"nmap <C-e> :lnext<CR>
"nmap <C-E> :lprev<CR>
"nmap <silent> <C-Tab> :lnext<CR>

" Golang
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-imports)<bar><Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap ! <Plug>(go-run)
au FileType go nmap @ <Plug>(go-def)
au FileType go map <silent><F9> :write<CR>:GoImports<CR>:GoTest<CR>
