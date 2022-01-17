{ pkgs, ... }:

let src = pkgs.fetchFromGitHub {
  owner = "peri4n";
  repo = "wm";
  rev = "359e2945b01d8a27159232b1d457a1988f2f6089";
  sha256 = "2OBPftMcl9DT1sfwAbO6WXfM2RjZm4N/GXMaPELnp8g=";
};
in
import "${src}/release.nix"
