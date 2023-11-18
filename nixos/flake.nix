{
  description = "My 'I put way too much time in this' Flake";

  inputs = {
    #$ nix flake metadata github:...
    # Check if inputs used by flake

    # Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs: let
    stateVersion = "23.05";
    inputs' = inputs // { inherit stateVersion; };
  in
    import ./lib/mkNixosProfile.nix { host = "neso"; system = "x86_64-linux"; inputs = inputs'; };
}
