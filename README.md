# dotvim

My Neovim configuration. Leveraging [LazyVim](https://www.lazyvim.org/). Dependencies:

- Nerd Font
- Neovim >= 0.9

## Keys

Use <kbd>Space</kbd> <kbd>?</kbd> to search mappings. See [LazyVim keymap](https://www.lazyvim.org/keymaps) for reference.

- <kbd>Tab</kbd> <kbd>Tab</kbd>: Next buffer
- <kbd>Shift</kbd> <kbd>Tab</kbd> <kbd>Tab</kbd>: Previous buffer
- <kbd>q</kbd>: Delete current buffer
- <kbd>Space</kbd> <kbd>Space</kbd>: Search root directory
- <kbd>s</kbd>: Move to a letter using easy motion
- <kbd>S</kbd>: Select a tree element (e.g., paragraph)

### Update

Update plugins

```bash
nvim --headless "+Lazy! sync" +qa
```
## References

- [Configuring LSPs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
