#!/bin/sh

pushd $(xdg-user-dir DOTFILES)
home-manager switch -f ./users/$USER/default.nix
popd
