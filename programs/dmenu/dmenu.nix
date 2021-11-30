{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    (dmenu.overrideAttrs (oldAttrs: rec {
      patches = [
        ./settings.diff
        (fetchpatch {
          url = "https://tools.suckless.org/dmenu/patches/fuzzymatch/dmenu-fuzzymatch-4.9.diff";
          sha256 = "000fkg4dcr2vrpd442f2v6ycmmxdml781ziblzx5rxvvyclsryfd";
        })
        ./dmenu-fuzzyhighlight-4.9.diff
        (fetchpatch {
          url = "https://tools.suckless.org/dmenu/patches/numbers/dmenu-numbers-4.9.diff";
          sha256 = "0hrrlpxihbbphm47k02fj51i6w4mic2x2pwvhhr74c9n95ic4qpp";
        })
      ];
    }))
  ];
}
