{ pkgs, ... }:

{
  programs.brave = {
    enable = true;
    extensions = [
      { id = "gfapcejdoghpoidkfodoiiffaaibpaem"; } # Dracula theme
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "chphlpgkkbolifaimnlloiipkdnihall"; } # One tab
      { id = "gfbliohnnapiefjpjlpjnehglfpaknnc"; } # Surfing Keys
      { id = "ienfalfjdbdpebioblfackkekamfmbnh"; } # Angular
      { id = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp"; } # Privacy Badger
      { id = "bkdgflcldnnnapblkhphbgpggdiikppg"; } # DuckDuckGo
      { id = "bcjindcccaagfpapjjmafapmmgkkhgoa"; } # JSON Formatter
    ];
  };
}
