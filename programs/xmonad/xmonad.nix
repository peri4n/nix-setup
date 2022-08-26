{ pkgs, ... }:
{
  services.xserver = {
    displayManager = {
      defaultSession = "sway";
      lightdm = {
        enable = true;
        background = pkgs.nixos-artwork.wallpapers.dracula.gnomeFilePath;

        extraSeatDefaults = ''
          greeter-show-manual-login=true
          greeter-hide-users=true
        '';

        greeters.gtk = {
          extraConfig = ''
            default-user-image = ${pkgs.nixos-icons}/share/icons/hicolor/64x64/apps/nix-snowflake.png
            position = 50%,center -300,end
          '';

          theme = {
            name = "Dracula";
            package = pkgs.dracula-theme;
          };
        };
      };
    };

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ./Config.hs;
    };
  };
}
