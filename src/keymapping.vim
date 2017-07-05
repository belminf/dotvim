" Key mapping
let mapleader=","
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
nmap ' :Ag<space>
"" Browse
map <silent> - :NERDTreeToggle<CR>
"" Selection
nmap ` <Plug>(wildfire-quick-select)
"" Motion
nmap . <Plug>(easymotion-s2)
"" Comment out a line or block
nmap # <Plug>NERDCommenterToggle
xmap # <Plug>NERDCommenterToggle

" Toggle buffers
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist=GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr=winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

"" Toggle quicklist (used for AG)
nmap <silent> <F2> :call ToggleList("Quickfix List", 'c')<CR>

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
map q :call CloseOnLast()<CR>

" Disabled mappings
"" Disable F1
"nmap <silent> <F1> <Nop>
"" Navigate errors
"nmap <C-e> :lnext<CR>
"nmap <C-E> :lprev<CR>
"nmap <silent> <C-Tab> :lnext<CR>
