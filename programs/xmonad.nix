{ pkgs, ... }:

let src = pkgs.fetchFromGitHub {
  owner = "peri4n";
  repo = "wm";
  rev = "fc6b1b276c6126a5e80fa0fb683c4301256fb4ce";
  sha256 = "n2FNGMKW5+reGGQ8irtpB8M9jK5cdG2acdjU4qDGaPE=";
};
in
import "${src}/release.nix"
