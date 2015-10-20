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
set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set backspace=indent,eol,start

" vim backup
set backupdir=~/.vim/backup
set backup

" vim undo
set undodir=~/.vim/undo
set undofile

" vim swap
set directory=~/.vim/swap


" indent
set shiftwidth=4
set softtabstop=4
set smartindent

" Buffer issues
set hidden		" hide the buffer, don't close
set title		" change the terminal's title
set laststatus=2	" always show status line

let &titleold=getcwd()

" pre vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" load vundle plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'townk/vim-autoclose'
if v:version > 702
    Plugin 'bling/vim-airline'
else
    Plugin 'vim-scripts/buftabs'
    :let g:buftabs_in_statusline=1
    :let g:buftabs_only_basename=1
    set statusline=buffers:\%{buftabs#statusline()}%=column\ %c,\ line\ %l/%L\ %P
endif
Plugin 'scrooloose/syntastic'
Plugin 'valloric/matchtagalways'
Plugin 'lokaltog/vim-easymotion'
Plugin 'gcmt/wildfire.vim'
Plugin 'tpope/vim-surround'
Plugin 'rodjek/vim-puppet'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'xolox/vim-misc'
Plugin 'rking/ag.vim'

" post vundle
call vundle#end()
filetype plugin indent on

" when vimrc is edited, reload it
autocmd! BufWritePost .vimrc source ~/.vimrc

" python formatting
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

" Coloring
syntax enable
set background=dark
colorscheme vendetta


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
noremap <space> :

" Quit and close windows
map q :bd<CR>

" Turn off hl
map <silent> \ :nohl<CR>

" Nerd tree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.pyc$', '.git']
map <silent> - :NERDTreeToggle<CR>
"" When opening dir, go to NerdTree
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" Nerd commentator
let NERDCreateDefaultMappings=0
nmap # <Plug>NERDCommenterToggle
xmap # <Plug>NERDCommenterToggle

" Wildfire
nmap <leader>s <Plug>(wildfire-quick-select)

" Move between buffers
nmap <silent> <Tab><Tab> :bn<CR>
nmap <silent> <S-Tab><S-Tab> :bp<CR>
nmap <silent> <F1> <Nop>

" Easy motion shortcut
nmap . <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1

" syntastic
nmap <C-e> :lnext<CR>	" next error
nmap <C-E> :lprev<CR>	" prev error
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_flake8_args='--ignore=E501,E225'
nmap <silent> <C-Tab> :lnext<CR>

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.git,*.pyc
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.(git|hg|svn)$',
    \ 'file': '\.(pyc)$',
\ }
let g:ctrlp_map = '<NUL>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'

" AG
let g:ag_working_path_mode="r"
nmap <leader>a :Ag<space>

