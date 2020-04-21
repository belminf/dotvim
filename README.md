# dotvim

My neovim configuration.

## Installing:

### OS requirements

Arch:

```
yay -S neovim python-flake8 the_silver_searcher ctags prettier yamllint fzf ripgrep shellcheck python-black bash-language-server dockerfile-language-server-bin jsonlint tflint-bin terraform-lsp-bin

gem install --user-install rufo
```

macOS

```
brew tap wata727/tflint
brew install neovim flake8 the_silver_searcher ctags prettier yamllint fzf ripgrep shellcheck black jsonlint tflint

npm i -g bash-language-server dockerfile-language-server-nodejs

brew install rbenv
rbenv global 2.3.8
sudo gem pristine jaro_winkler --version 1.5.2
gem install --user-install cookstyle foodcritic rubocop

# Install TF LSP from https://github.com/juliosueiras/terraform-lsp/releases
# e.g.: wget -qO- https://github.com/juliosueiras/terraform-lsp/releases/download/v0.0.9/terraform-lsp_0.0.9_darwin_amd64.tar.gz | tar xvz - -C ~/.local/bin/ terraform-lsp
```

### Install config

```
# Clone
git clone git@github.com:belminf/dotvim.git ~/.config/nvim

# Install plugins
nvim +PlugInstall +qall

# For convenience
ln -s ~/.config/nvim ~/.vim
```

### Update:

Pull in plugin updates:

```
nvim +PlugUpgrade +PlugClean +PlugInstall +PlugUpdate +qall
```

## Keys:

- <kbd>Tab</kbd> <kbd>Tab</kbd>: Next buffer
- <kbd>Shift</kbd> <kbd>Tab</kbd> <kbd>Tab</kbd>: Previous buffer
- <kbd>q</kbd>: Delete current buffer
- <kbd>Space</kbd>: Search recently opened files and current dir/project by filename (CtrlP)
- <kbd>-</kbd>: Browse current directory (NERDTree)
  - <kbd>u</kbd>: Go up a directory (..)
  - <kbd>CD</kbd>: Go back to CWD
- <kbd>~</kbd>: Move using easymotion
- <kbd>!</kbd>: Compile/run
- <kbd>#</kbd>: Comment out line or block
- <kbd>\\</kbd>: `Rg` search of current directory
- <kbd>F3</kbd>: Clear highlighting
- <kbd>F4</kbd>: Toggle line numbers
