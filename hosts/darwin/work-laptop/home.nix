{ config, lib, pkgs, unstable,... }:

{
  # required config
  # home.userName = "demo"
  # home.homeDirectory = "/home/demo"
  # targets.genericLinux.enable = true; # ENABLE FOR NON_NIXOS
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  # packages not controlled by home-manager
  home.packages = with pkgs; [
    neofetch    # ricer
    bat         # better cat
    ripgrep
    unstable.vscode
    cyberduck
    graphviz
    rectangle
    rbw
    docker-credential-helpers
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
  gcp.enable = true;
  terraform.enable = true;
  container.enable = true;
  #vscode.enable = true; # TODO: unsure why this doesn't work
}
