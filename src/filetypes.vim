" Python formatting
au BufNewFile,BufRead *.py set filetype=python
au FileType python set tabstop=8
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set smartindent
au FileType python set cinwords=if,elif,else,for,while,try,except,finally,def,class
au FileType python inoremap # .<c-h>#<space>
au BufWritePre *.py :%s/\s\+$//e

" Puppet formatting
au BufRead,BufNewFile *.pp set filetype=puppet
au FileType puppet set nowrap
au FileType puppet set tabstop=4
au FileType puppet set softtabstop=4
au FileType puppet set shiftwidth=4
au FileType puppet set expandtab
au FileType puppet set smartindent
au FileType puppet inoremap # .<c-h>#<space>

" XML formatting
au BufRead,BufNewFile *.html set filetype=xml
au BufRead,BufNewFile *.php set filetype=xml
au FileType xml set wrap
au FileType xml set tabstop=2
au FileType xml set softtabstop=2
au FileType xml set shiftwidth=2
au FileType xml set expandtab
au FileType xml set smartindent

" Ruby formatting
au BufRead,BufNewFile *.rb set filetype=ruby
au FileType ruby set tabstop=2
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2
au FileType ruby set expandtab
au FileType ruby set smartindent

" Bash formatting
au BufRead,BufNewFile *.sh set filetype=sh
au FileType sh set tabstop=2
au FileType sh set softtabstop=2
au FileType sh set shiftwidth=2
au FileType sh set expandtab
au FileType sh set smartindent

" YAML formatting
au BufRead,BufNewFile *.yaml set filetype=yaml
au FileType yaml set tabstop=2
au FileType yaml set softtabstop=2
au FileType yaml set shiftwidth=2
au FileType yaml set expandtab
au FileType yaml set smartindent

" Markdown formatting
au BufRead,BufNewFile *.md set filetype=markdown
au FileType markdown set tabstop=2
au FileType markdown set softtabstop=2
au FileType markdown set shiftwidth=2
au FileType markdown set expandtab
au FileType markdown set smartindent
au Filetype markdown set spell spelllang=en_us

" Vim formatting
au BufNewFile,BufRead *.vim set filetype=vim
