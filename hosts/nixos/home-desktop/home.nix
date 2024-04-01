{ config, lib, pkgs, ... }:

{
  # required config
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  # custom modules
  git.enable = true;
  neovim.enable = true;
}