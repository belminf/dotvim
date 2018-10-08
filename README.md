Installing:
-----------
OS requirements:
* Arch: `pacman -S gvim the_silver_searcher fzy`
* Ubuntu: `apt-get install -y vim-nox silversearcher-ag`
* Cygwin: `apt-cyg install vim the_silver_searcher`

Python requirements: `pip install flake8`

```
# Clone
git clone git@github.com:belminf/dotvim.git ~/.config/nvim

# Link vimrc and install plugins
mv ~/.vimrc ~/.vimrc.original
ln -s ~/.vim/rc.vim ~/.vimrc
vim +PlugInstall +qall
```

Update:
-------
```
git pull origin master
vim +PlugUpdate
```

Keys:
-----
* <kbd>Tab</kbd> <kbd>Tab</kbd>: Next buffer
* <kbd>Shift</kbd> <kbd>Tab</kbd> <kbd>Tab</kbd>: Previous buffer
* <kbd>q</kbd>: Delete current buffer
* <kbd>Space</kbd>: Search recently opened files and current dir/project by filename (CtrlP)
* <kbd>-</kbd>: Browse current directory (NERDTree)
  * <kbd>u</kbd>: Go up a directory (..)
  * <kbd>CD</kbd>: Go back to CWD
* <kbd>=</kbd>: Move using easymotion
* <kbd>#</kbd>: Comment out line or block
* <kbd>\\</kbd>: `Ag` search of current directory
* <kbd>F3</kbd>: Clear highlighting
* <kbd>F4</kbd>: Toggle line numbers
