" Belmin's .vimrc
" https://github.com/belminf/dotvim/

" When a .vim file is edited, reload config
autocmd! BufWritePost ~/.vim/*.vim source ~/.vimrc

" Options
source src/options.vim

" Plugins
source src/plugins.vim

" File types
source src/filetypes.vim

" Colors
source src/colors.vim

" Keymapping
source src/keymapping.vim
