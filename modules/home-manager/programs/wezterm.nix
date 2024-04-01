{ pkgs, lib, config, ... }:

{
  options = {
    wezterm.enable = lib.mkEnableOption "enables wezterm";
  };

  config = lib.mkIf config.wezterm.enable {
    programs.wezterm = {
      enable = true;
      # other settings here

      extraConfig = ''
        local wezterm = require("wezterm")
        local action = wezterm.action

        return {
          font = wezterm.font("Fira Code"),
          font_size = 16.0,

          color_scheme = "Batman",

          enable_scroll_bar = false,
          window_padding = {
            left = 0,
            right = 0,
            top = 0,
            bottom = 0,
          },

          launch_menu = {},
          hide_tab_bar_if_only_one_tab = true,

          -- Note: use "xxd -psd" to find hex codes for keys
          keys = {
            {
              key = "t",
              mods = "SHIFT|SUPER",
              action = action.Multiple({
                action.SendKey({ key = "a", mods = "CTRL" }),
                action.SendKey({ key = "T" }),
              }),
            },
          },
        }
      '';
    };
  };
}