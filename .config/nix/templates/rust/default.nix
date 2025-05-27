{ rustPlatform }:
rustPlatform.buildRustPackage {
  pname = "rust-template";
  version = "0.1.0";
  src = ./.;
  cargoLock.lockFile = ./Cargo.lock;
}
