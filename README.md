# My Dotfiles
My personal configuration files

**Table of Contents**
* [Goals](#goals)
* [Intro to Dotfiles](#intro-to-dotfiles)
* [My Environment](#my-environment)
* [Installation](#installation)

## Goals
* create comprehensive documentation for each major config piece, especially:
    * `zsh` &mdash; shell configuration
    * `nvim` &mdash; code editor
    * `nixpkgs` &mdash; package manager
    * `nix-darwin` &mdash; (i honestly don't know how to describe this simply)
* j

## Intro to Dotfiles
If you don't know what dotfiles are or have little to no experience configuring your environment, you're in luck :)<br/>

* dotfiles are files or directories (aka folders) that begin with a period
* the primary use of dotfiles are to configure, customize, or personalize user, system, or app preferances / settings
* these kinds of files are usually hidden from the user, as the majority of PC, desktop, or laptop users don't personalize their device with code 

## My Environment
Hardware plays a big part in customization and what works on my machine likely won't work on yours if even a few key things are different.

What I'm using:
* *device* &mdash; MacBook Air M1 (2020)
* *operating system* &mdash; MacOS 15.1 (Sequoia)
* *terminal emulator* &mdash; Warp Terminal (I'm going to switch to Ghostty as soon as the public beta is released)
<details>
    <summary>languages I work / have worked with:</summary>
    <ul>
        <li>Rust (most recent)</li>
        <li>Lua[^1]</li>
        <li>Nix[^1]</li>
        <li>HTML5 & CSS3</li>
        <li>JavaScript</li>
        <li>TypeScript</li>
        <li>React (JSX and TSX)</li>
        <li>Swift & SwiftUI</li>
        <li>bash</li>
        <li>Markdown</li>
        <li>JSON, YAML, and TOML</li>
    </ul>
</details>

## Installation
I've seen other people's dotfiles have this section, so yeah. If you somehow come across this repo, I *highly* encourage you to build your own setup, rather than import someone else's, but I'm absolutely okay with you taking inspiration from here :)<br/>

> [!WARNING]
> for all of the following installation resources, watch the full video, read the whole article, etc. before actually doing any of it!

1. I got started with [this Fireship YouTube tutorial](https://youtube.com/watch?_____) on starting your dotfiles journey
2. Next, I set up using Nix Packages as a package manager with [this amazing Dreams of Code tutorial](https://youtube.com/watch?_____) - Warning: the Nix ecosystem is a *huge* rabbithole, so be advised!
3. Then, I set up my code editor, NeoVim, by following [this Typecraft YouTube playlist](https://youtube.com/______)
    <details>
        <summary>my tips on how to learn Vim / NeoVim</summary>
        <ol>
            <li> learn the basic Vim motions (how to move around a file and around a workspace), especially how to exit Vim :)</li>
            <li> turn on "Vim mode" in your current code editor</li>
            <li> when you feel comfortable with the motions, start using Vim (the regular Vim) in your terminal</li>
            <li> when you feel really comfortable using Vim in your terminal, download NeoVim if you want</li>
        </ol>

        Learning Vim might seem super overwhelming, but if you practice consistently, you'll be amazing :)<br/>
        I believe in you! <3
    </details>

If you want the easy way out:
1. install Nix from [here](https://_____)
2. clone this repository using git
    ```
    git clone https://github.com/juneb125/.dotfiles ___ --depth 1
    ```
<br/>
<hr/>
[^1] I've only used Lua for my NeoVim setup and Nix for my Nix Darwin setup
