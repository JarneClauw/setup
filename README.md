# Setup
Repository on how to setup my devices

## File structure
**nixos** contains everything NixOS related

**dotfiles** contains configuration files for programs and tools

**scripts** contains scripts to get information or set configurations up

## Updating
The channels `sudo nix-channel --list` can be updated by `sudo nix-channel --update`. This ensures `nix-shell -p ...` uses the latest packages. The 'nixos' channel is set to unstable `sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos`.

To update flakes we just execute `nix flake update`.

To build a new generation we execute `sudo nixos-rebuild switch --flake .#neso`.

## Devices
**[ neso ]** Lenovo laptop

**[ polaris ]** server

