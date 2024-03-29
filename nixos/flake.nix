{
  description = "My 'I put way too much time in this' Flake";

  inputs = {
    #$ nix flake metadata github:...
    # Check if inputs used by flake

    # Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Sops-nix
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = inputs:
    import ./lib/mkNixosProfile.nix { host = "neso"; system = "x86_64-linux"; inputs = inputs; };
}
