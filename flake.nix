# etc/nixos/flake.nix
{
  description = "flake for navi";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixpkgs-python = {
      url = "github:cachix/nixpkgs-python";
    };
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
    };
  };  

  outputs = { self, nixpkgs, nixpkgs-python, vscode-server }: {
    nixosConfigurations = {
      navi = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          vscode-server.nixosModules.default
          ({ config, pkgs, ... }: {
            services.vscode-server.enable = true;
          })
        ];
      };
    };
  };
}
