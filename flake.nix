# etc/nixos/flake.nix
{
  description = "flake for navi";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
  };  

  outputs = { self, nixpkgs }: {
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
