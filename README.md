Installing:
-----------
```
git clone https://github.com/belminf/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
vim +PluginInstall +qall
```

Add a submodule

```
git submodule add http://github.com/gmarik/Vundle.vim bundle/vundle
git submodule init
```

Update:
-------
```
git pull origin master
git submodule foreach git pull origin master
vim +PluginInstall +qall
```
