let
 pkgs = import <nixpkgs> { };
in
 pkgs.haskellPackages.callPackage ./test.nix { }

