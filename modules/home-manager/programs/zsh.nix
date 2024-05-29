{ pkgs, lib, config, unstable, ... }:

{
  options = {
    zsh.enable = lib.mkEnableOption "enables zsh";
  };

  config = lib.mkIf config.zsh.enable {
    home.packages = with pkgs; [
      jq
      unstable.mise #TODO: remove this once mise is stable
    ];

    programs.zsh = {
      enable = true;
      enableAutosuggestions = true; #TODO: change to below when updated
      #autosuggestion.enable = true;
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
        update = "darwin-rebuild switch --flake ~/nixfiles#work-laptop";
      };

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      initExtra = ''
        [[ ! -f ~/nixfiles/config/general/zsh/.p10k.zsh ]] || source ~/nixfiles/config/general/zsh/.p10k.zsh
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

        if [[ $(uname -m) == 'arm64' ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        
        # add scripts to path
        export PATH="$PATH:$HOME/.config/scripts"

        eval "$(/etc/profiles/per-user/kirk/bin/mise activate zsh)"
      '';
    };

    # TODO: find out how to make an overlay using unstable
    # programs.mise = {
    #   package = unstable.mise;
    #   enable = true;
    #   enableZshIntegration = true;
    # };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    xdg.configFile = {
      "mise" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixfiles/config/general/mise";  
        recursive = true;
      };
    };

    xdg.configFile = {
      "scripts" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixfiles/scripts";  
        recursive = true;
      };
    }; 
  };
}
