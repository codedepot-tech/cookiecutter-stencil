{

  description = "{{ cookiecutter.project_description }}";

  nixConfig.bash-prompt = "{{cookiecutter.project_name}}~~$ ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nnbp.url = "github:serokell/nix-npm-buildpackage";
  };

  outputs = {self, nixpkgs, nnbp}:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; overlays = [ nnbp.overlay ]; };
    in rec
      {
        packages.${system}.{{cookiecutter.project_name}} = pkgs.buildNpmPackage {
          src = ./.;
          npmBuild = "npm run build";
          extraEnvVars = "PUPPETEER_SKIP_DOWNLOAD=1";
        };

        defaultPackage.${system} = self.packages.${system}.{{cookiecutter.project_name}};

        devShell.${system} = pkgs.mkShell {
          buildInputs = [
            packages.${system}.{{cookiecutter.project_name}}
          ];
        };
      };
}