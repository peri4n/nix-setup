{ mkDerivation, base, containers, lib, time, X11, xmonad
, xmonad-contrib
}:
mkDerivation {
  pname = "xmonad-testing";
  version = "0.13";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base containers time X11 xmonad xmonad-contrib
  ];
  homepage = "http://xmonad.org";
  description = "XMonad Testing Repository";
  license = lib.licenses.bsd2;
}
