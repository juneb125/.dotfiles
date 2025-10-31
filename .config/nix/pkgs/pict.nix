{ pkgs, lib, ... }: let
  inherit (pkgs) stdenv just;
in
  stdenv.mkDerivation {
    pname = "pict";
    version = "0.1.0";
    src = pkgs.fetchFromGitHub {
      owner = "juneb125";
      repo = "pict";
      rev = "08423ca60a0fb98d4807530601f16ad3db702f41";
      hash = "sha256-S9MW6rVTrTcMKvLZBp+fqVCWn9h7KcOCE9ZcUhJaUaw=";
    };

    buildInputs = [just];
    buildPhase = ''
      ${just}/bin/just clean
    '';
    installPhase = ''
      mkdir -p $out/bin
      ${just}/bin/just build $out/bin/pict
      chmod +x $out/bin/pict
    '';

    meta = {
      description = "C project initializer";
      homepage = "https://github.com/juneb125/pict";
      license = lib.licenses.mit;
      platforms = lib.platforms.all;
    };
  }
