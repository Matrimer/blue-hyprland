#!/usr/bin/bash
# Based on this script from bazzite:
# https://github.com/ublue-os/bazzite/blob/cff5814eb0d2d09632195bafe3567527e6262fe1/system_files/desktop/shared/usr/share/ublue-os/just/82-bazzite-waydroid.just#L32

source /usr/lib/ujust/ujust.sh

CHOICE=$()

if [ $(
  echo "Reset
Exit" | rofi -dmenu -l 2 -p "Resetting waydroid will delete all waydroid files, except waydroid itself") == "Reset" ]; then
  echo "Resetting Waydroid"
  bash -c 'sudo rm -rf /var/lib/waydroid /home/.waydroid ~/waydroid ~/.share/waydroid ~/.local/share/applications/*aydroid* ~/.local/share/waydroid'
fi
