{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    fira-code
    (st.overrideAttrs (oldAttrs: rec {
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      patches = [
        ./settings.diff
        (fetchpatch {
          url = "https://st.suckless.org/patches/dracula/st-dracula-0.8.2.diff";
          sha256 = "ZCQRcd9fNzrlZFyG5TnYSCLyeG3/NBY86ECWhOHWGPM=";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/copyurl/st-copyurl-0.8.4.diff";
          sha256 = "gCuWLFZxyXQmPUVdSCRT11jn+l6/MyFAzr03BA8Qz5Q=";
        })
        ./st-openclipboard-20210802-2ec571.diff
        (fetchpatch {
          url = "https://st.suckless.org/patches/clipboard/st-clipboard-0.8.3.diff";
          sha256 = "y7N2dem0mGg2wZqtrMYWoAbfgcm/OU6eNXPhZPoYZ88=";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/boxdraw/st-boxdraw_v2-0.8.3.diff";
          sha256 = "55+e9AiJ0qaXv5Vzf0mB4oae0lk5bkQaIsuVLqL55Mk=";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/ligatures/0.8.4/st-ligatures-boxdraw-20210824-0.8.4.diff";
          sha256 = "xoKXVfYCnv2QFWeil7zuFQq5kBJoa29Sma/R0AtBLmk=";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/undercurl/st-undercurl-0.8.4-20210822.diff";
          sha256 = "sPsm4cVhoIweYYjOlJ3QLqS3DyjwwwK+SUKJw28bNO0=";
        })
      ];
    }))
  ];
}
