##
## FUNCTION TO MAKE A NIXOS PROFILE
##

{ host, system, inputs }: let
  overlay = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
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
      (./. + "/../profiles/${host}/hardware.nix")
      (./. + "/../profiles/${host}/config.nix")
      ./../modules
      ./../packages
      inputs.sops-nix.nixosModules.sops
    ];
  };
}

