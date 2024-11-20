# My NeoVim Config

**Table of Contents**
1. [Important Stuff](#important-stuff)
2. [General Config](#general-config)
3. [Plugins](#plugins)
4. [To-do's](#to-dos)

## Important stuff
* installation - I installed NeoVim through the Nix package manager in my [`flake.nix`](https://github.com/juneb125/.dotfiles/blob/main/.config/nix-darwin/flake.nix#L23)
    * I followed Dreams of Autonomy's tutorial about setting Nixpkgs up
    * NeoVim is also available through your OS's package manager or Homebrew :)
* setup - I followed typecraft's "Neovim for Newbs" YouTube playlist on setting up the NeoVim essentials
* environment -
    * OS: MacOS 15.1 (Sequoia)
    * terminal: Warp
    * font: JetBrainsMono Nerd Font (? px, ? line spacing)
* usage - I've been using NeoVim mostly for Rust-based projects and building / customizing my config (dotfiles, environment, and such)
[ from here on, all links (unless otherwise specified) go to the link's title's GitHub repo ]
* plugin manager - [lazy.nvim 💤](https://github.com/folke/lazy.nvim) (setup in `init.lua`)
	* [lazy.nvim 💤 website](https://lazy.folke.io)

## General Config
`lua/config/*.lua`
* `vim-options` - all of my general Vim settings
* `keymaps` - all of my non-plugin-related keymaps

## Plugins
`lua/plugins/*.lua`
* [`colorscheme`](https://github.com/catppuccin/nvim) - catppuccin <3
* Autocompletions (`completions`)
    * [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
    * [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
    * [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [`gitsigns`](https://github.com/lewis6991/gitsigns.nvim) - git integration
* [`indent-blankline`](https://github.com/lukas-reineke/indent-blankline.nvim) - indenting & scope guides
* LSP config (`lsp-config`)
    * [mason](https://github.com/williamboman/mason.nvim)
    * [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
    * [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [`lualine`](https://github.com/nvim-lualine/lualine.nvim) -  configurable Vim status bar
* [`neo-tree`](https://github.com/nvim-neo-tree/neo-tree.nvim) - file tree / explorer
* [`none-ls`](https://github.com/nvimtools/none-ls.nvim) - interface for all the important LSP actions
* [`telescope`](https://github.com/nvim-telescope/telescope.nvim) - fuzzy finder
* [`treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) - language parser (basically provides better syntax highlighting)
* Rust plugins (`rust-plugins`)
    * [`rust-plugins`](https://github.com/rust-lang/rust.vim) - provides Rust file detection, syntax highlighting, formatting, and more

## To-do's
- [x] convert `init.vim` to Lua
- [x] modularize plugin config
- [x] LSP integration
- [x] autocompletions
- [x] treesitter ?
- [x] Vim status bar (lualine)
- [x] install JetBrainsMono Nerd Font
- [x] install dev-icons
- [ ] configure lualine better
- [x] modularize Vim settings config (in new dir `/lua/config/`)
- [ ] improve README.md

[Back to top](#my-neovim-config)
