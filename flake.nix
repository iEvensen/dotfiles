{
  description = "NixOS and Home Manager configuration";

  inputs = {
    # NixPkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home-Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.codebook = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
          ./hosts/codebook/configuration.nix
          ./system
      ];
    };

    homeManagerModules.default = ./home;

  };
}
