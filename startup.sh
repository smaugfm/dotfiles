#!/bin/bash
set -euo pipefail

sudo=""
if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then
  sudo="sudo"
fi

$sudo apt-get update
$sudo apt-get install -y mc silversearcher-ag screen
