{
  description = "my flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11"; 
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin, home-manager, ... }@inputs: 
  {
    nixosConfigurations = {
      virtualbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos/virtualbox/configuration.nix
          ./modules/nixos
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.demo = import ./hosts/nixos/virtualbox/home.nix;
            home-manager.sharedModules = [
              ./modules/home-manager
            ];

            # optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
      home-desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nixos/home-desktop/configuration.nix
          ./modules/nixos
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kirk = import ./hosts/nixos/home-desktop/home.nix;
            home-manager.sharedModules = [
              ./modules/home-manager
            ];

            # optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };

    darwinConfigurations = {
      work-laptop = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/darwin/work-laptop/configuration.nix
          ./modules/nixos
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kirk = import ./hosts/darwin/work-desktop/home.nix;
            home-manager.sharedModules = [
              ./modules/home-manager
            ];

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
  };
}
