{
  description = "general purpose nix configuration for macos and nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Overlays
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs-unstable, nixpkgs, darwin, home-manager, ... }@inputs: 
    let
      vars = {
        user = "kirk";
        linuxSystems = [ "x86_64-linux" "aarch64-linux" ];
        darwinSystems = [ "aarch64-darwin" ];
        location = "$HOME/.nixfiles";
        terminal = "wezterm";
        editor = "nvim";
      };
      system = "aarch64-darwin";
      unstable = import nixpkgs-unstable { inherit system; config.allowUnfree = true;};
      pkgs = import nixpkgs { inherit system; overlays = [ inputs.neovim-nightly-overlay.overlays.default ]; };
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
