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
set foldopen+=all       " opens folds
set backspace=indent,eol,start
scriptencoding utf-8
set encoding=utf-8
set t_Co=256
set termencoding=utf-8

" Set color for regular vim
if !has('nvim')
    set term=xterm-256color
endif

" Centralized backup
set backupdir=~/.vim/local/backups
set backup

" vim undo
if v:version > 702
    set undodir=~/.vim/local/undo
    set undofile
endif

" vim swap
set directory=~/.vim/local/swap

" Buffer issues
set hidden		" hide the buffer, don't close
set title		" change the terminal's title
set laststatus=2	" always show status line

" Remember last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let &titleold=getcwd()
