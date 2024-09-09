# blue-hyprland &nbsp; [![bluebuild build badge](https://github.com/matrimer/blue-hyprland/actions/workflows/build.yml/badge.svg)](https://github.com/matrimer/blue-hyprland/actions/workflows/build.yml)

    See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.

This aims to become a discoverable and easy to use, yet efficient keyboard oriented desktop. It should have sane defaults,
and be ready to use without any setup. Graphics drivers should work out of the box, should be gaming ready.

## UX
Keyboard-oriented with mouse support.
For many common tasks, traditional mouse-oriented GUI
will be used. One such example is GParted.

## Aesthetics
It should look appealing. That's one of the reasons hyprland was chosen.
- Primarily use GTK, for less often used applications QT might be ok too.

### TODO:
- Theme SDDM

## Included software
- Terminal emulator
- Firefox
- Gnome Software
- Bluetooth Manager
- Disk utility (GParted, Gnome-Disks or KDE Partition Manager?)
- Proprietary NVIDIA-drivers
- TLP (possibly with TLP-UI)
- Pavucontrol
- nm-applet
- gamescope
- brightnessctl
- Syncthing

### TO-DO
- word processor 
- video player
- music player
- image viewer
- keyboard oriented web-browser
- spreadsheets
- System settings
- Efficient keyboard controlled pointing device
- keyboard controlled file manager
- password manager

### What it's built on
- Rofi-wayland
- hyprland
- possibly a lightweight river desktop for laptops
- waybar
- Network-Manager
- Pipewire
- Wayland
- SDDM

#### Wayblue hyprland-nvidia image
fedora atomic desktop + ublue + bluebuild

## Installation

> **Warning**  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/matrimer/blue-hyprland:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/matrimer/blue-hyprland:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

If built on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/matrimer/blue-hyprland
```
