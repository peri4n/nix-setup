{ pkgs, ... }:

let src = pkgs.fetchFromGitHub {
  owner = "peri4n";
  repo = "wm";
  rev = "9fbd357f06805ac3dd3fabc91e953e5a3e283e2e";
  sha256 = "hknBc0nL/IUcCgimHGi3CotmQvWC6f/gSgQepi1ratM=";
};
in
import "${src}/release.nix"
