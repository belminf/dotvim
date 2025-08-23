# dotvim

My Neovim configuration. Leveraging [LazyVim](https://www.lazyvim.org/). Dependencies:

- Nerd Font
- Neovim >= 0.9

## Requirements

For Archlinux:
```
yay -S \
  wget \
  zip \
  npm \
  gpls \
  luarocks\
  vscode-json-languageserver /
  yaml-language-server /
  bash-language-server \
  ruby-sorbet-runtime \
  marksman \
  markdownlint-cli2
```

### Update

```bash
make update
```

## Keys

Use <kbd>Space</kbd> <kbd>?</kbd> to search mappings. See [LazyVim keymap](https://www.lazyvim.org/keymaps) for reference.

- <kbd>Tab</kbd> <kbd>Tab</kbd>: Next buffer
- <kbd>Shift</kbd> <kbd>Tab</kbd> <kbd>Tab</kbd>: Previous buffer
- <kbd>q</kbd>: Delete current buffer
- <kbd>Ctl</kbd> <kbd>h/j/k/l</kbd>: Window movement
- <kbd>Ctl</kbd> <kbd>q</kbd>: Blockwise visual select

- <kbd>o</kbd>: Move to other side of selection in visual mode
- <kbd>%</kbd>: Move to matching parenthesis

- <kbd>Space</kbd> <kbd>s</kbd><kbd>s</kbd>: Search symbols (e.g., functions)(fzf)
- <kbd>Space</kbd> <kbd>Space</kbd>: Search root directory (fzf)
- <kbd>Space</kbd> <kbd>/</kbd>: Search directory (fzf)
- <kbd>Space</kbd> <kbd>:</kbd>: Search command history (fzf)
- <kbd>Ctl</kbd> <kbd>/</kbd>: Open terminal (snacks)

- <kbd>s</kbd>: Move to a letter (flash)
- <kbd>S</kbd>: Select a tree element (flash)
- <kbd>c</kbd> <kbd>s</kbd> <kbd>\[Char\]</Char></kbd>: Replace surrounding char (mini.surround)
- <kbd>K</kbd>: Show method signature in visual mode (LSP)
- <kbd>Ctl</kbd> <kbd>k</kbd>: Show method signature in insert mode (LSP)
- <kbd>Space</kbd><kbd>t</kbd>: Run test (neotest)

- <kbd>Space</kbd> <kbd>`</kbd>: Show all notices (noice)

## References

- [Configuring LSPs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
