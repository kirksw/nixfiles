{ pkgs, lib, config, ... }:

{
  options = {
    neovim.enable = lib.mkEnableOption "enables neovim";
  };

  config = lib.mkIf config.neovim.enable {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;

      # shellAliases = {
      #   lv = "NVIM_APPNAME=lazyvim nvim";
      # };
    };

    xdg.configFile = {
      "nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config/general/nvim/.config/nvim";
        recursive = true;
      };
    };

    xdg.configFile = {
      "lazyvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config/general/nvim/.config/lazyvim";
        recursive = true;
      };
    };
  };
}