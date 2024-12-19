#!/usr/bin/bash
# Based on this script from bazzite:
# https://github.com/ublue-os/bazzite/blob/cff5814eb0d2d09632195bafe3567527e6262fe1/system_files/desktop/shared/usr/share/ublue-os/just/82-bazzite-waydroid.just#L32

source /usr/lib/ujust/ujust.sh

git clone https://github.com/ublue-os/waydroid_script.git --depth 1 /tmp/waydroid_script
python -m venv /tmp/waydroid_script/venv
source /tmp/waydroid_script/venv/bin/activate
sudo pip install -r /tmp/waydroid_script/requirements.txt
sudo /tmp/waydroid_script/main.py
deactivate
sudo rm -rf /tmp/waydroid_script
