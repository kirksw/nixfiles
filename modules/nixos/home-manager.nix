{ inputs, ... }: {

  home-manager."kirk" = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "kirk" = import ./home.nix;
      modules = [
        ./home.nix
        inputs.self.outputs.homeManagerModules.default
      ];
    };
  };
}
