#!/bin/bash
set -euo pipefail

REPO_URL="https://github.com/smaugfm/dotfiles"
DOTFILES_DIR="$HOME/.dotfiles"

if [ -d "$DOTFILES_DIR/.git" ]; then
  git -C "$DOTFILES_DIR" pull --ff-only
else
  git clone "$REPO_URL" "$DOTFILES_DIR"
fi

cp -R "$DOTFILES_DIR/homedir/." "$HOME/"
