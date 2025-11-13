# My Dotfiles
My personal configuration files

**Table of Contents**
* [Goals](#goals)
* [My Environment](#my-environment)
* [Installation](#installation)

**Quick Links**
* [zsh](./sources/zsh)
* [nvim](./sources/nvim)
* [ghostty](./sources/ghostty)

## Goals
* create comprehensive and easy-to-follow documentation for each major config piece, especially:
    * `zsh` &mdash; shell
    * `nvim` &mdash; text editor
    * `nixpkgs` &mdash; package manager
    * `ghostty` &mdash; terminal emulator

## My Environment
What I'm using:
* *device* &mdash; MacBook Air M1 (2020)
* *operating system* &mdash; MacOS 15 (Sequoia)
* *terminal emulator* &mdash; Ghostty
* *package manager* &mdash; `nixpkgs` (version 25.05)
* *languages I've been working with*:
    * C
    * Rust
    * Nix
    * Markdown
* *system information[^1]*: (split up, with annotations)
    ```sh
    uname -a
    # -m
    arm64
    # -n
    Junes-MacBook-Air.local
    # -p
    arm
    # -r
    24.6.0
    # -s
    Darwin
    # -v
    Darwin Kernel Version 24.6.0: Mon Jul 14 11:30:34 PDT 2025; root:xnu-11417.140.69~1/RELEASE_ARM64_T8103
    ```

## Installation
**The Steps I Followed**

> [!WARNING]
> for all of the following installation resources, watch the full video, read the whole article, etc. before actually doing any of it!

1. I got started with [this Fireship YouTube tutorial](https://youtube.com/watch?v=r_MpUP6aKiQ) on starting your dotfiles journey
2. Then, I followed [this Dreams of Autonomy video](https://www.youtube.com/watch?v=ud7YxC33Z3w) about further customization of `zsh`
3. Next, I set up Nix Packages (`nixpkgs`) as my package manager with [this amazing Dreams of Autonomy tutorial](https://youtube.com/watch?v=Z8BL8mdzWHI)
4. I set up my text editor, NeoVim, by (roughly) following [this Sylvan Franklin YouTube video](https://www.youtube.com/watch?v=xGkL2N8w0H4) and going from there :)

**Quickstart**\
> Prerequisites: git, nix
1. clone this repository using git
    ```
    git clone https://github.com/juneb125/.dotfiles <destination> --depth 1
    ```
2. remove this remote repository
    ```
    git remote rm origin
    ```

[^1]: Note that on Darwin, the `-o` option *"is a synonym for the `-s` option (for compatibility with other systems)"*, from uname(1).
