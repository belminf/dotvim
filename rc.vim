" Belmin's vimrc
" https://github.com/belminf/dotvim/

" When a .config/vim file is edited, reload config
autocmd! BufWritePost ~/.config/vim/*.vim source ~/.vimrc

" Options
source ~/.config/vim/src/options.vim

" Plugins
source ~/.config/vim/src/plugins.vim

" File types
source ~/.config/vim/src/filetypes.vim

" Colors
source ~/.config/vim/src/colors.vim

" Keymapping
source ~/.config/vim/src/keymapping.vim
