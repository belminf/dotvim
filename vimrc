" Belmin's .vimrc
" https://github.com/belminf/dotvim/

" Options
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

" Centralized backup
set backupdir=~/.vim/backup
set backup

" vim undo
set undodir=~/.vim/undo
set undofile

" vim swap
set directory=~/.vim/swap

" Default indent
set shiftwidth=4
set softtabstop=4
set smartindent

" Buffer issues
set hidden		" hide the buffer, don't close
set title		" change the terminal's title
set laststatus=2	" always show status line

let &titleold=getcwd()

" Pre vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Load vundle plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'townk/vim-autoclose'
"" Addresses issue with RHEL6 and 5
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
Plugin 'rodjek/vim-puppet'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

" Post vundle
call vundle#end()
filetype plugin indent on

" When vimrc is edited, reload it
autocmd! BufWritePost .vimrc source ~/.vimrc

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

" Nerd tree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.pyc$', '.git']
"" When opening dir, go to NerdTree
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Nerd commentator
let NERDCreateDefaultMappings=0

" Easy motion shortcut
let g:EasyMotion_smartcase = 1

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_flake8_args='--ignore=E501,E225'

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.git,*.pyc
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.(git|hg|svn)$',
    \ 'file': '\.(pyc)$',
\ }
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'

" AG
let g:ag_working_path_mode="r"

" Toggle buffers
function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
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
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

" Key mapping
let mapleader=","
"" Quit and close windows
map q :bd<CR>
"" Move buffers
nmap <silent> <Tab><Tab> :bn<CR>
nmap <silent> <S-Tab><S-Tab> :bp<CR>
"" CtrlP
let g:ctrlp_map = '<Space>'
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
"" Toggle quicklist (used for AG)
nmap <silent> <F2> :call ToggleList("Quickfix List", 'c')<CR>

" Disabled mappings
"" Disable F1
"nmap <silent> <F1> <Nop>
"" Navigate errors
"nmap <C-e> :lnext<CR>
"nmap <C-E> :lprev<CR>
"nmap <silent> <C-Tab> :lnext<CR>
