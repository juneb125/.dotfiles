# Minimal Nvim Config
neovim v0.12

**Table of Contents**
* [Important Stuff](#important-stuff)
* [Config](#config)
* [To-do's](#to-dos)
* [Resources](#resources)

## Important stuff
* *installation*: &mdash; uses [bob-nvim](https://crates.io/crates/bob-nvim) for nvim version management:
    > Prerequisite: cargo
    ```
    cargo install bob-nvim
    bob use nightly
    bob install nightly
    bob run nightly
    ```
* *environment*:
    * operating system: MacOS 15 (Sequoia)
    * terminal emulator: Ghostty
    * font: JetBrainsMono Nerd Font
* *plugin manager* &mdash; `vim.pack`
* *usage* &mdash; I've been using NeoVim mostly for Rust-based projects and building / customizing my config (dotfiles, environment, and such)

## Config
### Files
* `settings.lua` &mdash; all of my general Vim settings
* `keymaps.lua` &mdash; all of my non-plugin-related keymaps
* `init.lua` &mdash; where everything comes together ✨

### Plugins
* [`catppuccin`](https://github.com/catppuccin/nvim) &mdash; catppuccin <3
* [`mason`](https://github.com/mason-org/mason.nvim) &mdash; easy installation for LSP's & DAP's
* [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) &mdash; config for the LSP's
* [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) &mdash; language parser (basically provides better syntax highlighting)
* [`gitsigns`](https://github.com/lewis6991/gitsigns.nvim) &mdash; git integration
* [`ibl`](https://github.com/lukas-reineke/indent-blankline.nvim) &mdash; indenting & scope guides
* [`nvim-autopairs`](https://github.com/windwp/nvim-autopairs) &mdash; auto-completes parentheses, brackets, braces,
 quotes, etc.
* [`lualine`](https://github.com/nvim-lualine/lualine.nvim) &mdash; configurable Vim status bar
    * depends on [`nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons)

## To-do's
- [x] colorscheme
- [x] LSP config
- [ ] file explorer
- [x] treesitter
- [x] status line (lualine)
- [ ] *maybe*: autocompletions
- [ ] misc. plugins:
    - [x] gitsigns
    - [x] autopairs
    - [x] indent-blankline
    - [ ] lang-specific plugins

## Resources
* [bob-nvim](https://crates.io/crates/bob-nvim) on crates.io
* [*Rewriting my neovim config so It's super based.*](https://www.youtube.com/watch?v=xGkL2N8w0H4) by Sylvan Franklin
* [*Rewriting my config so it's super based pt. 2*](https://www.youtube.com/watch?v=5YQlibmXa0E) by Sylvan Franklin
