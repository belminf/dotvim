Installing:
-----------
OS requirements:
* Ubuntu: `apt-get install -y vim-nox silversearcher-ag`
* Cygwin: `apt-cyg install vim the_silver_searcher`

Python requirements: `pip install flake8`

```
# Clone
git clone git@github.com:belminf/dotvim.git ~/.config/vim

# Link vimrc and install plugins
mv ~/.vimrc ~/.vimrc.original
ln -s ~/.config/vim/ ~/.vim
ln -s ~/.config/vim/rc.vim ~/.vimrc
vim +PlugInstall +qall
```

Update:
-------
```
git pull origin master
vim +PlugUpdate +qall
```

Keys:
-----
* <kbd>Tab</kbd> <kbd>Tab</kbd>: Next buffer
* <kbd>Shift</kbd> <kbd>Tab</kbd> <kbd>Tab</kbd>: Previous buffer
* <kbd>q</kbd>: Delete current buffer
* <kbd>Space</kbd>: Search recently opened files and current dir/project by filename (CtrlP)
* <kbd>-</kbd>: Browse current directory
* <kbd>\`</kbd>: Wildfire selection
* <kbd>.</kbd>: Move using easymotion
* <kbd>#</kbd>: Comment out line or block
* <kbd>'</kbd>: Search content of current dir/project (using `Ag`)
* <kbd>F2</kbd>: Toggle quickfix list (used for AG)
* <kbd>F3</kbd>: Clear highlighting
* <kbd>F4</kbd>: Toggle line numbers
