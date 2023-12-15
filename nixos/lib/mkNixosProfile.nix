###
### Function to make a NixOS profile
###

{ host, system, inputs }: let
  overlay = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
      config.permittedInsecurePackages = ["electron-25.9.0"];
    };
  };
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [ overlay ];
  };
  inputs' = inputs // { inherit host system pkgs; };
in {
  nixosConfigurations.${host} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = inputs';
    modules = [
      (./. + "/../profiles/${host}/config.nix")
      (./. + "/../profiles/${host}/hardware.nix")
    ];
  };
}
