{ pkgs, lib, config, ... }:

{
  options = {
    gcp.enable = lib.mkEnableOption "enables module";
  };

  config = lib.mkIf config.gcp.enable {
    # programs.google-cloud-cli = {
    #   enable = true;
    # };
    home.packages = with pkgs; [
      google-cloud-sdk
    ];
  };
}

