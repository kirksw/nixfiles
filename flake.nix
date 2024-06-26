{
  description = "my flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    
    # Minimize duplicate instances of inputs
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs-unstable, nixpkgs, darwin, home-manager, ... }@inputs: 
    let
      vars = {
        user = "kirk";
        location = "$HOME/.nixfiles";
        terminal = "wezterm";
        editor = "nvim";
      };
      system = "aarch64-darwin";
      unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true;};
    in {
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
            ./modules/darwin
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.kirk = import ./hosts/darwin/work-laptop/home.nix;
              home-manager.sharedModules = [
                ./modules/home-manager
              ];

              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
              home-manager.extraSpecialArgs = { inherit unstable; };
            }
          ];
        };
      };
    };
}
