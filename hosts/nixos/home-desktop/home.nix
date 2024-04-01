{ config, lib, pkgs, ... }:

{
  # required config
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  # packages not controlled by home-manager
  home.packages = with pkgs; [
    #mise       # manage development environments  
    neofetch    # ricer
    bat         # better cat
    ripgrep
  ];

  # custom modules
  git.enable = true;
  neovim.enable = true;
  zsh.enable = true;
  tmux.enable = true;
  wezterm.enable = true;
}