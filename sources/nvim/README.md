# NeoVim Config
nvim nightly version

**Table of Contents**
* [Important Stuff](#important-stuff)
* [Config](#config)
* [History](#history)
* [To-do's](#to-dos)
* [Resources](#resources)

## Important stuff
* *installation* &mdash; uses [bob-nvim](https://crates.io/crates/bob-nvim) for nvim version management:
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
* *usage* &mdash; I've been using NeoVim mostly for note-taking, Rust-based projects, and building / customizing my environment (dotfiles and such)

## Config
### Files
* `lsp/*.lua` &mdash; LSP config settings (instead of the [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) plugin, see [`./lsp/README.md`](./lsp/README.md) for details)
* `lua/autocmds.lua` &mdash; all of my (user-defined) autocommands
* `lua/completions.lua` &mdash; autocomplete settings
* `lua/keymaps.lua` &mdash; all of my non-plugin-related keymaps
* `lua/settings.lua` &mdash; all of my general Vim settings
* `init.lua` &mdash; where everything comes together ✨

### Plugins
> all links in this section go to the link title's GitHub repository

**Core**
* [`catppuccin`](https://github.com/catppuccin/nvim) &mdash; catppuccin colorscheme <3
* [`nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons) &mdash; pretty icons :)
    * dependency for `snacks`, `lualine`, and `oil`
* [`snacks`](https://github.com/folke/snacks.nvim) &mdash; a bunch of cool things :D
* [`lualine`](https://github.com/nvim-lualine/lualine.nvim) &mdash; configurable Vim status bar
* [`oil`](https://github.com/stevearc/oil.nvim) &mdash; file explorer
* [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) &mdash; language parser (basically provides better syntax highlighting)
* [`mason`](https://github.com/mason-org/mason.nvim) &mdash; easy installation for LSP's, DAP's, and formatters

**QoL**
* [`gitsigns`](https://github.com/lewis6991/gitsigns.nvim) &mdash; git integration
* [`ibl`](https://github.com/lukas-reineke/indent-blankline.nvim) &mdash; indenting & scope guides
* [`nvim-autopairs`](https://github.com/windwp/nvim-autopairs) &mdash; auto-completes parentheses, brackets, braces, quotes, etc.

**Completions**
* [`cmp`](https://github.com/hrsh7th/nvim-cmp) &mdash; completion engine
* [`luasnip`](https://github.com/L3MON4D3/LuaSnip) &mdash; snippet engine
    * dependencies:
        * [`cmp_luasnip`](https://github.com/saadparwaiz1/cmp_luasnip) &mdash; `luasnip` completion source for `cmp`
        * [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) &mdash; snippets collection for a lot of programming languages
* [`cmp_nvim_lsp`](https://github.com/hrsh7th/cmp-nvim-lsp) &mdash; LSP integration with `cmp`

## History
* [commit ca915bb](https://github.com/juneb125/.dotfiles/tree/ca915bb493b57e5f3dcd304bc337c7f0cb00c49c/.config/nvim) (August 7, 2025) was the first commit of the new nvim config
* [commit 845b66a](https://github.com/juneb125/.dotfiles/tree/845b66a8b7c47962efa3942760836fbce0a32df7/.config/nvim) (August 5, 2025) was the last commit before the overhaul

## To-do's
no long-term todo's :)

## Resources
* [bob-nvim](https://crates.io/crates/bob-nvim) on crates.io
* [*Rewriting my neovim config so It's super based.*](https://www.youtube.com/watch?v=xGkL2N8w0H4) by Sylvan Franklin
* [*Rewriting my config so it's super based pt. 2*](https://www.youtube.com/watch?v=5YQlibmXa0E) by Sylvan Franklin
