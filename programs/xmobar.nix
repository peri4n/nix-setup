{ config, pkgs, lib, ... }:

let 
  colors = import ../dracula.nix;
in
{
  programs.xmobar = with colors.dracula.hex; {
    enable = true;
    extraConfig = ''
      Config { font = "xft:FiraCode Nerd Font:size=10:antialias=true:hinting=true"
             , additionalFonts = []
             , borderColor = "black"
             , border = TopB
             , bgColor = "${background}"
             , fgColor = "${foreground}"
             , alpha = 255
             , position = Top
             , textOffset = -1
             , iconOffset = -1
             , lowerOnStart = True
             , pickBroadest = False
             , persistent = False
             , hideOnStart = False
             , iconRoot = "."
             , allDesktops = True
             , overrideRedirect = True
             , alignSep = "}{"
             , template = "%StdinReader% }{ %dynnetwork% | %memory% %battery% | %date%"
             , commands = [
                          -- network activity monitor (dynamic interface resolution)
                            Run DynNetwork     [ "--template" , "<fc=${purple}><dev></fc>: <tx> kB/s <rx> kB/s"
                                               , "--Low"      , "1000000"       -- units: B/s
                                               , "--High"     , "5000000"       -- units: B/s
                                               , "--low"      , "white"
                                               , "--normal"   , "orange"
                                               , "--high"     , "#ff8080"
                                               ] 10
                          , Run Memory ["-t","<fc=${purple}>\xf85a</fc> <usedratio>%"] 10
                          , Run BatteryP ["BAT0"] [
                              "-t", "<fc=${purple}><acstatus></fc> <left>% - <timeleft>",
                              "--",
                              --"-c", "charge_full",
                              "-O", "\xfba3",
                              "-o", "\xf578",
                              "-h", "green",
                              "-l", "red"
                              ] 10
                          , Run Date "<fc=${orange}>%a %b %d %H</fc>:<fc=${orange}>%M</fc>" "date" 60
                          , Run StdinReader
                          ]
             }
    '';
  };
}
