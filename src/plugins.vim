" vim-plug initializing
call plug#begin('~/.vim/local/plugged')

" Plugins
"

" Vundle
Plug 'VundleVim/Vundle.vim'

" Nerdtree: file browser
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden =1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.pyc$', '.git']
au BufEnter NERD_tree_* map <silent> <Esc> :NERDTreeToggle<CR>
au BufLeave NERD_tree_* unmap <Esc>

" Nerdcommenter: quick commenting
Plug 'scrooloose/nerdcommenter'
let NERDCreateDefaultMappings=0

" vim-autoclose: highlight close tags
Plug 'townk/vim-autoclose'

" vim-airline: status bar
"" Addresses issue with RHEL6 and 5
if v:version > 702
    Plug 'bling/vim-airline'
else
    Plug 'vim-scripts/buftabs'
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
Plug 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_flake8_args='--ignore=E501,E225'

" auto-pairs: close brackets
Plug 'jiangmiao/auto-pairs'

" vim-easymotion: quickly move in doc
Plug 'lokaltog/vim-easymotion'
let g:EasyMotion_smartcase=1

" wildfire: select stanzas
Plug 'gcmt/wildfire.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.git,*.pyc

" vim-puppet: enhancements for puppet writing
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }

" tabular: automatic alignment
Plug 'godlygeek/tabular'

" ctrlp: searching
Plug 'ctrlpvim/ctrlp.vim', { 'on':  'CtrlP' }
let g:ctrlp_prompt_mappings = {
    \ 'ToggleType(1)':        ['<tab>'],
    \ 'ToggleType(-1)':       ['<s-tab>'],
    \ 'ToggleFocus()':        [],
    \ 'PrtExpandDir()':       [],
\ }
let g:ctrlp_custom_ignore={
    \ 'dir':  '\.(git|hg|svn)$',
    \ 'file': '\.(pyc)$',
\ }
let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_working_path_mode='ra'
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | execute "CtrlP" | endif

" ag: searching
Plug 'mileszs/ack.vim'
let g:ag_working_path_mode ="r"
if executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case'
endif

" vim-gitgutter: add git status in gutter
Plug 'airblade/vim-gitgutter'

" ansible-vim: detect if file ansible
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }

" vim-go: Golang support
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1 

" neocomplete: auto complete
Plug 'Shougo/neocomplete.vim'
" Disable AutoComplPop and use neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Auto close preview window
let g:neocomplete#enable_auto_close_preview = 1

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()


" Initialize plugin system
call plug#end()
