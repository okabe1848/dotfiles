#!/bin/zsh

sudo sed --in-place -e '/auth.*required.*pam_shells.so/s/required/sufficient/g' /etc/pam.d/chsh
chsh -s $(which zsh)

# source $XDG_CONFIG_HOME/zsh/.zshrc