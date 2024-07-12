{ config, lib, pkgs, unstable,... }:

{
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;

  # packages not controlled by home-manager
  home.packages = with pkgs; [
    neofetch    # ricer
    bat         # better cat
    ripgrep     # move to base module (to include in all configs)
    cyberduck   # sftp/blob clinet
    graphviz    # ??
    rectangle   # window manager (mac)
    rbw         # move to base module (to include in all configs)
    act         # todo: move to devops module
    docker-credential-helpers
    gitleaks    # todo: move to git module
    gum         # fzf alternative (testing)
    viu
    chafa
    ueberzugpp
    #unstable.vscode
  ];

  # custom modules
  git.enable = true;
  neovim.enable = true;
  zsh.enable = true;
  tmux.enable = true;
  wezterm.enable = true;
  gcp.enable = true;
  terraform.enable = true;
  container.enable = true;
}
