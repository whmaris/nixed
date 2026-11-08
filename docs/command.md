# NixOS Command

## Generations

### List generations

sudo nix-env --profile /nix/var/nix/profiles/system --list-generations


### Switch to a specific generation

sudo nix-env --profile /nix/var/nix/profiles/system --switch-generation 51


### Delete specific generations

sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations 52 53 55 56 57 58


### Delete old generations

sudo nix-collect-garbage -d


### Rollback to previous generation

sudo nixos-rebuild switch --rollback


## System

### Rebuild and switch

sudo nixos-rebuild switch --flake ~/nixed#ws


### Rebuild and boot (without switching current session)

sudo nixos-rebuild boot --flake ~/nixed#ws


### Check current generation

readlink -f /run/current-system


### Check default system profile

readlink -f /nix/var/nix/profiles/system
