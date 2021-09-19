{

  description = "{{ cookiecutter.project_description }}";

  nixConfig.bash-prompt = "{{cookiecutter.project_name}}~~$ ";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nl2n-src.url = "github:nix-community/npmlock2nix";
    nl2n-src.flake = false;
  };

  outputs = {self, nixpkgs, nl2n-src}:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      nl2n = import nl2n-src { inherit pkgs; };
      {{cookiecutter.project_name}} = nl2n.build {
        src = ./{{cookiecutter.project_name}};
        installPhase = "cp -r dist $out";
      };
    in
      {
        packages.${system}.{{cookiecutter.project_name}} = {{cookiecutter.project_name}};

        defaultPackage.${system} = self.packages.${system}.{{cookiecutter.project_name}};

        devShell.${system} = nl2n.shell {
          src = ./.;
        };
      };
}