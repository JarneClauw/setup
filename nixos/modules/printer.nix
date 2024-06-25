##
## PRINTER & SCANNER
##

{ lib, config, pkgs, ... }: {
  options = {
    modulePrinter.enable = lib.mkEnableOption "enables the printer and scanner module";
  };

  config = lib.mkIf config.modulePrinter.enable {
    #### PRINTER ####
    services.printing.enable = true;

    #### DRIVERS ####
    services.printing.drivers = with pkgs; [
      gutenprint gutenprintBin                # General
      hplip hplipWithPlugin                   # HP
      brlaser brgenml1lpr brgenml1cupswrapper # Brother
    ];

    #### AUTODISCOVERY ####
    # Autodiscovery of network printers (IPP Everywhere protocol)
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    #### SANE SCANNER ####
    hardware.sane.enable = true;
  };
}

