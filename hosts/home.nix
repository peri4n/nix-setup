# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  colors = import ../themes/dracula.nix;
  homeManagerSessionVars =
    "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh";
in {
  imports = [
    # Include the results of the hardware scan.
    ../hardware/home/hardware-configuration.nix
  ];

  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.tmp = {
    useTmpfs = true;
    cleanOnBoot = true;
  };

  hardware.keyboard.qmk.enable = true;

  hardware.rtl-sdr.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-compute-runtime
      amdvlk
      rtl-sdr
    ];
  };

  networking.hostName = "home"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.extraHosts = ''
    10.100.157.4   	ems-device-identity-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.5   	ems-controller-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.8   	ccoe-sonarqube-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.9   	ems-oscitool-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.10  	ems-wallbox-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.11  	ems-firmwareupdate-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.13  	ems-remote-console-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.14  	newsenec-portal-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.17  	ems-maintenance-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.18  	license-service-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.21  	islandmode-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.22  	pip-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.23  	ems-config-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.24  	ems-status-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.27   sg-ready-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.28  	battery-psql-eds-pg-01.postgres.database.azure.com
    10.100.157.33   v123-firmwareupdate-service-psql-eds-pg-01.postgres.database.azure.com
  '';

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

  # SSD disk optimisation
  services.fstrim.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.udisks2.enable = true;

  # Enable sound with pipewire.
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
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "docker"
      "audio"
      "dialout"
      "tty"
      "plugdev"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;

      # You can find the values at:
      # https://ithub.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
      highlighters = [ "main" "cursor" ];
      styles = with colors.dracula.hex; {
        # comments
        comment = "fg=${comment}";

        # functions/methods
        alias = "fg=${green}";
        suffix-alias = "fg=${green}";
        global-alias = "fg=${green}";
        function = "fg=${green}";
        command = "fg=${green}";
        precommand = "fg=${green}, italic";
        autodirectory = "fg=${orange}, italic";
        single-hyphen-option = "fg=${orange}";
        double-hyphen-option = "fg=${orange}";
        back-quoted-argument = "fg=${purple}";

        # builtins
        builtin = "fg=${cyan}";
        reserved-word = "fg=${cyan}";
        hashed-command = "fg=${cyan}";

        # punctuation
        commandseparator = "fg=${pink}";
        command-substitution-delimiter = "fg=${foreground}";
        command-substitution-delimiter-unquoted = "fg=${foreground}";
        process-substitution-delimiter = "fg=${foreground}";
        back-quoted-argument-delimiter = "fg=${pink}";
        back-double-quoted-argument = "fg=${pink}";
        back-dollar-quoted-argument = "fg=${pink}";

        # strings
        command-substitution-quoted = "fg=${yellow}";
        command-substitution-delimiter-quoted = "fg=${yellow}";
        single-quoted-argument = "fg=${yellow}";
        single-quoted-argument-unclosed = "fg=${red}";
        double-quoted-argument = "fg=${yellow}";
        double-quoted-argument-unclosed = "fg=${red}";
        rc-quote = "fg=${yellow}";

        # variables
        dollar-quoted-argument = "fg=${foreground}";
        dollar-quoted-argument-unclosed = "fg=${red}";
        dollar-double-quoted-argument = "fg=${foreground}";
        assign = "fg=${foreground}";
        named-fd = "fg=${foreground}";
        numeric-fd = "fg=${foreground}";

        # no in spec
        unknown-token = "fg=${red}";
        path = "fg=${foreground}";
        path_pathseparator = "fg=${pink}";
        path_prefix = "fg=${foreground}";
        path_prefix_pathseparator = "fg=${pink}";
        globbing = "fg=${foreground}";
        history-expansion = "fg=${purple}";

        back-quoted-argument-unclosed = "fg=${red}";
        redirection = "fg=${foreground}";
        arg0 = "fg=${foreground}";
        default = "fg=${foreground}";
        cursor = "standout";
      };
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];

  environment = {
    variables.EDITOR = "nvim";

    systemPackages = with pkgs; [
      swaycons
      swappy
      grim # screenshot functionality
      slurp # screenshot functionality
      wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
      wob
      wdisplays
      tela-icon-theme
      imv
      wshowkeys
      usbutils
      pciutils
      pulseaudio
      lsof
      xdg-utils

      nmap

      nixos-option
      inetutils

      qpwgraph
    ];
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

  environment.extraInit =
    "[[ -f ${homeManagerSessionVars} ]] && source ${homeManagerSessionVars}";

  systemd.services.nginx.serviceConfig.ProtectHome = "read-only";
  systemd.services.phpfpm.serviceConfig.ProtectHome = "read-only";

  services.nginx = {
    enable = true;
    user = "fbull";
    virtualHosts."internal-monitoring.org" = {
      root = "/var/www/html";
      locations."/" = { index = "index.php index.html index.htm"; };
      locations."~ \\.php$" = {
        extraConfig = ''
          try_files $uri /index.html index.php;

          fastcgi_split_path_info ^(.+\.php)(/.+)$;

          fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
          fastcgi_index index.php;

          include ${pkgs.nginx}/conf/fastcgi_params;
          include ${pkgs.nginx}/conf/fastcgi.conf;
        '';
      };
    };
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    ensureUsers = [{
      name = "fbull";
      ensurePermissions = { "*.*" = "ALL PRIVILEGES"; };
    }];
  };

  services.phpfpm.pools.mypool = {
    user = "nobody";
    settings = {
      "pm" = "dynamic";
      "listen.owner" = config.services.nginx.user;
      "pm.max_children" = 5;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 1;
      "pm.max_spare_servers" = 3;
      "pm.max_requests" = 500;

      "php_admin_value[error_log]" = "stderr";
      "php_admin_flag[log_errors]" = true;
      "catch_workers_output" = true;
    };
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
    extraPortals = [ pkgs.xdg-desktop-portal-wlr pkgs.xdg-desktop-portal-gtk ];
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
