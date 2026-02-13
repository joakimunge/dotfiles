# Joakim's Neovim Config

My personal Neovim configuration, optimized for Swedish keyboard layout.

## Features

- 🚀 **Plugin Manager:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🔍 **Fuzzy Finder:** Telescope for file search and grep
- 🎯 **Quick Navigation:** Harpoon for marking and jumping between files
- 🧠 **LSP:** Full language server support with autocomplete
- 🎨 **Formatting:** Auto-format on save with Conform
- 🐛 **Debugging:** DAP (Debug Adapter Protocol) support
- 🧪 **Testing:** Neotest integration
- 📝 **Git:** Fugitive for git operations
- 🌳 **Undo Tree:** Visual undo history
- ⚠️ **Diagnostics:** Trouble for viewing all errors/warnings

## Swedish Keyboard Customizations

Since `{`, `}`, `[`, `]`, `^`, and `$` are hard to reach on Swedish keyboards, I've remapped them:

| Keys | Replaces | Action |
|------|----------|--------|
| `Ö` | `{` | Previous paragraph |
| `Ä` | `}` | Next paragraph |
| `gh` | `^` | Start of line |
| `gl` | `$` | End of line |
| `öd` | `[d` | Previous diagnostic |
| `äd` | `]d` | Next diagnostic |
| `öt` | `[t` | Previous trouble |
| `ät` | `]t` | Next trouble |

## Installation

### Prerequisites

- Neovim >= 0.9.0
- Git
- [ripgrep](https://github.com/BurntSushi/ripgrep) (for Telescope grep)
- [Node.js](https://nodejs.org/) (for LSP servers)
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)

### Install

```bash
# Backup your existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repo
git clone https://github.com/joakimunge/nvim-config.git ~/.config/nvim

# Open nvim - plugins will install automatically
nvim
```

## Key Bindings

Leader key: `Space`

### File Navigation
- `Space pv` - File explorer (netrw)
- `Space pf` - Find files (Telescope)
- `Ctrl-p` - Find git files (Telescope)
- `Space ps` - Live grep (Telescope)

### Harpoon (Quick File Switching)
- `Space a` - Add file to harpoon
- `Ctrl-e` - Toggle harpoon menu
- `Ctrl-1/2/3/4` - Jump to harpoon file 1/2/3/4

### LSP
- `gd` - Go to definition
- `K` - Hover documentation
- `Space vrr` - Find references
- `Space vrn` - Rename symbol
- `Space vca` - Code actions
- `Space vd` - View diagnostics
- `öd` / `äd` - Navigate diagnostics

### Git (Fugitive)
- `Space gs` - Git status
- `Space p` - Push (in fugitive buffer)
- `Space P` - Pull with rebase (in fugitive buffer)

### Other Useful Commands
- `Space f` - Format buffer
- `Space u` - Toggle undo tree
- `Space tt` - Toggle Trouble (diagnostics list)
- `:VimBeGood` - Practice vim motions with a game!

## Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── lua/joakimunge/
│   ├── init.lua          # Main config loader
│   ├── set.lua           # Vim settings
│   ├── remap.lua         # Key mappings
│   ├── lazy_init.lua     # Plugin manager setup
│   └── lazy/             # Plugin configurations
│       ├── telescope.lua
│       ├── harpoon.lua
│       ├── lsp.lua
│       ├── fugitive.lua
│       └── ...
```

## License

MIT
