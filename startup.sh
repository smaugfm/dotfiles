#!/bin/bash
set -euo pipefail

sudo=""
if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then
  sudo="sudo"
fi

$sudo apt-get update
$sudo apt-get install -y mc silversearcher-ag screen

# Raise inotify watch limit so IntelliJ IDEA can detect external file changes.
# https://youtrack.jetbrains.com/articles/SUPPORT-A-1715/Inotify-Watches-Limit-Linux
echo 'fs.inotify.max_user_watches = 1048576' | $sudo tee /etc/sysctl.d/60-inotify-watches.conf
$sudo sysctl -p /etc/sysctl.d/60-inotify-watches.conf
