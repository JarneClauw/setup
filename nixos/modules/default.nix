##
## MODULES
##

{ lib, ... }: {
  imports = [
    ./bluetooth.nix
    ./fonts.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./printer.nix
    ./sound.nix
    ./touchpad.nix
  ];

  moduleBluetooth.enable = lib.mkDefault false;
  moduleFonts.enable = lib.mkDefault true;
  moduleLocale.enable = lib.mkDefault true;
  moduleNetwork.enable = lib.mkDefault true;
  moduleNix.enable = lib.mkDefault true;
  modulePrinter.enable = lib.mkDefault false;
  moduleSound.enable = lib.mkDefault true;
  moduleTouchpad.enable = lib.mkDefault false;
}

