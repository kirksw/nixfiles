{ config, pkgs, ... }:

{
  services.nix-daemon.enable = true;
  nixpkgs.config.allowUnfree = true;

  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  users.users.kirk = with pkgs; {
    home = "/Users/kirk";
    shell = zsh;
  };

  # allow touch for sudo
  security.pam.enableSudoTouchIdAuth = true;

  system = {
    keyboard.enableKeyMapping = true;
    keyboard.remapCapsLockToEscape = true;

    defaults = {  
      NSGlobalDomain = {
        # Dark mode
        AppleInterfaceStyle = "Dark";
        
        # Show all file extensions
        AppleShowAllExtensions = true;

        # Automatically hide and show the menu bar
        _HIHideMenuBar = true;
      };

      dock = {
        # Automatically hide and show the Dock
        autohide = true;
        
        # Style options
        orientation = "left";
        show-recents = false;
      };

      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
      };
    };
  };

  # List packages installed in system profile. To search, run:
  # \$ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    vscode
    slack
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
    # xz # doesn't install libraries?
  ];

  environment.shells = with pkgs; [
    zsh
  ];
  programs.zsh.enable = true;

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "FiraCode"
        ];
      })
    ];
  };

  homebrew = {
    brewPrefix = "/opt/homebrew/bin";
    enable = true;
    caskArgs.no_quarantine = true;
    global = {
      brewfile = true;
    };

    casks = [ 
      "raycast"
      "visual-studio-code"
      "notion"
      "slack"
      "vlc"
    ];

    taps = [
      "homebrew/cask-fonts"
      "joshmedeski/sesh"
    ];
        
    brews = [
      "xz"
      "pinentry"
      "pinentry-mac" # BUG: nix doesn't have a darwin/aarch64 version of pinentry
      "sesh"
      "coreutils"
      "infisical/get-cli/infisical"
    ];
    # extraConfig = '''';
  };
}
