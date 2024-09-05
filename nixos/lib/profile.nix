{ inputs, system, profile }: let
  overlay = final: prev: {
    unstable = import inputs.nixpkgs-unstable { inherit system; config.allowUnfree = true; };
  };
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [ overlay ];
  };
  inputs_ = inputs // { inherit system pkgs; };
in inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = inputs_;
  modules = [
    (./. + "/../profiles/${profile}.nix")
  ];
}
