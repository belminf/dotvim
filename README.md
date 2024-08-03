# dotvim

My Neovim configuration. Leveraging [LazyVim](https://www.lazyvim.org/). Dependencies:

- Nerd Font
- Neovim >= 0.9

## Keys

See [LazyVim keymap](https://www.lazyvim.org/keymaps) for reference.
Could also use <kbd>Space</kbd> <kbd>?</kbd> to search all keys

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
