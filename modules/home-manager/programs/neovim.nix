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
    };

    home.shellAliases = {
      lv = "nvim";
    };

    xdg.configFile = {
      "nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixfiles/config/general/nvim/.config/nvim";
        recursive = true;
      };
    };
  };
}
