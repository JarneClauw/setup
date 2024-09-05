{
  description = "My 'I put way to much time in this' flake!";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs: {
    nixosConfigurations.neso = import ./lib/profile.nix {
      inputs = inputs;
      system = "x86_64-linux";
      profile = "neso";
    };
  };
}
