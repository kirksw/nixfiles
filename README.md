# nixfiles

## Description

This is a straightforward

- [config](./config) contains dotfiles which haven't been mapped across to nix modules yet
- [hosts](./hosts) contains the per-host configurations
- [modules](./modules) contains the generic modules which can be enabled per-host by setting `module_name.enable = true;`

## rebuild nixos

```bash
sudo nixos-rebuild switch --flake .#home-desktop --impure
```

## rebuild home-manager
