#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID -eq 0 ]]; then
  echo "Run this script as a regular user with sudo access."
  exit 1
fi

sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm \
  git \
  python \
  ansible \
  stow \
  docker \
  docker-compose \
  base-devel

if ! command -v yay >/dev/null 2>&1; then
  tmp_dir=$(mktemp -d)
  git clone https://aur.archlinux.org/yay.git "$tmp_dir/yay"
  pushd "$tmp_dir/yay" >/dev/null
  makepkg -si --noconfirm
  popd >/dev/null
  rm -rf "$tmp_dir"
fi

sudo systemctl enable --now docker
sudo usermod -aG docker "$USER"

echo "Bootstrap complete. Log out and back in to use Docker without sudo."
