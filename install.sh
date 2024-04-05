#!/bin/sh
INSTALL_DIR="${INSTALL_DIR:-$HOME/repos/github.com/okabe1848/dotfiles}"
echo "INSTALL_DIR=$INSTALL_DIR"

if [ -d "$INSTALL_DIR" ]; then
    echo "Updating dotfiles..."
    git -C "$INSTALL_DIR" pull # git switch -C "$INSTALL_DIR" pull
else
    echo "Installing dotfiles..."
    git clone https://github.com/okabe1848/dotfiles "$INSTALL_DIR"
fi

/bin/bash "$INSTALL_DIR/scripts/setup.bash"