# dotvim

My Neovim configuration. Leveraging [LazyVim](https://www.lazyvim.org/). Dependencies:

- Nerd Font
- Neovim >= 0.9

## Requirements

### macOS

```bash
brew install \
  fd \
  fzf \
  git \
  go \
  jsonlint \
  lua \
  luajit \
  neovim \
  node \
  npm \
  python3 \
  ripgrep \
  ruby \
  shellcheck \
  shfmt \
  stylua \
  terraform \
  tree-sitter \
  yamllint
```

### Arch Linux

```bash
yay -S \
  bash-language-server \
  go \
  gopls \
  luarocks \
  markdownlint-cli2 \
  marksman \
  nodejs \
  npm \
  python \
  ruby \
  ruby-sorbet-runtime \
  shellcheck \
  shfmt \
  stylua \
  terraform \
  vscode-json-languageserver \
  wget \
  yaml-language-server \
  yamllint \
  zip
```

### Update

```bash
make update
```

## Keys

Use <kbd>Space</kbd> <kbd>?</kbd> to search mappings. See [LazyVim keymap](https://www.lazyvim.org/keymaps) for reference.

### Buffers
- <kbd>Tab</kbd> <kbd>Tab</kbd>: Next buffer
- <kbd>Shift</kbd> <kbd>Tab</kbd> <kbd>Tab</kbd>: Previous buffer
- <kbd>q</kbd>: Delete current buffer (quit if last buffer)

### Windows
- <kbd>Ctl</kbd> <kbd>h/j/k/l</kbd>: Window movement
- <kbd>Ctl</kbd> <kbd>q</kbd>: Blockwise visual select
- <kbd>o</kbd>: Move to other side of selection in visual mode
- <kbd>%</kbd>: Move to matching parenthesis

### Navigation
- <kbd>-</kbd>: Browse root directory (neo-tree)
- <kbd>Space</kbd> <kbd>s</kbd><kbd>s</kbd>: Search symbols (e.g., functions)(fzf)
- <kbd>Space</kbd> <kbd>Space</kbd>: Search root directory (fzf)
- <kbd>Space</kbd> <kbd>/</kbd>: Search directory (fzf)
- <kbd>Space</kbd> <kbd>:</kbd>: Search command history (fzf)

### Text
- <kbd>s</kbd>: Move to a letter (flash)
- <kbd>S</kbd>: Select a tree element (flash)
- <kbd>c</kbd> <kbd>s</kbd> <kbd>[Char]</kbd>: Replace surrounding char (mini.surround)
- <kbd>F</kbd>: Format code
- <kbd>Tab</kbd>: Indent text (visual mode)
- <kbd>Shift</kbd> <kbd>Tab</kbd>: Unindent text (visual mode)
- <kbd>Ctl</kbd> <kbd>y</kbd>: Copy entire buffer to system clipboard
- <kbd>Y</kbd>: Copy selection to system clipboard (visual mode)

### Coding
- <kbd>K</kbd>: Show method signature in visual mode (LSP)
- <kbd>Ctl</kbd> <kbd>k</kbd>: Show method signature in insert mode (LSP)
- <kbd>&gt;</kbd>: Go to next diagnostic
- <kbd>&lt;</kbd>: Go to previous diagnostic
- <kbd>Ctl</kbd> <kbd>h</kbd>: Next git hunk (or diff change in diff mode)
- <kbd>Space</kbd><kbd>t</kbd>: Run test (neotest)
- <kbd>Ctl</kbd> <kbd>g</kbd>: Toggle Claude Code
- <kbd>Ctl</kbd> <kbd>/</kbd>: Open terminal (snacks)

### Notifications
- <kbd>Space</kbd> <kbd>`</kbd>: Show all notices (noice)
- <kbd>Esc</kbd>: Dismiss all notifications

## References

- [Configuring LSPs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
