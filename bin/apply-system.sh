#!/bin/sh

pushd $(xdg-user-dir DOTFILES)
sudo nixos-rebuild switch -I nixos-config=./system/configuration.nix
popd
