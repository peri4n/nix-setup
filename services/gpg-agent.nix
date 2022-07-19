{ config, pkgs, lib, ... }:

{
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableSshSupport = true;
    pinentryFlavor = "tty";
    defaultCacheTtl = 1800;
  };
}

