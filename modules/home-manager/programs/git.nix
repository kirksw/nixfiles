{ pkgs, lib, config, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "Kirk Sweeney";
      userEmail = "kirk.sweeney@outlook.com";
    };
  };

}