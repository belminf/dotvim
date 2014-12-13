Installing:
-----------
```
cd ~
git clone http://github.com/belminf/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

Update:
-------
```
git pull origin master
git submodule foreach git pull origin master
```
