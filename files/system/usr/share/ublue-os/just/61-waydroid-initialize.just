#!/usr/bin/bash
# Based on this script from bazzite:
# https://github.com/ublue-os/bazzite/blob/cff5814eb0d2d09632195bafe3567527e6262fe1/system_files/desktop/shared/usr/share/ublue-os/just/82-bazzite-waydroid.just#L32

	source /usr/lib/ujust/ujust.sh

	echo "Installing waydroid\n"
	sudo rpm-ostree install waydroid
	
	echo "Initializing waydroid\n"
	sudo systemctl enable --now waydroid-container
	sudo waydroid init -c 'https://ota.waydro.id/system' -v 'https://ota.waydro.id/vendor'

	echo "Done\n {bold} Make sure to run waydroid once before running the waydroid configuration script{normal}"
