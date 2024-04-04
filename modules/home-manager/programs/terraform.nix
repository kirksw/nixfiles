{ pkgs, lib, config, ... }:

{
  options = {
    terraform.enable = lib.mkEnableOption "enables module";
  };

  config = lib.mkIf config.terraform.enable {
    home.packages = with pkgs; [
      terraform
    ];
  };
}
