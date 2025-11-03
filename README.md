# My Dotfiles
My personal configuration files

**Table of Contents**
* [Goals](#goals)
* [My Environment](#my-environment)
* [Installation](#installation)

**Quick Links**\
🚧 Section under construction for now 🚧

## Goals
* create comprehensive and easy-to-follow documentation for each major config piece, especially:
    * `zsh` &mdash; shell
    * `nvim` &mdash; text editor
    * `nixpkgs` &mdash; package manager
    * `ghostty` &mdash; terminal emulator

## My Environment
Hardware plays a big part in customization and what works on my machine likely won't work on yours if even a few key things are different.

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

## Installation
**The Steps I Followed**

> [!WARNING]
> for all of the following installation resources, watch the full video, read the whole article, etc. before actually doing any of it!

1. I got started with [this Fireship YouTube tutorial](https://youtube.com/watch?v=r_MpUP6aKiQ) on starting your dotfiles journey
2. Then, I followed [this Dreams of Autonomy video](https://www.youtube.com/watch?v=ud7YxC33Z3w) about further customization of `zsh`
3. Next, I set up Nix Packages (`nixpkgs`) as my package manager with [this amazing Dreams of Autonomy tutorial](https://youtube.com/watch?v=Z8BL8mdzWHI)
4. I set up my text editor, NeoVim, by (roughly) following [this Sylvan Franklin YouTube video](https://www.youtube.com/watch?v=xGkL2N8w0H4) and going from there :)
    <details>
        <summary>my tips on how to learn Vim / NeoVim</summary>
        <ol type="a">
            <li>learn the basic Vim motions (how to move around a file and around a workspace), especially how to exit Vim :)</li>
            <li>turn on "Vim mode" in your current code editor</li>
            <li>when you feel comfortable with the motions, start using Vim (the regular Vim) in your terminal</li>
            <li>when you feel really comfortable using Vim in your terminal, download NeoVim if you want</li>
        </ol>
        <p>Learning Vim might seem super overwhelming, but if you practice consistently, you'll be amazing :)</p>
        <p>I believe in you! <3</p>
    </details>

**Quickstart**\
Prerequisites: git, nix
1. clone this repository using git
    ```
    git clone https://github.com/juneb125/.dotfiles <destination> --depth 1
    ```
2. remove this remote repository
    ```
    git remote rm origin
    ```
