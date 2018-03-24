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

" XML formatting
au BufNewFile,BufRead *.html set filetype=xml
au BufNewFile,BufRead *.php set filetype=xml
au FileType xml set wrap
au FileType xml set noexpandtab
au FileType xml set tabstop=2
au FileType xml set shiftwidth=2

" Ruby formatting
au BufNewFile,BufRead *.rb set filetype=ruby

" Bash formatting
au BufNewFile,BufRead *.sh set filetype=sh
set shiftwidth=2
set softtabstop=2

" YAML formatting
au BufNewFile,BufRead *.yaml set filetype=yaml

" Terraform formatting
au BufNewFile,BufRead *.tf set filetype=tf

" Golang formatting
au BufNewFile,BufRead *.go set filetype=go
au FileType go NeoCompleteUnlock

" Markdown formatting
au BufNewFile,BufRead *.md set filetype=markdown
au Filetype markdown set spell spelllang=en_us

" Vim formatting
au BufNewFile,BufRead *.vim set filetype=vim
