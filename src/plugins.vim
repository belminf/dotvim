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
Plug 'scrooloose/nerdcommenter'
let NERDCreateDefaultMappings=0

" vim-autopairs: highlight close tags
Plug 'jiangmiao/auto-pairs'

" indentLine: makes indent char visible
Plug 'Yggdroot/indentLine'
let g:indentLine_fileTypeExclude = ['json', 'markdown']

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

" ale: syntax linter
Plug 'w0rp/ale'
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\   'go':       ['gofmt', 'goimports'],
\   'php':      ['php_cs_fixer'],
\   'json':     ['jq'],
\   'ruby':     ['rubocop'],
\   'chef':     ['rubocop'],
\   'sh':       ['shfmt'],
\   'python':   ['black'],
\   '*':        ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_linters = {
\    'terraform': ['terraform'],
\}
let g:ale_sh_shfmt_options = '-s -i 2 -ci'
let g:ale_sh_shellcheck_exclusions = 'SC1090,SC2016'
let g:ale_fix_on_save = 0

" coc - autocomplete
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"" Use tab to finish completion and go to next word
function! s:check_back_space() abort
  let char_before = col('.') - 1
  return !char_before || getline('.')[char_before - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"" Navigate to the suggesetion before
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"" Enter suggestion
inoremap <expr> <Cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<Cr>"
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
if has('nvim') && (v:version >= 800)
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    let g:go_fmt_command = "goimports"
    let g:go_highlight_string_spellcheck = 1
    let g:go_updatetime = 1000
    let g:go_term_mode = "split"
    let g:go_auto_type_info = 1
    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'
    "let g:go_fmt_experimental = 1
    "let g:go_fmt_fail_silently = 1
endif

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

" Initialize plugin system
call plug#end()
