{ pkgs, lib, config, ... }:

{
  options = {
    zsh.enable = lib.mkEnableOption "enables zsh";
  };

  config = lib.mkIf config.zsh.enable {
    home.packages = with pkgs; [
      xz # the trojaned package
      jq
    ];

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
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];

      oh-my-zsh = {
        enable = true;
        #theme = "powerlevel10k";
        plugins = [
          "docker"
          "git"
          "npm"
          "history"
          "node"
          "rust"
          "python"
          "deno"
        ];
      };

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch --flake ~/.nixfiles";
      };

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      initExtra = ''
        [[ ! -f ~/nixfiles/config/general/zsh/.p10k.zsh ]] || source ~/nixfiles/config/general/zsh/.p10k.zsh
      '';
    };

    xdg.configFile = {
      "mise" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixfiles/config/general/mise";  
        recursive = true;
      };
    };
  };
}
