{ pkgs, ... }:

{
  programs.brave = {
    enable = false;
    extensions = [
      { id = "gfapcejdoghpoidkfodoiiffaaibpaem"; } # Dracula theme
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "chphlpgkkbolifaimnlloiipkdnihall"; } # One tab
    ];
  };
}
