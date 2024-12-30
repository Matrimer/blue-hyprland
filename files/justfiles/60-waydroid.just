# Initiate, configure and reset Based on this script from bazzite
# https://github.com/ublue-os/bazzite/blob/cff5814eb0d2d09632195bafe3567527e6262fe1/system_files/desktop/shared/usr/share/ublue-os/just/82-bazzite-waydroid.just#L32

# source /usr/lib/ujust/ujust.sh
waydroid-install: # Needs to be split up into 2 parts.
	#### INSTALL ####
	#!/usr/bin/env bash
	echo "Installing waydroid\n"
	sudo rpm-ostree install waydroid

waydroid-enable:
	#### ENABLE ####
	echo "Initializing waydroid\n"
	sudo systemctl enable --now waydroid-container
	sudo waydroid init -c 'https://ota.waydro.id/system' -v 'https://ota.waydro.id/vendor'

	echo "Done\n {bold} Make sure to run waydroid once before running the waydroid configuration script{normal}"
	
waydroid-configure:
	#!/usr/bin/env bash
	git clone https://github.com/ublue-os/waydroid_script.git --depth 1 /tmp/waydroid_script
	python -m venv /tmp/waydroid_script/venv
	source /tmp/waydroid_script/venv/bin/activate
	sudo python -m ensurepip --upgrade
	sudo python -m pip install -r /tmp/waydroid_script/requirements.txt
	sudo /tmp/waydroid_script/main.py
	deactivate
	sudo rm -rf /tmp/waydroid_script

waydroid-reset:
	#!/usr/bin/env bash

	if [ $(echo "Yes
	No" | rofi -dmenu -l 3 -p "Reset waydroid?" -mesg "Resetting waydroid will delete all waydroid files, except waydroid itself") == "Yes" ]; then
		echo "Resetting Waydroid"
		bash -c 'sudo rm -rf /var/lib/waydroid /home/.waydroid ~/waydroid ~/.share/waydroid ~/.local/share/applications/*aydroid* ~/.local/share/waydroid'
	fi
	if [ $(echo "Yes
	No" | rofi -dmenu -l 3 -p "Uninstall waydroid?" -mesg "Uninstalls waydroid") == "Yes" ]; then
		rpm-ostree uninstall waydroid
	fi
