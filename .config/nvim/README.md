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
* `lua/completions.lua` &mdash; autocomplete settings
* `lua/settings.lua` &mdash; all of my general Vim settings
* `lua/keymaps.lua` &mdash; all of my non-plugin-related keymaps
* `init.lua` &mdash; where everything comes together ✨

### Plugins
* [`catppuccin`](https://github.com/catppuccin/nvim) &mdash; catppuccin <3
* [`lualine`](https://github.com/nvim-lualine/lualine.nvim) &mdash; configurable Vim status bar
    * depends on `nvim-web-devicons` (see below)
* [`mason`](https://github.com/mason-org/mason.nvim) &mdash; easy installation for LSP's & DAP's
* [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) &mdash; config for the LSP's
* [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) &mdash; language parser (basically provides better syntax highlighting)
* [`neo-tree`](https://github.com/nvim-neo-tree/neo-tree.nvim) &mdash; file explorer
    * dependencies:
        * [`nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons) &mdash; pretty icons :)
        * [`nui`](https://github.com/MunifTanjim/nui.nvim) &mdash; UI library
        * [`plenary`](https://github.com/nvim-lua/plenary.nvim) &mdash; nvim utility functions
* [`gitsigns`](https://github.com/lewis6991/gitsigns.nvim) &mdash; git integration
* [`ibl`](https://github.com/lukas-reineke/indent-blankline.nvim) &mdash; indenting & scope guides
* [`nvim-autopairs`](https://github.com/windwp/nvim-autopairs) &mdash; auto-completes parentheses, brackets, braces, quotes, etc.
* completions:
    * [`cmp`](https://github.com/hrsh7th/nvim-cmp) &mdash; completion engine
	* [`luasnip`](https://github.com/L3MON4D3/LuaSnip) &mdash; snippet engine
    * [`cmp_nvim_lsp`](https://github.com/hrsh7th/cmp-nvim-lsp) &mdash; LSP integration with `cmp`
    * completions dependencies:
        * [`cmp_luasnip`](https://github.com/saadparwaiz1/cmp_luasnip) &mdash; `luasnip` completion source for `cmp`
        * [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) &mdash; snippets collection for a lot of programming languages

## To-do's
- [x] colorscheme
- [x] LSP config
- [x] file explorer
- [x] treesitter
- [x] status line (lualine)
- [x] *maybe*: autocompletions
- [ ] misc. plugins:
    - [x] gitsigns
    - [x] autopairs
    - [x] indent-blankline
    - [ ] lang-specific plugins

## Resources
* [bob-nvim](https://crates.io/crates/bob-nvim) on crates.io
* [*Rewriting my neovim config so It's super based.*](https://www.youtube.com/watch?v=xGkL2N8w0H4) by Sylvan Franklin
* [*Rewriting my config so it's super based pt. 2*](https://www.youtube.com/watch?v=5YQlibmXa0E) by Sylvan Franklin
