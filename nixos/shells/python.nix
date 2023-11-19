{
  description = "Python DevShell";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }: let
    systems = [ "x86_64-linux" ];
    forAllSystems = function: nixpkgs.lib.genAttrs systems (system: function {
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    });
  in {
    devShells = forAllSystems ({ pkgs }: {
      default = pkgs.mkShell {
        packages = with pkgs; [
	  (python3.withPackages (pp: with pp; [
            numpy
	  ]))
	];
      };

      # Make vscode's python extension read the .venv
      shellHook = ''
        venv="$(cd $(dirname $(which python)); cd ..; pwd)"
	ln -Tsf "$venv" .venv
      '';
    });
  };
}
