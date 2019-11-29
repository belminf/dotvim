" Belmin's vimrc
" https://github.com/belminf/dotvim/

let s:path = expand('<sfile>:p:h')

" Options
exec 'source' s:path . '/src/options.vim'

" Plugins
exec 'source' s:path .  '/src/plugins.vim'

" File types
exec 'source' s:path .  '/src/filetypes.vim'

" Keymapping
exec 'source' s:path . '/src/keymapping.vim'
