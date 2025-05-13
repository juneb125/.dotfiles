# My Nix Config

**Table of Contents**
* [Rebuild Config](#rebuild-config)
* [Structure](#structure)
* [Resources](#resources)

## Rebuild Config
> [!NOTE]
> By default, `nix-darwin` sets your flake's name to your machine's local host name. You can get your machine's local host name using the following shell command:
> ```bash
> # MacOS
> scutil --get LocalHostName
>
> # Linux
> hostname
> ```
> If your flake name is your local host name, you can omit the `#flake-name` part when rebuilding the configuration.

Rebuild your `nix-darwin` configuration with this command:
```bash
darwin-rebuild switch --flake path/to/flake/home#flake-name

# or if you're already in your flake's home directory:
darwin-rebuild switch --flake .#flake-name
```

## Structure
<!--
```
nix
├── darwin/
|   ├── default.nix
|   └── ...
├── modules/
|   ├── shell/
|   |   ├── aliases.nix
|   |   ├── default.nix
|   |   ├── starship.nix
|   |   ├── zsh.nix
|   |   └── ...
|   ├── default.nix
|   ├── git.nix
|   ├── nvim.nix
|   └── ...
├── README.md
├── config.nix
├── flake.lock
└── flake.nix
```
-->
Explanations\
| excludes all `default.nix` files
* `darwin/` &mdash; darwin-specific modules (mostly just `system.defaults` stuff)
* `modules/` &mdash; common configuration pieces
    * `shell/` &mdash; shell-related configuration
        * `aliases.nix` &mdash; all of my zsh aliases
        * `starship.nix` &mdash; starship prompt configuration
        * `zsh.nix` &mdash; (basically) nix-ified `.zshrc`
    * `git.nix` &mdash; nix-ified `.gitconfig`
    * `nvim.nix` &mdash; basically just enable nvim & set `vi` and `vim` to aliases to `nvim`
* `README.md` &mdash; the thing you're reading right now :)
* `config.nix` &mdash; my main configuration
* `flake.lock` &mdash; the lockfile
* `flake.nix` &mdash; the flake

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
* this amazing tutorial about using [`nixpkgs` as a package manager](https://www.youtube.com/watch?v=Z8BL8mdzWHI) by  Dreams of Code

[^1]: the Nix foundation's home page and GitHub account are "nixos.org" and "NixOS", respectively. Both of which are the place where all Nix things are (for their specific platform), not just the NixOS Linux distribution
