# dotvim

My Neovim configuration. Leveraging [LazyVim](https://www.lazyvim.org/).

## Install

### Setup

```bash
make setup
```

### Update

```bash
make update
```

### Mason

LSP servers and tools are managed by [Mason](https://github.com/mason-org/mason.nvim) with version-locked installs via [mason-lock.nvim](https://github.com/zapling/mason-lock.nvim).

To restore pinned tools:

```bash
make restore
```

- `:Mason` — browse/install packages
- `:MasonLock` — save current versions to `mason-lock.json`
- `:MasonLockRestore` — install exact versions from lockfile

## Keys

Use <kbd>Space</kbd> <kbd>?</kbd> to search all keymaps. See [LazyVim keymap](https://www.lazyvim.org/keymaps) for full reference.

### Buffers

- <kbd>Shift</kbd> <kbd>l</kbd> / <kbd>]b</kbd>: Next buffer
- <kbd>Shift</kbd> <kbd>h</kbd> / <kbd>[b</kbd>: Previous buffer
- <kbd>Space</kbd> <kbd>Tab</kbd>: Browse open buffers (dropdown picker, j/k to navigate, type to filter)
- <kbd>Space</kbd> <kbd>b</kbd><kbd>d</kbd>: Delete buffer
- <kbd>Space</kbd> <kbd>q</kbd><kbd>q</kbd>: Quit all

### Windows

- <kbd>Ctl</kbd> <kbd>h/j/k/l</kbd>: Window movement
- <kbd>Ctl</kbd> <kbd>q</kbd>: Toggle terminal insert mode

### Navigation

- <kbd>-</kbd>: Browse files (vertical popup)
- <kbd>Space</kbd> <kbd>e</kbd>: Browse root directory (sidebar)
- <kbd>Space</kbd> <kbd>Space</kbd>: Find files
- <kbd>Space</kbd> <kbd>/</kbd>: Live grep across project (ripgrep + fzf)
- <kbd>\_</kbd>: Browse symbols in current file (scrollable tree + preview)
- <kbd>&</kbd>: Fuzzy search symbols across workspace (LSP)

### Editing

- <kbd>s</kbd>: Jump to letter (flash)
- <kbd>S</kbd>: Select treesitter node (flash) — highlights syntax blocks like functions, conditions, loops; type a label to jump/select
- <kbd>g</kbd> <kbd>s</kbd> <kbd>r</kbd>: Replace surrounding
- <kbd>g</kbd> <kbd>s</kbd> <kbd>a</kbd> / <kbd>g</kbd> <kbd>s</kbd> <kbd>d</kbd>: Add / delete surrounding
- <kbd>&gt;</kbd> / <kbd>&lt;</kbd> (visual): Indent / unindent
- <kbd>g</kbd> <kbd>c</kbd> <kbd>c</kbd> / <kbd>g</kbd> <kbd>c</kbd> (visual): Comment
- <kbd>F</kbd>: Format
- <kbd>Ctl</kbd> <kbd>y</kbd>: Copy buffer to clipboard
- <kbd>Y</kbd> (visual): Copy selection to clipboard
- <kbd>%</kbd>: Jump to matching bracket / paren / brace
- <kbd>q</kbd><kbd>a</kbd>: Record macro into register `a` (stop with <kbd>q</kbd>); <kbd>@</kbd><kbd>a</kbd> to replay, <kbd>@</kbd><kbd>@</kbd> to repeat last

### Completion

- <kbd>Ctl</kbd> <kbd>Space</kbd>: Manually trigger / toggle docs
- <kbd>Tab</kbd> / <kbd>Shift</kbd> <kbd>Tab</kbd>: Navigate list
- <kbd>Enter</kbd>: Confirm selection
- <kbd>Ctl</kbd> <kbd>e</kbd>: Cancel
- <kbd>Ctl</kbd> <kbd>b</kbd> / <kbd>Ctl</kbd> <kbd>f</kbd>: Scroll docs

### LSP

- <kbd>K</kbd>: Hover docs for symbol under cursor
- <kbd>g</kbd><kbd>K</kbd>: Signature help — shows function parameter list (like the tooltip when you type `(`)
- <kbd>g</kbd><kbd>d</kbd>: Go to definition
- <kbd>g</kbd><kbd>I</kbd>: Go to implementation
- <kbd>g</kbd><kbd>y</kbd>: Go to type definition
- <kbd>g</kbd><kbd>r</kbd>: References
- <kbd>`</kbd>: Toggle floating diagnostics
- <kbd>]d</kbd> / <kbd>[d</kbd>: Next / previous diagnostic

### Refactoring

<kbd>Space</kbd> <kbd>c</kbd> is the code action prefix — hit it and which-key shows everything available. Key ones:

- <kbd>Space</kbd> <kbd>c</kbd><kbd>r</kbd>: **Rename symbol** (F2 in VSCode / GoLand)
- <kbd>Space</kbd> <kbd>c</kbd><kbd>a</kbd>: **Code action / quick fix** (Ctrl+. in VSCode) — extract variable, organize imports, fix errors
- <kbd>Space</kbd> <kbd>c</kbd><kbd>f</kbd>: **Format file**
- <kbd>Space</kbd> <kbd>c</kbd><kbd>R</kbd>: **Rename file** (updates LSP references too)
- <kbd>Space</kbd> <kbd>u</kbd><kbd>h</kbd>: Toggle inlay hints (inline type annotations in the code)

<kbd>Space</kbd> <kbd>s</kbd> is the search prefix. Useful ones beyond files:

- <kbd>Space</kbd> <kbd>s</kbd><kbd>S</kbd>: Symbols across workspace (same as <kbd>&</kbd>)

### Git

- <kbd>]h</kbd> / <kbd>[h</kbd>: Next / previous hunk
- <kbd>Space</kbd> <kbd>g</kbd><kbd>h</kbd><kbd>s</kbd>: Stage hunk
- <kbd>Space</kbd> <kbd>g</kbd><kbd>h</kbd><kbd>r</kbd>: Reset hunk
- <kbd>Space</kbd> <kbd>g</kbd><kbd>b</kbd>: Blame line

### Testing

- <kbd>Space</kbd> <kbd>t</kbd><kbd>r</kbd>: Run nearest test
- <kbd>Space</kbd> <kbd>t</kbd><kbd>f</kbd>: Run file tests

### Other

- <kbd>Ctl</kbd> <kbd>g</kbd>: Toggle Claude Code panel (works in normal, insert, and terminal mode)
- <kbd>Ctl</kbd> <kbd>/</kbd>: Open terminal
- <kbd>Esc</kbd>: Dismiss notifications + clear search highlights

## Transition

| Was                                  | Now                         |
| ------------------------------------ | --------------------------- |
| `q`                                  | `<leader>bd` / `<leader>qq` |
| `<Tab><Tab>` / `<S-Tab><S-Tab>`      | `<S-l>` / `<S-h>`           |
| `>` / `<` (normal, diagnostics)      | `]d` / `[d`                 |
| `<C-h>` (git hunk, broke window nav) | `]h`                        |
| `<Tab>` / `<S-Tab>` (visual indent)  | `>` / `<`                   |
| `<Esc>` (dismiss notifs, broke noh)  | `<Esc>` does both now       |
| `<C-t>` (todo search)                | `<leader>sT`                |
| `#` (comment)                        | `gcc` / `gc`                |
| `#` (search backward)                | `*` then `N`                |
| `cs` (surround replace)              | `gsr`                       |

## When stuck

- <kbd>Space</kbd> <kbd>?</kbd>: Search all keymaps (fzf)
- <kbd>Space</kbd> <kbd>s</kbd><kbd>C</kbd>: Search commands (fzf)
- <kbd>Space</kbd> <kbd>:</kbd>: Search command history (fzf)
- [LazyVim keymaps reference](https://www.lazyvim.org/keymaps)

## References

- [Configuring LSPs](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
