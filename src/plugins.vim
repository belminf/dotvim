" vim-plug initializing
call plug#begin('~/.config/nvim/local/plugged')

" Plugins
"

" Nerdtree: file browser
Plug 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden =1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.pyc$', '\.git', '__pycache__']
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" Nerdcommenter: quick commenting
Plug 'preservim/nerdcommenter'
let NERDCreateDefaultMappings=0
let g:NERDCustomDelimiters = {
    \ 'chef': { 'left': '#'  },
\ }

" vim-autopairs: highlight close tags
Plug 'jiangmiao/auto-pairs'

" indentLine: makes indent char visible
Plug 'Yggdroot/indentLine'
let g:indentLine_fileTypeExclude = ['json', 'markdown']

" groovy.vim: For groovy indentation
Plug 'modille/groovy.vim'

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
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#skip_indent_check_ft = {
\   'go': ['mixed-indent-file', 'indent'],
\}

" ale: syntax linter
Plug 'dense-analysis/ale'
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1

" For ref: https://github.com/dense-analysis/ale/tree/master/doc
let g:ale_fixers = {
\   '*':        ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\   'chef':     ['rubocop'],
\   'go':       ['gofmt', 'goimports'],
\   'groovy':   ['npm-groovy-lint'],
\   'json':     ['jq'],
\   'packer':   ['packer'],
\   'php':      ['php_cs_fixer'],
\   'python':   ['black'],
\   'ruby':     ['rubocop'],
\   'sh':       ['shfmt'],
\   'hcl;':     ['terraform'],
\   'zsh':      ['shfmt'],
\}
"let g:ale_linters = {
"\   'go':        ['golangci-lint'],
"\   'terraform': ['terraform'],
"\   'packer':    ['packer-fmt'],
"\}
let g:ale_chef_cookstyle_options = '--except ChefStyle/FileMode'
let g:ale_sh_shfmt_options = '-s -i 2 -ci'
let g:ale_sh_shellcheck_exclusions = 'SC1090,SC2016'
let g:ale_fix_on_save = 0
let g:ale_virtualtext_cursor = 'disabled'

" coc - autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" Use tab to finish completion and go to next word
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" Close autocomplete dialog
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <silent><expr> <c-Tab> coc#refresh()

" gutentags - manages tags
Plug 'ludovicchabant/vim-gutentags'

" fzf - fuzzy search, used for :Rg
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" vim-easymotion: quickly move in doc
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase=1

" vim-puppet: enhancements for puppet writing
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }

" tabular: automatic alignment
Plug 'godlygeek/tabular'

" ctrlp: searching
Plug 'ctrlpvim/ctrlp.vim', { 'on':  ['CtrlP', 'CtrlPTag'] }
let g:ctrlp_prompt_mappings = {
    \ 'ToggleType(1)':        ['<tab>'],
    \ 'ToggleType(-1)':       ['<s-tab>'],
    \ 'ToggleFocus()':        [],
    \ 'PrtExpandDir()':       [],
\ }
let g:ctrlp_custom_ignore={
    \ 'dir':  '\v\[\/](node_modules|target|dist)|(\.(git|hg|svn|swp))$',
    \ 'file': '\v\.(pyc)$',
\ }
let g:ctrlp_cmd='CtrlPMixed'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_extensions = ['tag']

" vim-gitgutter: add git status in gutter
Plug 'airblade/vim-gitgutter'

" ansible-vim: detect if file ansible
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }

" vim-go: Golang support
"" Limit installation per vim-go requirements
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
let g:go_term_mode = "split"

" terraform
Plug 'hashivim/vim-terraform'
let g:terraform_fmt_on_save=1

Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0

Plug 'miyakogi/conoline.vim'
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal = 1
let g:conoline_use_colorscheme_default_insert = 1

" incsearch: higlights searches
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

Plug 'majutsushi/tagbar'
let g:tagbar_autoclose = 1

Plug 'tmux-plugins/vim-tmux'

Plug 'morhetz/gruvbox'

Plug 'jvirtanen/vim-hcl'

" Initialize plugin system
call plug#end()

colorscheme gruvbox
