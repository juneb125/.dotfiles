# My Dotfiles
My personal configuration files

**Table of Contents**
* [My Environment](#my-environment)
* [Installation](#installation)

**Quick Links**
* [zsh](./sources/zsh)
* [nvim](./sources/nvim)
* [ghostty](./sources/ghostty)

## My Environment
What I'm using:
* *device* &mdash; MacBook Air M1 (2020)
* *operating system* &mdash; MacOS 15 (Sequoia)
* *terminal emulator* &mdash; Ghostty
* *shell* &mdash; `zsh`
* *package manager* &mdash; `nixpkgs` (25.11)
* *editor* &mdash; `nvim` nightly (see [`./sources/nvim/README.md`](./sources/nvim/README.md) for more information)
* *languages I've been working with*:
    * C
    * Rust
    * Nix
    * Markdown
* *system information*[^1]: (split up, with annotations)
    ```sh
    $ uname -a
    arm64                    # -m
    Junes-MacBook-Air.local  # -n
    arm                      # -p
    24.6.0                   # -r
    Darwin                   # -s
    # -v
    Darwin Kernel Version 24.6.0: # ...
    ```

## Installation
**The Steps I Followed**

> [!WARNING]
> for all of the following installation resources, watch the full video, read the whole article, etc. before actually doing any of it!

1. I got started with [this Fireship YouTube tutorial](https://youtube.com/watch?v=r_MpUP6aKiQ) on starting your dotfiles journey
2. Then, I followed [this Dreams of Autonomy video](https://www.youtube.com/watch?v=ud7YxC33Z3w) about further customization of `zsh`
3. Next, I set up Nix Packages (`nixpkgs`) as my package manager with [this amazing Dreams of Autonomy tutorial](https://youtube.com/watch?v=Z8BL8mdzWHI)
4. I set up my text editor, NeoVim, by (roughly) following [this Sylvan Franklin YouTube video](https://www.youtube.com/watch?v=xGkL2N8w0H4) and going from there :)

[^1]: Note that on Darwin, the `-o` option *"is a synonym for the `-s` option (for compatibility with other systems)"*, from uname(1).
