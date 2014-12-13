" Belmin's .vimrc

" Options
set number		" always show line numbers
set ruler		" always show current position
set showmatch		" set show matching parenthesis
set ignorecase		" ignore case when searching
set smartcase		" ignore case if all lowercase
set nocompatible	" don't care about vi no more
set hlsearch		" highlight search
set incsearch		" highlight as you search

" When vimrc is edited, reload it
autocmd! BufWritePost .vimrc source ~/.vimrc

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Python formatting
au BufNewFile,BufRead *.py set filetype=python
au FileType python set tabstop=8
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set smartindent
au FileType python set cinwords=if,elif,else,for,while,try,except,finally,def,class
au BufWritePre *.py normal m`:%s/\s\+$//e

" Puppet formatting
au BufRead,BufNewFile *.pp set filetype=puppet
au FileType puppet set nowrap
au FileType puppet set tabstop=4
au FileType puppet set shiftwidth=4
au FileType puppet set smartindent

" Ruby formatting
au BufRead,BufNewFile *.rb set filetype=ruby
au FileType ruby set tabstop=2
au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2
au FileType ruby set expandtab
au FileType ruby set smartindent

" YAML formatting
au BufRead,BufNewFile *.yaml set filetype=yaml
au FileType yaml set tabstop=2
au FileType yaml set softtabstop=2
au FileType yaml set shiftwidth=2
au FileType yaml set expandtab
au FileType yaml set smartindent


" Coloring
syntax enable
colorscheme sweyla

" Buffer issues
set hidden		" hide the buffer, don't close
set title		" change the terminal's title

" Map keys
let mapleader=","

" Quit and close windows
map zz :qa<CR>
map <leader>c :close<CR>
map q :bd<CR>

" Turn off hl
map <silent> \ :nohl<CR>

" Tag list
map <silent> <leader>t :TlistToggle<CR>

" Nerd tree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
map <silent> <leader>b :NERDTreeToggle<CR>

" Buftabs
set laststatus=2
:let g:buftabs_in_statusline=1
:let g:buftabs_only_basename=1
set statusline=buffers:\%{buftabs#statusline()}%=column\ %c,\ line\ %l/%L\ %P

" Move between buffers
nmap <silent> <Tab><Tab> :bn<CR>
nmap <silent> <S-Tab><S-Tab> :bp<CR>
nmap <silent> <F1> <Nop>
