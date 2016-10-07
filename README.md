Installing:
-----------
OS requirements:
* RHEL: `yum install --enablerepo='epel' -y vim the_silver_searcher`
* Ubuntu: `apt-get install -y vim silversearcher-ag`
* Cygwin: `apt-cyg install vim the_silver_searcher`

Python requirements: `pip install flake8`

```
# Clone
git clone --recursive git@github.com:belminf/dotvim.git ~/.vim

# Link vimrc and install plugins
mv ~/.vimrc ~/.vimrc.original
ln -s ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
```

Add a submodule:
----------------
```
git submodule add -f git@github.com:VundleVim/Vundle.vim.git bundle/Vundle.vim
git submodule init
```

Update:
-------
```
git pull origin master
git submodule init
git submodule update
vim +PluginInstall +qall
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
