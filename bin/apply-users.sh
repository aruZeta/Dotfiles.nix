#!/bin/sh

pushd ~/Dotfiles
home-manager switch -f ./users/$USER/default.nix
popd
