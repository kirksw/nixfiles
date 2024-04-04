{ inputs, pkgs, config, ... }:

{
    options = {
        homebrew.enable = lib.mkEnableOption "enables homebrew";
    };

    config = lib.mkIf config.module.enable {
        homebrew = {
            brewPrefix = "/opt/homebrew/bin";
            enable = true;
            caskArgs.no_quarantine = true;
            global = {
                brewfile = true;
                # lockfiles = true;
            };

            casks = [ 
                "raycast"
                "visual-studio-code"
                "docker"
            ];

            taps = [
                "homebrew/core"
                "homebrew/cask"
                "homebrew/cask-fonts"
            ];
                
            # brews = [ "trippy" ];
            # extraConfig = '''';
        };
    };
}
