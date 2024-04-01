{ pkgs, lib, config, ... }:

{
  options = {
    tmux.enable = lib.mkEnableOption "enables tmux";
  };

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      # other settings here
    };

    # note: $XDG_CONFIG_HOME is ignored so will break if changed
    home.file = {
      ".tmux.conf" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixfiles/config/general/tmux/.tmux.conf";
      };
    };
  };
}