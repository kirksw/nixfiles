{ pkgs, lib, config, ... }:

{
  options = {
    dbeaver.enable = lib.mkEnableOption "enables module";
  };

  config = lib.mkIf config.dbeaver.enable {
    # home.packages = with pkgs; [
    #   dbeaver
    # ];
      
  };
}

