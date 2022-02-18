{ pkgs, ... }:

{
  programs.brave = {
    enable = true;
    extensions = [
      { id = "gfapcejdoghpoidkfodoiiffaaibpaem"; } # Dracula theme
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "chphlpgkkbolifaimnlloiipkdnihall"; } # One tab
    ];
  };
}
