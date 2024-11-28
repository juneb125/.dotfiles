# My Dotfiles
My personal configuration files

**Table of Contents**
* [Goals](#goals)
* [Intro to Dotfiles](#intro-to-dotfiles)
* [My Environment](#my-environment)
* [Installation](#installation)

## Goals
* create comprehensive documentation for each major config piece, especially:
    * `.zshrc` &mdash; shell configuration
    * `nvim` &mdash; code editor
    * `nix-darwin` &mdash; (i honestly don't know how to describe this simply)
* j

## Intro to Dotfiles
If you don't know what dotfiles are or have little to no experience configuring your environment, you're in luck :)<br/>

* dotfiles are files or directories (aka folders) that begin with a period
* the primary use of dotfiles are to configure, customize, or personalize user, system, or app preferances / settings
* these kinds of files are usually hidden from the user, as the majority of PC, desktop, or laptop users don't personalize their device with code 
* j

## My Environment
Hardware plays a big part in customization and what works on my machine likely won't work on yours if even a few key things are different.

What I'm using:
* *device* &mdash; MacBook Air M1 (2020)
* *operating system* &mdash; MacOS 15.1 (Sequoia)
* *terminal emulator* &mdash; Warp Terminal (I'm going to switch to Ghostty as soon as the public beta is released)
<details>
<summary>languages I work / have worked with:</summary>
    * Rust (most recent)
    * Lua[^1]
    * Nix[^1]
    * HTML5 & CSS3
    * JavaScript
    * TypeScript
    * React (JSX and TSX)
    * Swift & SwiftUI
    * bash
    * Markdown
    * JSON, YAML, and TOML
</details>

## Installation
I've seen other people's dotfiles have this section, so yeah. If you somehow come across this repo, I *highly* encourage you to build your own setup, rather than import someone else's, but I'm absolutely okay with you taking inspiration from here :)<br/>

> [!WARNING]
> for all of the following installation resources, watch the full video, read the whole article, etc. before actually doing any of it!

1. I got started with [this Fireship YouTube tutorial](https://youtube.com/watch?_____) on starting your dotfiles journey
2. Next, I set up using Nix Packages as a package manager with [this amazing Dreams of Code tutorial](https://youtube.com/watch?_____) - Warning!: Nix is a *huge* rabbithole, so be advised!
3. Then, I set up my code editor, NeoVim, by following [this Typecraft YouTube playlist](https://youtube.com/______)
    <details>
    <summary>my tips on how to learn Vim / NeoVim</summary>
    1. learn the basic Vim motions (how to move around a file and around a workspace), especially how to exit Vim :)
    2. turn on "Vim mode" in your current code editor
    3. when you feel comfortable with the motions, start using Vim (the regular Vim) in your terminal
    4. when you feel really comfortable using Vim in your terminal, download NeoVim if you want

    Learning Vim might seem super overwhelming, but if you practice consistently, you'll be amazing :)<br/>
    I believe in you! <3
    </details>

If you want the easy way out, just clone this repository using `git clone` (git is required if you want to go this way)
<br/>
<hr/>
<br/>
[^1] I've only used Lua for my NeoVim setup and Nix for my Nix Darwin setup
