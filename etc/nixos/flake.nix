{
  description = "binh1298's NixOS config for desktop and WSL";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      binh-server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          {
            environment.systemPackages = [];
          }
          ./configuration.nix
          # home-manager.nixosModules.home-manager
          # {
          #   home-manager = {
          #     useGlobalPkgs = true;
          #     useUserPackages = false;
          #     extraSpecialArgs = {inherit inputs;};
          #     users.ducbinh = ./home/server.nix;
          #   };
          # }
        ];
      };
    };
  };
}
