Installing:
-----------
```
# For pull only deployments
git clone --recursive https://github.com/belminf/dotvim.git ~/.vim

# For bidirectional deployments
git clone --recursive git@github.com:belminf/dotvim.git ~/.vim

ln -s ~/.vim/.vimrc ~/.vimrc
vim +PluginInstall +qall
```

Add a submodule

```
git submodule add https://github.com/gmarik/Vundle.vim bundle/vundle
git submodule init
```

Update:
-------
```
git pull origin master
git submodule foreach git pull origin master
vim +PluginInstall +qall
```
