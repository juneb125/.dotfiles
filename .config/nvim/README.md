# My NeoVim Config

**Table of Contents**
1. [Important Stuff](#important-stuff)
2. [General Config](#general-config)
3. [Plugins](#plugins)
4. [To-do's](#to-dos)

## Important stuff
* *installation* &mdash; I installed NeoVim through the Nix package manager in [my `flake.nix`](https://github.com/juneb125/.dotfiles/blob/main/.config/nix-darwin/flake.nix)
    * I followed Dreams of Autonomy's tutorial about setting Nixpkgs up
    * NeoVim is also available through your OS's package manager or Homebrew :)
* *setup* &mdash; I followed typecraft's "Neovim for Newbs" YouTube playlist on setting up the NeoVim essentials
* *environment*:
    * operating system: MacOS 15.2 (Sequoia)
    * terminal emulator: Ghostty
    * font: JetBrainsMono Nerd Font
* *plugin manager* &mdash; [lazy.nvim 💤 on GitHub](https://github.com/folke/lazy.nvim) (setup in `init.lua`)
	* [lazy.nvim 💤 website](https://lazy.folke.io)
* *usage* &mdash; I've been using NeoVim mostly for Rust-based projects and building / customizing my config (dotfiles, environment, and such)<br/>

> [!IMPORTANT]
> from here on, all links (unless otherwise specified) go to the link title's GitHub repo

## General Config
`lua/config/*.lua`
* `vim-options` &mdash; all of my general Vim settings
* `keymaps` &mdash; all of my non-plugin-related keymaps

## Plugins
`lua/plugins/*.lua`
* [`autopairs`](https://github.com/windwp/nvim-autopairs) &mdash; auto-completes parentheses, brackets, braces, quotes, etc.
* [`colorscheme`](https://github.com/catppuccin/nvim) &mdash; catppuccin <3
* Autocompletions (`completions`)
    * [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
    * [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
    * [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [`gitsigns`](https://github.com/lewis6991/gitsigns.nvim) &mdash; git integration
* [`indent-blankline`](https://github.com/lukas-reineke/indent-blankline.nvim) &mdash; indenting & scope guides
* Language-specific plugins (`langs`)
    * [`peek`](https://github.com/toppair/peek.nvim) &mdash; Markdown renderer
    * [`rust`](https://github.com/rust-lang/rust.vim) &mdash; provides `RustFmt`, the official formatter for Rust
* LSP config (`lsp-config`)
    * [mason](https://github.com/williamboman/mason.nvim)
    * [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
    * [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [`lualine`](https://github.com/nvim-lualine/lualine.nvim) &mdash; configurable Vim status bar
* [`neo-tree`](https://github.com/nvim-neo-tree/neo-tree.nvim) &mdash; file tree / explorer
* [`none-ls`](https://github.com/nvimtools/none-ls.nvim) &mdash; interface for all the important LSP actions
* [`snacks`](https://github.com/folke/snacks.nvim) &mdash; some quality of life things :)
* [`telescope`](https://github.com/nvim-telescope/telescope.nvim) &mdash; fuzzy finder
* [`treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) &mdash; language parser (basically provides better syntax highlighting)

## To-do's
- [ ] change some plugins to lazy load (b/c they really don't need to all load at once)
- [ ] format README.md better
- [ ] find a good LSP for `.md` files
- [x] find a good renderer for Markdown documents

[Back to top](#my-neovim-config)
