{ config, pkgs, lib, ... }:

let 
  colors = import ../dracula.nix;
in
{
  programs.xmobar = with colors.dracula.hex; {
    enable = true;
    extraConfig = ''
      Config { font = "xft:FiraCode Nerd Font:size=11:antialias=true:hinting=true"
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
             , template = "%StdinReader% }{ %dynnetwork% | %memory% | %battery% | %date%"
             , commands = [
                            Run DynNetwork     [ "--template" , "<fc=${purple}><dev></fc>: <tx> kB/s <rx> kB/s"
                                               , "--Low"      , "1000000"       -- units: B/s
                                               , "--High"     , "5000000"       -- units: B/s
                                               , "--low"      , "white"
                                               , "--normal"   , "orange"
                                               , "--high"     , "#ff8080"
                                               ] 10
                          , Run Memory ["-t","<usedratio>% <fc=${purple}> </fc>"] 10
                          , Run BatteryP ["BAT0"] [
                              "-t", "<fc=${purple}><acstatus></fc> <left>% - <timeleft>",
                              "--",
                              "-O", "\xfba3",
                              "-o", "\xf578",
                              "-h", "green",
                              "-l", "red"
                              ] 10
                          , Run Date "<fc=${orange}> %a %b %d %H</fc>:<fc=${orange}>%M</fc>" "date" 60
                          , Run StdinReader
                          ]
             }
    '';
  };
}
