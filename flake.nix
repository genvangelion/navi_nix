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
  };  

  outputs = { self, nixpkgs, nixpkgs-python }: {
    nixosConfigurations = {
      navi = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
