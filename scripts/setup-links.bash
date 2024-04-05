#!/usr/bin/env bash
set -x
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

if [[ ! -d "$HOME/.ssh" ]]; then
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
fi

mkdir -p \
    "$XDG_CONFIG_HOME" \
    "$XDG_STATE_HOME"

if [ -e $HOME/.zshrc ]; then
    mv $HOME/.zshrc $HOME/.zshrc_old-$(date "+%FT%T")
fi

# ln -sfv "$REPO_DIR/config/"* "$XDG_CONFIG_HOME"
# ln -sfv "$XDG_CONFIG_HOME/zsh/.zshenv" "$HOME/.zshenv"
# ln -sfv "$XDG_CONFIG_HOME/zsh/.zshrc" "$HOME/.zshrc"

echo "REPO_DIR=$REPO_DIR"
echo "XDG_CONFIG_HOME=$XDG_CONFIG_HOME"