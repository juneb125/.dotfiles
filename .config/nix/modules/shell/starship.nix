{ pkgs, config, ... }: {
  nixpkgs.config.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      format = ''
        $directory $git_branch$git_status
        $character
      ''; # PS1
      right_format = "$cmd_duration"; # RPROMPT
      continuation_prompt = "| "; # PS2

      palette = "ansi";
      character = {
        success_symbol = "\n[❯](fg:magenta)";
        error_symbol = "\n[❯](fg:red)";
      };

      directory = {
        truncation_length = 3;
        truncation_symbol = "";
        format = "[$path](fg:blue)";
      };

      git_branch.format = "[$branch](fg:git_gray)";
      git_status = {
        ahead = "↑";
        behind = "↓";
        modified = "*";
        format = "[$modified $ahead_behind](fg:git_gray)";
      };

      cmd_duration = {
        min_time = 2000;
        show_milliseconds = false;
        format = "[$duration](fg:yellow)";
      };

      package.disabled = true;

      palettes.ansi = {
        # ANSI (reassigned by Catppuccin Macchiato)
        # black = "0"
        red = "1";
        # green = "2"
        yellow = "3";
        blue = "4";
        magenta = "5";
        # cyan = "6"
        # white = "7"
        # gray = "8"
        # just for the foreground of git stuff
        git_gray = "#6c6c6c";
      };
    };
  };
}
