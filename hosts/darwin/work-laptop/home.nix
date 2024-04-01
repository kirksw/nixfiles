{ config, lib, packages, ... }:

{
  # required config
  # home.userName = "demo"
  # home.homeDirectory = "/home/demo"
  # targets.genericLinux.enable = true; # ENABLE FOR NON_NIXOS
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  # packages not controlled by home-manager
  home.packages = with pkgs; [
    #mise       # manage development environments  
    neofetch    # ricer
    bat         # better cat
    ripgrep
  ];

  home.sessionVariables = {
    # user session variables
  };

  home.file = {
    # symlinked files
  };

  # custom modules
  git.enable = true;
  neovim.enable = true;
  zsh.enable = true;
  tmux.enable = true;
  wezterm.enable = true;
}