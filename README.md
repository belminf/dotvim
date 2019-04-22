# dotvim

My Neovim configuration.

## Installing:
OS requirements:

* Arch: `yay -S neovim flake8 the_silver_searcher ctags prettier yamllint fzf ripgrep`
* macOS: `brew install neovim flake8 the_silver_searcher ctags prettier yamllint fzf ripgrep`

```
# Clone
git clone git@github.com:belminf/dotvim.git ~/.config/nvim

# Install plugins
nvim +PlugInstall

# For convenience
ln -s ~/.config/nvim ~/.vim
```

### Language specific:
Using [ale](https://github.com/w0rp/ale) for linting. Prefer OS packages if available so that they're managed via system updates.

#### Python
```
# Arch
yay -S python-flake8

# macOS
brew install flake8

```

#### Ruby
```
gem install --user-install rufo
```

#### JSON
```
# Arch
yay -S jsonlint

# macOS
brew install jsonlint
```

### Terraform
```
# Arch
yay -S tflint

#macOS
brew tap wata727/tflint && brew install tflint
```

### Update:
Pull in plugin updates:

```
nvim +PlugUpgrade +PlugUpdate +PlugClean
```

## Keys:
* <kbd>Tab</kbd> <kbd>Tab</kbd>: Next buffer
* <kbd>Shift</kbd> <kbd>Tab</kbd> <kbd>Tab</kbd>: Previous buffer
* <kbd>q</kbd>: Delete current buffer
* <kbd>Space</kbd>: Search recently opened files and current dir/project by filename (CtrlP)
* <kbd>-</kbd>: Browse current directory (NERDTree)
  * <kbd>u</kbd>: Go up a directory (..)
  * <kbd>CD</kbd>: Go back to CWD
* <kbd>=</kbd>: Move using easymotion
* <kbd>#</kbd>: Comment out line or block
* <kbd>\\</kbd>: `Rg` search of current directory
* <kbd>F3</kbd>: Clear highlighting
* <kbd>F4</kbd>: Toggle line numbers
