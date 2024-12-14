# My Nix Darwin Config

> [!WARNING]
> At any place in this file, if there is the word "Placeholder" or an underscore, it needs an actual replacement

**Table of Contents**
* [Preface](#preface)
* [Placeholder](#placeholder)
* [Resources](#resources)

## Preface

By default, Nix Darwin sets your flake's name to your machine's local host name (mine is `Junes-MacBook-Air`). You can get your machine's local host name through the following shell command:
```zsh
# what about other shells (e.g., bash, powershell, fsh) ?
# what about other OS's (e.g., Windows, Linux) ?
scutil --get LocalHostName
```
<details>
<summary>More About <code>scutil</code></summary>
<ul>
    <li>Using <code>scutil --get</code>, you can get the values of the following variables:</li>
    <ul>
        <li><code>ComputerName</code></li>
        <li><code>LocalHostName</code></li>
        <li><code>HostName</code></li>
    </ul>
</ul>
<p>you can get the value of each of these variables using a <code>for</code> loop in bash/zsh:</p>
```
for var in ComputerName LocalHostName HostName; do
    scutil --get $var

    # or, if you want it formatted (w/ labels)...
    echo "$var is $(scutil --get $var)"
done
```
``````
</details>

## Placeholder
...

## Resources
### Documentation
* [Nix home page](https://nixos.org/)
    * [GitHub](https://github.com/NixOS)
* Nix Language
    * [documentation](https://nix.dev/manual/nix/2.18/language/)
* Nix package manager (`nixpkgs`)
    * [`nixpkgs` home page](https://_____)
    * [search Nix packages](https://search.nixos.org/packages)
* Nix Flakes
    * [about](https://nix.dev/concepts/flakes)
* Nix Darwin
    * [about](https://_____)
    * [GitHub](https://github.com/______)

### Tutorials
**Placeholder**
* setting up MacOS settings with [Nix Darwin options](https://mynixos.com/nix-darwin/options)
* setting up `program` settings with [NixOS options](https://mynixos.com/options/programs)

**YouTube**
* this amazing tutorial about using [`nixpkgs` as a package manager](https://www.youtube.com/watch?v=Z8BL8mdzWHI) by  Dreams of Code

