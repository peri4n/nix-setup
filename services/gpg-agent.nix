{ config, pkgs, lib, ... }:

{
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableSshSupport = true;
    pinentryPackage = pkgs.pinentry-tty;
    defaultCacheTtl = 1800;
  };
}

