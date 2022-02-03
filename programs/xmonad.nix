{ pkgs, ... }:

let src = pkgs.fetchFromGitHub {
  owner = "peri4n";
  repo = "wm";
  rev = "f74c857e690293f44a95b2b755003736243504a3";
  sha256 = "lNTjRPXx3yo2DbrCPjekLkWyeHKQ7Fpi6euImDY16PI=";
};
in
import "${src}/release.nix"
