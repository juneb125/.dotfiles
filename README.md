# My Dotfiles
My personal configuration files

**Table of Contents**
* [Goals](#goals)
* [Intro to Dotfiles](#intro-to-dotfiles)
* [My Environment](#my-environment)
* [Installation](#installation)

**Quick Links**
* [zsh](https://github.com/juneb125/.dotfiles/tree/main/.zshrc)
* [NeoVim](https://github.com/juneb125/.dotfiles/tree/main/.config/nvim)
* [Nix](https://github.com/juneb125/.dotfiles/tree/main/.config/nix-darwin)

## Goals
* create comprehensive and easy-to-follow documentation for each major config piece, especially:
    * `zsh` &mdash; shell
    * `nvim` &mdash; code editor
    * `nixpkgs` &mdash; package manager
    * `ghostty` &mdash; terminal emulator

## Intro to Dotfiles
If you don't know what dotfiles are or have little to no experience configuring your environment, you're in luck :)<br/>
* dotfiles are files or directories (aka folders) that begin with a period
* the primary use of dotfiles are to configure, customize, or personalize user, system, or app preferances / settings
* these kinds of files are usually hidden from the user, as the majority of PC, desktop, or laptop users don't personalize their device with code 

## My Environment
Hardware plays a big part in customization and what works on my machine likely won't work on yours if even a few key things are different.

What I'm using:
* *device* &mdash; MacBook Air M1 (2020)
* *operating system* &mdash; MacOS 15.2 (Sequoia)
* *terminal emulator* &mdash; Ghostty
* *package manager* &mdash; `nixpkgs` (versions 24.11 and unstable)
* *languages I've been working with*:
    * Rust
    * TOML
    * Markdown
    * bash
    * Lua[^1] & Nix[^2]
    <details>
        <summary>other languages I've worked with:</summary>
        <ul>
            <li>HTML5 & CSS3</li>
            <li>JavaScript</li>
            <li>TypeScript</li>
            <li>React (JSX and TSX)</li>
            <li>Swift & SwiftUI</li>
            <li>JSON & YAML</li>
        </ul>
    </details>

## Installation
I've seen other people's dotfiles have this section, so yeah. If you somehow come across this repo, I *highly* encourage you to build your own setup, rather than import someone else's, but I'm absolutely okay with you taking inspiration from here :)<br/>

> [!WARNING]
> for all of the following installation resources, watch the full video, read the whole article, etc. before actually doing any of it!

1. I got started with [this Fireship YouTube tutorial](https://youtube.com/watch?v=r_MpUP6aKiQ) on starting your dotfiles journey
2. Next, I set up Nix Packages (`nixpkgs`) as my package manager with [this amazing Dreams of Autonomy tutorial](https://youtube.com/watch?v=Z8BL8mdzWHI) - Warning: the Nix ecosystem is a *huge* rabbithole, so be advised!
3. Then, I set up my code editor, NeoVim, by following [this amazing Typecraft YouTube playlist](https://www.youtube.com/playlist?list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn)
    <details>
        <summary>my tips on how to learn Vim / NeoVim</summary>
        <ol>
            <li> learn the basic Vim motions (how to move around a file and around a workspace), especially how to exit Vim :)</li>
            <li> turn on "Vim mode" in your current code editor</li>
            <li> when you feel comfortable with the motions, start using Vim (the regular Vim) in your terminal</li>
            <li> when you feel really comfortable using Vim in your terminal, download NeoVim if you want</li>
        </ol>
        <p>Learning Vim might seem super overwhelming, but if you practice consistently, you'll be amazing :)</p>
        <p>I believe in you! <3</p>
    </details>

If you want the easy way out:
1. install Nix from [here](https://nixos.org/download/)
2. clone this repository using git
    ```
    git clone https://github.com/juneb125/.dotfiles ___ --depth 1
    ```
3. remove this remote repository
    ```
    git remote rm origin
    ```
4. remove all of this repo's git commits
    ```
    rm -rf ./.git/
    ```
<hr/>
<br/>
[^1] I've only used Lua for my NeoVim setup
[^2] I've only used Nix for my Nix Darwin setup
