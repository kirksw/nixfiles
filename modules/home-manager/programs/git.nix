{ pkgs, lib, config, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "Kirk Sweeney";
      userEmail = "kirk.sweeney@outlook.com";

      extraConfig = {
        core = {
          editor = "nvim";
        };
        color = {
          ui = true;
        };
        push = {
          default = "simple";
        };
        pull = {
          ff = "only";
        };
        init = {
          defaultBranch = "main";
        };
      };

      delta = {
        enable = true;
        options = {
          navigate = true;
          line-numbers = true;
          syntax-theme = "GitHub";
        };
      };

      ignores = [
        ".DS_Store"
        "*.pyc"
      ];
    };
  };

}