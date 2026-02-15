{ ... }: {
  nixpkgs.config.git = {
    enable = true;
    # instead of core.excludesFile
    ignores = [
      "**/.DS_Store"
      "*.swp"
      "*.tmp"
    ];
    settings = {
      user = {
        name = "June B";
        email = "jrbergeron823" + "@" + "gmail" + "." + "com";
        username = "juneb125";
      };
      init.defaultBranch = "main";
      alias = {
        br = "branch";
        cam = "commit -am";
        cl = "clone";
        cm = "commit -m";
        co = "checkout";
        i = "init";
        log = "log --graph";
      };
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
        "git@github.com".insteadOf = ["github" "gh"];
      };
    };
  };
}
