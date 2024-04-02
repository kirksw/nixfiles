{ pkgs, lib, config, ... }:

{
  options = {
    zsh.enable = lib.mkEnableOption "enables zsh";
  };

  config = lib.mkIf config.zsh.enable {
    programs.mise = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;

      oh-my-zsh = {
        enable = true;
        plugins = [ 
          "git"
          "tmux"
          "vimode"
          "zsh-autosuggestions"
          "zsh-syntax-highlighting"
        ];
        theme = "powerlevel10k/powerlevel10k";
      };

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch --flake ~/.nixfiles";
      };

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      initExtra = ''
        bindkey "''${key[Up]}" up-line-or-search
      '';
    };

    xdg.configFile = {
      "mise" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixfiles/config/general/mise";  
        recursive = true;
      };
    };

    # home.file = {
    #   ".config/zsh" = {
    #     source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config/<type>/zsh"
    #     recursive = true
    #   };
    # };

    # xdg.configFile = {
    #   "zsh" = {
    #     source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/config/<type>/zsh"
    #     recursive = true
    #   };
    # };
  };
}
