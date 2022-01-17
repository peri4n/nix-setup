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
in
{
  programs.autorandr = {
    enable = true;
    profiles = {
      laptop = {
        fingerprint = {
          DP-1 = homeScreen;
          eDP-1 = laptopScreen;
        };
        config = {
          DB-1.enable = false;
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
        fingerprint = {
          DP-1 = homeScreen;
          eDP-1 = laptopScreen;
        };
        config = {
          eDB-1.enable = false;
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
    };
  };
}
