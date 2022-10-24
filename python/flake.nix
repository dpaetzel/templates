{
  inputs = {
    # I typically use the exact nixpkgs set that I use for building my current
    # system to avoid redundancy.
    nixos-config.url = "github:dpaetzel/nixos-config";
  };

  outputs = { self, nixos-config }:
    let
      nixpkgs = nixos-config.inputs.nixpkgs;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      python = pkgs.python310;
    in rec {
      defaultPackage.${system} = python.pkgs.buildPythonPackage rec {
        pname = "TODO";
        version = "TODO";

        src = self;

        format = "pyproject";

        propagatedBuildInputs = with python.pkgs; [
          # TODO Adjust these
          click
          matplotlib
          numpy
          pandas
          scipy
        ];

        meta = with pkgs.lib; {
          description = "TODO";
          license = licenses.gpl3;
        };
      };

      devShell.${system} = pkgs.mkShell {

        buildInputs = with python.pkgs;
          [ ipython python ]
          ++ defaultPackage.${system}.propagatedBuildInputs;

      };
    };
}
