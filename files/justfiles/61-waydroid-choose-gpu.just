# Waydroid-choose-gpu script taken from:
# https://github.com/Quackdoc/waydroid-scripts

## GPL v3 License:
# Copyright (C) <year>  <name of author>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# source /usr/lib/ujust/ujust.sh
waydroid-choose-gpu:
	#!/usr/bin/env bash
	lspci="$(lspci -nn | grep '\[03')" # https://pci-ids.ucw.cz/read/PD/03

	echo -e "Please enter the GPU number you want to pass to WayDroid:\n"
	gpus=()
	i=0
	while IFS= read lspci; do
		gpus+=("$lspci")
		echo "  $((++i)). $lspci"
	done < <(echo "$lspci")
	echo ""
	while [ -z "$gpuchoice" ]; do
		read -erp ">> Number of GPU to pass to WayDroid (1-${#gpus[@]}): " ans
		if [[ "$ans" =~ [0-9]+ && $ans -ge 1 && $ans -le ${#gpus[@]} ]]; then
			gpuchoice="${gpus[$((ans-1))]%% *}" # e.g. "26:00.0"
		fi
	done

	echo ""
	echo "Confirm that these belong to your GPU:"
	echo ""

	ls -l /dev/dri/by-path/ | grep -i $gpuchoice

	echo ""

	card=$(ls -l /dev/dri/by-path/ | grep -i $gpuchoice | grep -o "card[0-9]")
	rendernode=$(ls -l /dev/dri/by-path/ | grep -i $gpuchoice | grep -o "renderD[1-9][1-9][1-9]")

	echo /dev/dri/$card
	echo /dev/dri/$rendernode

	cp /var/lib/waydroid/lxc/waydroid/config_nodes /var/lib/waydroid/lxc/waydroid/config_nodes.bak
	#lxc.mount.entry = /dev/dri dev/dri none bind,create=dir,optional 0 0
	sed -i '/dri/d' /var/lib/waydroid/lxc/waydroid/config_nodes
	echo "lxc.mount.entry = /dev/dri/$card dev/dri/card0 none bind,create=file,optional 0 0" >> /var/lib/waydroid/lxc/waydroid/config_nodes
	echo "lxc.mount.entry = /dev/dri/$rendernode dev/dri/renderD128 none bind,create=file,optional 0 0" >> /var/lib/waydroid/lxc/waydroid/config_nodes
