#!/bin/bash
set -euo pipefail

REPO_URL="https://github.com/smaugfm/dotfiles"
DEV_DIR="$HOME/Dev"
mkdir $DEV_DIR
DOTFILES_DIR="$DEV_DIR/dotfiles"

if [ -d "$DOTFILES_DIR/.git" ]; then
  git -C "$DOTFILES_DIR" pull --ff-only
else
  git clone "$REPO_URL" "$DOTFILES_DIR"
fi

cp -R "$DOTFILES_DIR/homedir/." "$HOME/"
curl -L https://iterm2.com/shell_integration/bash -o ~/.iterm2_shell_integration.bash
