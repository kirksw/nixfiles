{ pkgs, lib, config, ... }:

{
  options = {
    wezterm.enable = lib.mkEnableOption "enables wezterm";
  };

  config = lib.mkIf config.wezterm.enable {
    programs.wezterm = {
      enable = true;
      # other settings here
    };

    # home.file = {
    #   ".config/wezterm" = {
    #     source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config/<type>/wezterm";
    #     recursive = true;
    #   };
    # };

    # xdg.configFile = {
    #   "wezterm" = {
    #     source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config/<type>/wezterm";
    #     recursive = true;
    #   };
    # };
  };
}