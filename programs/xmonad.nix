{ pkgs, ... }:

let src = pkgs.fetchFromGitHub {
  owner = "peri4n";
  repo = "wm";
  rev = "fc6b1b276c6126a5e80fa0fb683c4301256fb4ce";
  sha256 = "hknBc0nL/IUcCgimHGi3CotmQvWC6f/gSgQepi1ratM=";
};
in
import "${src}/release.nix"
