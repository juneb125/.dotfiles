{ ... }: {
  nixpkgs.config.git = {
    enable = true;
    user = {
      name = "June B";
      email = "jrbergeron823" + "@" + "gmail" + "." + "com";
      username = "juneb125";
    };
    aliases = {
      br = "branch";
      cam = "commit -am";
      cl = "clone";
      cm = "commit -m";
      co = "checkout";
      i = "init";
      log = "log --graph";
    };
    # instead of core.excludesFile
    ignores = [
      "**/.DS_Store"
      "*.swp"
      "*.tmp"
    ];
    config = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      # commit.template = "$XDG_CONFIG_HOME/git/template";
      push = {
        default = "current";
        followTags = true;
      };
      pull.default = "current";
      github.name = "juneb125";
      credential.helper = "store";
      url = {
        "https://github.com/" = {
          insteadOf = ["github:"];
        };
      };
    };
  };
}
