" Belmin's .vimrc

" options
set number		" always show line numbers
set ruler		" always show current position
set showmatch		" set show matching parenthesis
set ignorecase		" ignore case when searching
set smartcase		" ignore case if all lowercase
set nocompatible	" don't care about vi no more
set hlsearch		" highlight search
set incsearch		" highlight as you search
set shiftwidth=4
set softtabstop=4
set smartindent

" pre vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" load vundle plugins
Plugin 'gmarik/vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'townk/vim-autoclose'
Plugin 'tpope/vim-vinegar'
if v:version > 702
    Plugin 'bling/vim-airline'
else
    Plugin 'vim-scripts/buftabs'
    :let g:buftabs_in_statusline=1
    :let g:buftabs_only_basename=1
    set statusline=buffers:\%{buftabs#statusline()}%=column\ %c,\ line\ %l/%L\ %P
endif
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'valloric/matchtagalways'
Plugin 'lokaltog/vim-easymotion'
Plugin 'gcmt/wildfire.vim'
Plugin 'tpope/vim-surround'

" post vundle
call vundle#end()
filetype on
filetype plugin on

" when vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" python formatting
au bufnewfile,bufread *.py set filetype=python
au filetype python set tabstop=8
au filetype python set expandtab
au filetype python set shiftwidth=4
au filetype python set softtabstop=4
au filetype python set smartindent
au filetype python set cinwords=if,elif,else,for,while,try,except,finally,def,class
au bufwritepre *.py normal m`:%s/\s\+$//e

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
set background=dark
colorscheme vividchalk

" Buffer issues
set hidden		" hide the buffer, don't close
set title		" change the terminal's title
set laststatus=2	" always show status line

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
set encoding=utf-8
set t_Co=256
set term=xterm-256color
set termencoding=utf-8
let g:airline_right_sep = "\u25c4"
let g:airline_right_alt_sep = "\u25c4"
let g:airline_left_sep = "\u25ba"
let g:airline_left_alt_sep = "\u25ba"

" Map keys
let mapleader=","

" Quit and close windows
map q :bd<CR>

" Turn off hl
map <silent> \ :nohl<CR>

" Nerd tree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
map <silent> <leader>b :NERDTreeToggle<CR>

" Wildfire
nmap <leader>s <Plug>(wildfire-quick-select)

" Buftabs

" Move between buffers
nmap <silent> <Tab><Tab> :bn<CR>
nmap <silent> <S-Tab><S-Tab> :bp<CR>
nmap <silent> <F1> <Nop>
