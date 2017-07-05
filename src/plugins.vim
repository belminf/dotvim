" Pre vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
"

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Nerdtree: file browser
Plugin 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden =1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.pyc$', '.git']
"" When opening dir, go to NerdTree
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Nerdcommenter: quick commenting
Plugin 'scrooloose/nerdcommenter'
let NERDCreateDefaultMappings=0

" vim-autoclose: highlight close tags
Plugin 'townk/vim-autoclose'

" vim-airline: status bar
"" Addresses issue with RHEL6 and 5
if v:version > 702
    Plugin 'bling/vim-airline'
else
    Plugin 'vim-scripts/buftabs'
    :let g:buftabs_only_basename=1
endif
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_right_sep="\u25c4"
let g:airline_right_alt_sep="\u25c4"
let g:airline_left_sep="\u25ba"
let g:airline_left_alt_sep="\u25ba"

" Syntastic: check syntax
Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_flake8_args='--ignore=E501,E225'

" auto-pairs: close brackets
Plugin 'jiangmiao/auto-pairs'

" vim-easymotion: quickly move in doc
Plugin 'lokaltog/vim-easymotion'
let g:EasyMotion_smartcase=1

" wildfire: select stanzas
Plugin 'gcmt/wildfire.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.git,*.pyc

" vim-puppet: enhancements for puppet writing
Plugin 'rodjek/vim-puppet'

" tabular: automatic alignment
Plugin 'godlygeek/tabular'

" ctrlp: searching
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore={
    \ 'dir':  '\.(git|hg|svn)$',
    \ 'file': '\.(pyc)$',
\ }
let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_working_path_mode='ra'

" ag: searching
Plugin 'rking/ag.vim'
let g:ag_working_path_mode ="r"

" vim-gitgutter: add git status in gutter
Plugin 'airblade/vim-gitgutter'

" ansible-vim: detect if file ansible
Plugin 'pearofducks/ansible-vim'


"
" Post vundle
call vundle#end()
filetype plugin indent on
