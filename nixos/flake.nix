{
  description = "My 'I put way to much time in this' Flake";

  inputs = {
    # Nix packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Sops-nix
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = inputs:
    import ./lib/mkNixosProfile.nix { host = "neso"; system = "x86_64-linux"; inputs = inputs; };
}

