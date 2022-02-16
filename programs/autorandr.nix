{ pkgs, ... }:

let
  homeScreen =
    "00ffffffffffff001e6df676dc8701000c1c010380502278eaca95a6554ea1260f50542108007" +
    "140818081c0a9c0b300d1c081000101e77c70a0d0a0295030203a00204f3100001a9d6770a0d0" +
    "a0225030203a00204f3100001a000000fd00383d1e5a20000a202020202020000000fc004c472" +
    "0554c545241574944450a01a402031ef12309070749100403011f13595a128301000067030c00" +
    "100038409f3d70a0d0a0155030203a00204f3100001a7e4800e0a0381f4040403a00204f31000" +
    "018011d007251d01e206e285500204f3100001e8c0ad08a20e02d10103e9600204f3100001800" +
    "0000ff003831324e54514432593331360a0000000000000023";
  laptopScreen =
    "00ffffffffffff004d109a1400000000041c0104a52213780ede50a3544c99260f50540000000" +
    "1010101010101010101010101010101ac3780a070383e403020350058c2100000180000000000" +
    "00000000000000000000000000000000fe00544b365237804c513135364d31000000000002410" +
    "328001200000a010a2020002b";
  officeLeftScreen =
    "00ffffffffffff0010aca4a04c3734370f19010380351e78ee7e75a755529c270f5054a54b007" +
    "14f8180a9c0a940d1c0010101010101023a801871382d40582c45000f282100001e000000ff00" +
    "33343135583534393734374c0a000000fc0044454c4c205532343134480a20000000fd00384c1" +
    "e5311000a20202020202001de02031ff14c9005040302071601141f12132309070765030c0010" +
    "0083010000023a801871382d40582c45000f282100001e011d8018711c1620582c25000f28210" +
    "0009e011d007251d01e206e2855000f282100001e8c0ad08a20e02d10103e96000f2821000018" +
    "00000000000000000000000000000000000000000000000037";
  officeRightScreen =
    "00ffffffffffff0010aca2a04c31573018190104a5351e783e7e75a755529c270f5054a54b007" +
    "14f8180a9c0a940d1c0010101010101023a801871382d40582c45000f282100001e000000ff00" +
    "33343135583536423057314c0a000000fc0044454c4c205532343134480a20000000fd00384c1" +
    "e5311000a202020202020012a020319f14c9005040302071601141f1213230907078301000002" +
    "3a801871382d40582c45000f282100001e011d8018711c1620582c25000f282100009e011d007" +
    "251d01e206e2855000f282100001e8c0ad08a20e02d10103e96000f2821000018000000000000" +
    "000000000000000000000000000000000000000000000000c1";
  screens = {
    DP-1 = homeScreen;
    eDP-1 = laptopScreen;
    DP-1-1 = officeLeftScreen;
    DP-1-2 = officeRightScreen;
  };
in
{
  programs.autorandr = {
    enable = true;
    profiles = {
      laptop = {
        fingerprint = screens;
        config = {
          DP-1.enable = false;
          DP-1-1.enable = false;
          DP-1-2.enable = false;
          eDP-1 = {
            enable = true;
            primary = true;
            crtc = 0;
            mode = "1920x1080";
            position = "0x0";
            rate = "60.00";
          };
        };
      };
      home = {
        fingerprint = screens;
        config = {
          eDB-1.enable = false;
          DP-1-1.enable = false;
          DP-1-2.enable = false;
          DP-1 = {
            enable = true;
            primary = true;
            crtc = 0;
            mode = "3440x1440";
            position = "0x0";
            rate = "49.99";
          };
        };
      };
      office = {
        fingerprint = screens;
        config = {
          eDB-1.enable = false;
          DP-1.enable = false;
          DP-1-1 = {
            enable = true;
            crtc = 1;
            gamma = "1.0:0.909:0.833";
            mode = "1920x1080";
            position = "0x0";
            rate = "60.00";
          };
          DP-1-2 = {
            enable = true;
            crtc = 2;
            gamma = "1.0:0.909:0.833";
            mode = "1920x1080";
            position = "1920x0";
            rate = "60.00";
            rotate = "left";
          };
        };
      };
    };
  };
}
