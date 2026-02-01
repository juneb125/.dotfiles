{ pkgs, config, ... }: {
  nixpkgs.config.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # Inserts a blank line between shell prompts
      add_newline = true;
      format = "$directory $git_branch$git_status\n$character"; # PS1
      right_format = "$cmd_duration"; # RPROMPT
      continuation_prompt = "| "; # PS2

      # Custom palette for storing color variables
      palette = "vars";
      # just for the foreground of git stuff
      palettes = {
        vars.git_gray = "$6c6c6c";
      };

      # Disable the package module, hiding it from the prompt completely
      package.disabled = true;

      character = {
        # 'purple' is more of a pale pink with Catppuccin Macchiato
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
      };

      directory = {
        truncation_length = 3;
        truncation_symbol = "";
        format = "[$path](blue)";
      };

      git_branch.format = "[$branch](git_gray)";
      git_status = {
        ahead = "↑";
        behind = "↓";
        modified = "*";
        format = "[$modified $ahead_behind](git_gray)";
      };

      cmd_duration = {
        min_time = 2000;
        show_milliseconds = false;
        format = "[$duration](yellow)";
      };
    };
  };
}
