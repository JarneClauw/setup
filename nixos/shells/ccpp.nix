{
  description = "C/C++ DevShell";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: let
    systems = [ "x86_64-linux" ];
    forAllSystems = function: nixpkgs.lib.genAttrs systems (system: function {
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    });
  in {
    devShells = forAllSystems ({ pkgs }: {
      default = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
        packages = with pkgs; [
	  # Fixes headers not being found
	  clang-tools
	  # Other Compiler
	  # ... gcc12
	  # Tools
	  cmake
	  valgrind
	  imhex
	  # Memory management
	  massif-visualizer
	  # Benchmark
	  hyperfine
	];
      };
    });
  };
}
