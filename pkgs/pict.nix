{ pkgs, lib, ... }: let
  inherit (pkgs) stdenvNoCC;
in
  stdenvNoCC.mkDerivation {
    name = "pict";
    version = "0.1.0";
    src = pkgs.fetchFromGitHub {
      owner = "juneb125";
      repo = "pict";
      rev = "5a10101d50e7255e951deec71f2b1fb6d0cfe14f";
      hash = "sha256-AVZ/n2k3pcdMKS70rD8B93zqfpGmnRKZRnXxljPw2fQ=";
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
      platforms = lib.platforms.all;
    };
  }
