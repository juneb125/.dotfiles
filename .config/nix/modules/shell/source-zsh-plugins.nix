{ pkgs, ... }:
pkgs.writeShellScriptBin "source-zsh-plugins" ''
  source ${pkgs.zsh-syntax-highlighting}/bin/zsh-syntax-highlighting
  source ${pkgs.zsh-autocomplete}/bin/zsh-autocomplete
  source ${pkgs.zsh-autosuggestions}/bin/zsh-autosuggestions
  source ${pkgs.zsh-autopair}/bin/zsh-autopair
''
