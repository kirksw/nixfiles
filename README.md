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

```bash
home-manager switch --flake .#user
```

## Setup for macbook


install nix

```bash
sh <(curl -L https://nixos.org/nix/install)
```

enable flake support

```bash
mkdir ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

install nix-darwin

```bash
nix run nix-darwin -- switch --flake ~/.config/nix-darwin
```

update flake

```bash
darwin-rebuild switch --flake ~/.config/nix-darwin
```
