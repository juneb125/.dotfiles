{ pkgs, config, ... }: {
  system.primaryUser = "junebergeron";
  system.defaults = {
    finder = {
      AppleShowAllFiles = true;
    };
    # more to come ...
  };
}
