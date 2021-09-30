#!/bin/sh

pushd ~/Dotfiles
sudo nixos-rebuild switch -I nixos-config=./system/configuration.nix
popd
