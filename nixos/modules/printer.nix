###
### Printer and Scanner
###

inputs: {
  # Enable printing service
  services.printing.enable = true;

  # Extra drivers
  services.printing.drivers = with inputs.pkgs; [
    gutenprint gutenprintBin 			# General
  ];

  # Autodiscovery of network printers (IPP Everywhere protocol)
  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

  # SANE Scanner
  hardware.sane.enable = true;
}
