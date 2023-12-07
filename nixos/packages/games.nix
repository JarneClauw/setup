###
### Packages needed when gaming 
###

inputs: {
  environment.systemPackages = with inputs.pkgs.unstable; [
    mgba	# GameBoy Advanced emulator
    desmume	# Nintendo DS emulator
    # steam	# Enabled through config
    ckan	# KSP modding
  ];

  programs.steam.enable = true;
  hardware.opengl.driSupport32Bit = true; # Enables support for 32-bit libs that steam uses
}
