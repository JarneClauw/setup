##
## PACKAGES
##

{ lib, ... }: {
  imports = [
    ./base.nix
    ./terminal.nix
    ./gaming.nix
    ./ricing.nix
  ];

  packagesBase.enable = lib.mkDefault true;
  packagesTerminal.enable = lib.mkDefault true;
  packagesGaming.enable = lib.mkDefault false;
  packagesRicing.enable = lib.mkDefault false;
}

