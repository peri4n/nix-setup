# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  # currently, there is some friction between sway and gtk:
  # https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
  # the suggested way to set gtk settings is with gsettings
  # for gsettings to work, we need to tell it where the schemas are
  # using the XDG_DATA_DIR environment variable
  # run at the end of sway config
  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure-gtk";
    executable = true;
    text =
      let
        schema = pkgs.gsettings-desktop-schemas;
        datadir = "${schema}/share/gsettings-schemas/${schema.name}";
      in
      ''
        export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
        gsettings set org.gnome.desktop.interface gtk-theme 'Dracula'
        gsettings set org.gnome.desktop.wm.preferences theme "Dracula"
        gsettings set org.gnome.desktop.interface icon-theme "Dracula"
      '';
  };
  # bash script to let dbus know about important env variables and
  # propogate them to relevent services run at the end of sway config
  # see
  # https://github.com/emersion/xdg-desktop-portal-wlr/wiki/"It-doesn't-work"-Troubleshooting-Checklist
  # note: this is pretty much the same as  /etc/sway/config.d/nixos.conf but also restarts  
  # some user services to make sure they have the correct environment variables
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
      systemctl --user import-environment XDG_SESSION_TYPE XDG_CURRENT_DESKTOP
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      systemctl --user restart pipewire wireplumber xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };
in
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware/mars/hardware-configuration.nix
      ./hardware/nvidia.nix
    ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";
  console.useXkbConfig = true;

  # Enable docker
  virtualisation.docker.enable = true;

  # Select internationalisation properties.
  #i18n.defaultLocale = "en_US.utf8";
  #i18n.supportedLocales =  [ "en_US.UTF8/UTF8" "de_DE.UTF8/UTF8" ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.utf8";
    LC_IDENTIFICATION = "de_DE.utf8";
    LC_MEASUREMENT = "de_DE.utf8";
    LC_MONETARY = "de_DE.utf8";
    LC_NAME = "de_DE.utf8";
    LC_NUMERIC = "de_DE.utf8";
    LC_PAPER = "de_DE.utf8";
    LC_TELEPHONE = "de_DE.utf8";
    LC_TIME = "de_DE.utf8";
  };

  services.tlp.enable = true;

  # SSD disk optimisation
  services.fstrim.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.udisks2.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.blueman.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fbull = {
    isNormalUser = true;
    description = "fbull";
    extraGroups = [ "networkmanager" "wheel" "video" "docker" "audio" ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment = {
    variables.EDITOR = "nvim";

    systemPackages = with pkgs; [
      sway
      xwayland
      gammastep
      dbus-sway-environment
      configure-gtk
      glib # gsettings
      dracula-theme # gtk theme
      gnome3.adwaita-icon-theme # default gnome cursors
      swaycons
      swayidle
      swaybg
      swappy
      grim # screenshot functionality
      slurp # screenshot functionality
      kanshi
      wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      wob
      wdisplays
      bemenu # wayland clone of dmenu
      imv
      wshowkeys
      git
      usbutils
      pciutils
      pulseaudio
      lsof

      nmap
      libnotify # notify-send
      networkmanagerapplet

      nixos-option
      inetutils
      globalprotect-openconnect

      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-pipewire-audio-capture
          obs-gstreamer
          obs-backgroundremoval
          input-overlay
          looking-glass-obs
        ];
      })

      mongosh
      qpwgraph
    ];
  };

  services.globalprotect = {
    enable = true;
    settings = {
      "vpn-eu.envision-digital.com" = {
        openconnect-args = "--servercert pin-sha256:r6qE53Ea/kvnKMnktSoZMuCbrvbLlOEUZfAcCOqZ5Lg=";
      };
    };
    # if you need a Host Integrity Protection report
    csdWrapper = "${pkgs.openconnect}/libexec/openconnect/hipreport.sh";
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.sway}/bin/sway --unsupported-gpu";
        user = "fbull";
      };
      default_session = initial_session;
    };
  };

  environment.sessionVariables = {
    BEMENU_OPTS = ''
      --tb '#6272a4' --tf '#f8f8f2' --fb '#282a36' --ff '#f8f8f2' --nb '#282a36' 
      --nf '#6272a4' --hb '#44475a' --hf '#50fa7b' --sb '#44475a' --sf '#50fa7b' 
      --scb '#282a36' --scf '#ff79c6' '';
  };

  # xdg-desktop-portal works by exposing a series of D-Bus interfaces
  # known as portals under a well-known name
  # (org.freedesktop.portal.Desktop) and object path
  # (/org/freedesktop/portal/desktop).
  # The portal interfaces include APIs for file access, opening URIs,
  # printing and others.
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # enable sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraOptions = [ "--unsupported-gpu" ];
  };
  programs.wshowkeys.enable = true;

  programs.light.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
