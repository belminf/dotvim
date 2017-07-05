" Belmin's .vimrc
" https://github.com/belminf/dotvim/

" When a .vim file is edited, reload config
autocmd! BufWritePost ~/.vim/*.vim source ~/.vimrc

" Options
source ~/.vim/src/options.vim

" Plugins
source ~/.vim/src/plugins.vim

" File types
source ~/.vim/src/filetypes.vim

" Colors
source ~/.vim/src/colors.vim

" Keymapping
source ~/.vim/src/keymapping.vim
