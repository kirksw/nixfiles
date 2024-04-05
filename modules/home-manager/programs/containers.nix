{ pkgs, lib, config, ... }:

{
  options = {
    container.enable = lib.mkEnableOption "enables container tooling";
  };

  config = lib.mkIf config.container.enable {
    home.packages = with pkgs; [
      colima
      docker
      kubectl
    ];
  };
}
