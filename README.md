Installing:
-----------
```
# For pull only deployments
git clone --recursive https://github.com/belminf/dotvim.git ~/.vim

# For bidirectional deployments
git clone --recursive git@github.com:belminf/dotvim.git ~/.vim

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
git submodule foreach git pull origin master
vim +PluginInstall +qall
```
