# My Nix Config

**Table of Contents**
* [Rebuild Config](#rebuild-config)
* [Structure](#structure)
* [Resources](#resources)

## Rebuild Config
> [!NOTE]
> By default, `nix-darwin` sets your flake's name to your machine's local host name. You can get your machine's local host name using the following shell command:
> ```sh
> scutil --get LocalHostName
> ```
> If your flake name is your local host name, you can omit the `#flake-name` part when rebuilding the configuration.

Rebuild your `nix-darwin` configuration with this command:
```sh
darwin-rebuild switch --flake path/to/flake/home#flake-name

# or if you're already in your flake's home directory:
darwin-rebuild switch --flake .#flake-name
```

## Structure
```
.
├── darwin/
│   └── default.nix
├── lib/
│   └── default.nix
├── modules/
│   ├── shell/
│   │   ├── aliases.nix
│   │   ├── default.nix
│   │   ├── fn.sh
│   │   ├── macos.sh
│   │   ├── starship.nix
│   │   └── zsh.nix
│   ├── cli.nix
│   ├── default.nix
│   ├── git.nix
│   ├── nix.nix
│   └── nvim.nix
├── profiles/
│   └── air.nix
├── shells/
│   ├── config.nix
│   ├── default.nix
│   ├── haskell.nix
│   └── rust.nix
├── README.md
├── flake.lock
├── flake.nix
└── justfile
```
**Explanations**
> excludes all `default.nix` files
* `darwin/` &mdash; darwin-specific modules (mostly just `system.defaults` stuff)
* `lib/` &mdash; useful functions
* `modules/` &mdash; common/shared configuration pieces
    * `shell/` &mdash; shell-related configuration
        * `aliases.nix` &mdash; all of my zsh aliases
        * `fn.sh` &mdash; custom shell functions
        * `macos.sh` &mdash; custom MacOS-specific shell functions
        * `starship.nix` &mdash; starship prompt configuration
        * `zsh.nix` &mdash; semi-nix-ified `.zshrc`
    * `cli.nix` &mdash; where all of the smaller CLI configurations go
    * `git.nix` &mdash; nix-ified `.gitconfig`
    * `nix.nix` &mdash; general nix settings
    * `nvim.nix` &mdash; basically just enables nvim
* `profiles/` &mdash; a place for all the different `configuration.nix` equivalents
    * `air.nix` &mdash; the config associated with the `darwinConfigurations."air"`
* `shells/` &mdash; dev shells
    * `config.nix` &mdash; stuff for this repo (alejandra, just, shellcheck)
    * ( the rest are self-explanatory )
* `README.md` &mdash; the thing you're reading right now :)
* `flake.lock` &mdash; the flake's lockfile
* `flake.nix` &mdash; the flake
* `justfile` &mdash; makes rebuilding & checking the flake *soooo* much easier

## Resources
### Documentation
* the Nix foundation[^1]
    * [home page](https://nixos.org/)
    * [GitHub](https://github.com/NixOS)
* Nix language
    * [documentation](https://nix.dev/manual/nix/2.18/language/)
* Nix package manager (`nixpkgs`)
    <!-- * [`nixpkgs` home page](https://_____) -->
    * [search Nix packages](https://search.nixos.org/packages)
* Nix Flakes
    * [about](https://nix.dev/concepts/flakes)
* Nix Darwin
    * [about](https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file)
    * [GitHub](https://github.com/nix-darwin/nix-darwin)
    * [configuration options](https://nix-darwin.github.io/nix-darwin/manual/index.html)
* MyNixOS Options
    * [set up program-/package-specific settings](https://mynixos.com/options/programs)
    * [set up native MacOS settings](https://mynixos.com/nix-darwin/options)

### Tutorials
**YouTube**
* this amazing tutorial about using [`nixpkgs` as a package manager](https://www.youtube.com/watch?v=Z8BL8mdzWHI) by Dreams of Code

### Awesome Nix Configurations
See <https://github.com/stars/juneb125/lists/awesome-nix-configs> for the full list
* [`isabelroses/dotfiles`](https://github.com/isabelroses/dotfiles)
* [`sioodmy/dotfiles`](https://github.com/sioodmy/dotfiles)
<!-- * [``](https://github.com/) -->

[^1]: the Nix foundation's home page and GitHub account are "nixos.org" and "NixOS", respectively. Both of which are the place where all Nix things are (for their specific platform), not just the NixOS Linux distribution
