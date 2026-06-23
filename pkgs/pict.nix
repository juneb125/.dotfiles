{ pkgs, lib, ... }: let
  inherit (pkgs) stdenvNoCC;
in
  stdenvNoCC.mkDerivation {
    name = "pict";
    version = "0.1.0";
    src = pkgs.fetchFromGitHub {
      owner = "juneb125";
      repo = "pict";
      rev = "f2f72da39bec77ebc1768749002115de3d7a6b62";
      hash = "sha256-E4wqSsbjwMN9cLSgjQOza3bI6u1QilFGzzT8ook/L/0=";
    };

    buildPhase = "";
    installPhase = ''
      mkdir -p $out/bin
      cp pict $out/bin/pict
      chmod +x $out/bin/pict
    '';

    meta = {
      description = "C project initializer";
      homepage = "https://github.com/juneb125/pict";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ juneb125 ];
    };
  }
