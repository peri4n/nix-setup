{ config, pkgs, libs, ... }:

{
  home.packages = with pkgs; [
    jetbrains-mono
    (st.overrideAttrs (oldAttrs: rec {
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      patches = [
        ./settings.diff
        (fetchpatch {
          url = "https://st.suckless.org/patches/dracula/st-dracula-0.8.2.diff";
          sha256 = "0zpvhjg8bzagwn19ggcdwirhwc17j23y5avcn71p74ysbwvy1f2y";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/copyurl/st-copyurl-0.8.4.diff";
          sha256 = "03gcc6c2jczk5zi17bfrrv3scf4lyvc7a8apk8pmlf1k1ibqy23a";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/clipboard/st-clipboard-0.8.3.diff";
          sha256 = "1h1nwilwws02h2lnxzmrzr69lyh6pwsym21hvalp9kmbacwy6p0g";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/boxdraw/st-boxdraw_v2-0.8.3.diff";
          sha256 = "0n4n83mffxp8i0c2hfaqabxbqz0as2yxx8v8ll76gxiihqa1hhd2";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/ligatures/0.8.4/st-ligatures-boxdraw-20210824-0.8.4.diff";
          sha256 = "1y9ab758nnknsjff3gdda4v2qhx36inlb9dvhbpayr6d81g6l587";
        })
        (fetchpatch {
          url = "https://st.suckless.org/patches/undercurl/st-undercurl-0.8.4-20210822.diff";
          sha256 = "091ixzrcqzh156zmrmma8wj6js770l8fdx467rkndy3x6hnbrxj3";
        })
      ];
    }))
  ];
}
