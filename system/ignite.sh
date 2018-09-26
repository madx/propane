#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

THERE=$(dirname "$BASH_SOURCE")
TARGET=${TARGET:=minimal}

# Colors
_R="\\033[31m"
_G="\\033[32m"
_Y="\\033[33m"
_E="\\033[0m"

step() {
  echo -e "> ${_G}$@${_E}"
}

cancel() {
  echo -e "${_Y}$@${_E}"
  exit
}

echo -e "=> ${_R}ignite!${_E} <="

install_base_packages() {
  step "Installing base packages"
  local -a PACKAGES=($(sed '/^\#/d' "${THERE}/packages/minimal"))

  if [ "$TARGET" = "desktop" ]; then
    PACKAGES+=($(sed '/^\#/d' "${THERE}/packages/desktop"))
  fi

  sudo pacman -S --needed --noconfirm ${PACKAGES[@]}
}

create_home_layout() {
  step "Creating home directory layout"
  source "${THERE}/user-dirs.dirs"
  mkdir -pv "${HOME}/.config"
  mkdir -pv "${HOME}/.local/share"
  mkdir -pv "$XDG_DESKTOP_DIR"
  mkdir -pv "$XDG_DOWNLOAD_DIR"
  mkdir -pv "$XDG_TEMPLATES_DIR"
  mkdir -pv "$XDG_PUBLICSHARE_DIR"
  mkdir -pv "$XDG_DOCUMENTS_DIR"
  mkdir -pv "$XDG_MUSIC_DIR"
  mkdir -pv "$XDG_PICTURES_DIR"
  mkdir -pv "$XDG_VIDEOS_DIR"
  mkdir -pv "${HOME}/bin"
  cp -v "${THERE}/user-dirs.dirs" "${HOME}/.config"
}

install_custom_apps() {
  step "Install dwm"
  (
    [ -e "${HOME}/bin/dwm" ] && cancel "  already installed"
    DWM_DIR="${HOME}/repos/dwm"
    git clone https://github.com/madx/dwm "${DWM_DIR}"
    cd "$DWM_DIR"
    make
    ln -sfv "${DWM_DIR}/dwm" "${HOME}/bin/"
  )

  step "Install st"
  (
    [ -e "${HOME}/bin/st" ] && cancel "  already installed"
    ST_DIR="${HOME}/repos/st"
    git clone https://github.com/madx/st "${ST_DIR}"
    cd "$ST_DIR"
    make
    ln -sfv "${ST_DIR}/st" "${HOME}/bin/"
  )

  step "Install yay"
  (
    [ -e "/usr/bin/yay" ] && cancel "  already installed"
    YAY_DIR="${HOME}/repos/yay"
    git clone https://aur.archlinux.org/yay.git "${YAY_DIR}"
    cd "$YAY_DIR"
    makepkg -si --needed --noconfirm
  )
}

install_aur_apps() {
  step "Installing AUR packages"
  local -a PACKAGES=($(sed '/^\#/d' "${THERE}/packages/aur-minimal"))

  if [ "$TARGET" = "desktop" ]; then
    PACKAGES+=($(sed '/^\#/d' "${THERE}/packages/aur-desktop"))
  fi

  yay -S --needed --noconfirm ${PACKAGES[@]}
}

configure_minimal() {
  # TODO: Configure pacman
  step "Configure pacman"
}

configure_desktop() {
  step "Configure lxdm"
  step "Configure Xsession"
  cp -v "${THERE}/x11/Xsession" "${HOME}/.Xsession"
  sudo mkdir -p "/usr/share/xsessions"
  sudo install -m 644 -v "${THERE}/x11/user-xsession.desktop" "/usr/share/xsessions/"
  sudo install -m 755 -v "${THERE}/x11/user-xsession" "/usr/local/bin/"
  # TODO: Configure dunst, compton, lxdm, wallpapers
}

create_home_layout
install_base_packages
install_custom_apps
install_aur_apps
configure_minimal
if [ "$TARGET" = "desktop" ]; then
  configure_desktop
fi
