" Key mapping
let mapleader=","
"" Move buffers
nmap <silent> <Tab><Tab> :bn<CR>
nmap <silent> <S-Tab><S-Tab> :bp<CR>

"" location list next and wrap at end
" wrap :cnext/:cprevious and :lnext/:lprevious
function! WrapCommand(direction, prefix)
    if a:direction == "up"
        try
            execute a:prefix . "previous"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "last"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    elseif a:direction == "down"
        try
            execute a:prefix . "next"
        catch /^Vim\%((\a\+)\)\=:E553/
            execute a:prefix . "first"
        catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
        endtry
    endif
endfunction
nnoremap <silent> ` :call WrapCommand('down', 'l')<CR>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

"" CtrlP
map <silent><Space> :CtrlP<CR>

"" Tagbar
map <silent> _ :TagbarToggle<CR>

"" Clear highlighting
map <silent><F12> :source $MYVIMRC<CR>
"" Toggle number
map <silent><F4> :set number!<CR>:sign unplace *<CR>:IndentLinesToggle<CR>
"" Browse
map <silent> - :NERDTreeToggle<CR>
"" Copy to system clipboard
nnoremap <C-y> :%y+<CR>
vnoremap Y "+y

"" Motion
"" Navigate errors
nmap = :lnext<CR>
nmap <Shift> = :lprev<CR>

nmap @ <Plug>(easymotion-s2)
vmap ~ <Plug>(easymotion-s2)

"" Comment out a line or block
nmap # <Plug>NERDCommenterToggle
xmap # <Plug>NERDCommenterToggle
"" fuzzysearch
cnoreabbrev Ack Ack!
nmap \ :Rg<Space>
"" visual mode tab
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
"" Ale fix
map <silent>F :ALEFix<CR>

"" Escape terminal
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

"" Prevent accidentally page up and down
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"" Maps a more natural page up and down
nmap <C-K> <C-U>
nmap <C-J> <C-D>

function! Close()
  let cnt = 0

  " Count visible buffers
  for i in range(0, bufnr("$"))
    if buflisted(i)
      let cnt += 1
    endif
  endfor

  " Add ! if terminal
  let term_excl = match(expand('%'), "term://") == 0? '!': ''
  if cnt <= 1
    execute "q" . term_excl
  else
    execute "bd" . term_excl
  endif
endfunction

"" Quit and close windows
nmap <silent>q :call Close()<CR>

nnoremap <silent> zj :call NextClosedFold('j')<cr>
nnoremap <silent> zk :call NextClosedFold('k')<cr>
function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

" Disabled mappings
"" Disable F1
"nmap <silent> <F1> <Nop>

" Golang
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-imports)<Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap @ <Plug>(go-def)
"au FileType go map <silent><F9> :write<CR>:GoImports<CR>:GoTest<CR>
au FileType go nmap <silent>! :w<CR>:split <bar> terminal go run %<CR>
au FileType go nmap <silent>^ <Plug>(go-info)
