" Default
au BufNewFile,BufRead * NeoCompleteLock

" Default indent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8

" Python formatting
au BufNewFile,BufRead *.py set filetype=python
au FileType python set cinwords=if,elif,else,for,while,try,except,finally,def,class
au BufWritePre *.py :%s/\s\+$//e

" Puppet formatting
au BufNewFile,BufRead *.pp set filetype=puppet
au FileType puppet set nowrap
au FileType puppet inoremap # .<c-h>#<space>

" HTML formatting
au FileType html set shiftwidth=2
au FileType html set softtabstop=2

" Django templates
au FileType htmldjango set shiftwidth=2
au FileType htmldjango set softtabstop=2

" Golang formatting
au FileType go NeoCompleteUnlock

" Markdown formatting
au Filetype markdown setlocal spell spelllang=en_us
