# Minimal Nvim Config
neovim v0.12

**Table of Contents**
* [Important Stuff](#important-stuff)
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

## To-do's
- [x] colorscheme
- [ ] LSP config
- [ ] file explorer
- [ ] treesitter
- [ ] status line (lualine)
- [ ] *maybe*: autocompletions
- [ ] misc. plugins:
    * gitsigns
    * autopairs
    * indent-blankline
    * lang-specific plugins

## Resources
* [bob-nvim](https://crates.io/crates/bob-nvim) on crates.io
* [*Rewriting my neovim config so It's super based.*](https://www.youtube.com/watch?v=xGkL2N8w0H4) by Sylvan Franklin
* [*Rewriting my config so it's super based pt. 2*](https://www.youtube.com/watch?v=5YQlibmXa0E) by Sylvan Franklin
