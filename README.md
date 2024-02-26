# adwaitium &nbsp; [![build-ublue](https://github.com/trevnels/adwaitium/actions/workflows/build.yml/badge.svg)](https://github.com/trevnels/adwaitium/actions/workflows/build.yml)

This is a *very* work-in-progress Fedora image based on the Universal Blue startingpoint repo. It will eventually have some of my opinionated changes that I make to all of my GNOME installations, namely:
- Consistent libadwaita theming between GTK4, GTK3, and Qt applications, even within flatpaks
- A means of automatically updating and applying [firefox-gnome-theme](https://github.com/rafaelmardojai/firefox-gnome-theme) and [thunderbird-gnome-theme](https://github.com/rafaelmardojai/thunderbird-gnome-theme)
- A few extensions to make GNOME feel a little more 'complete,' such as a dock, a battery duration indicator in the control center, and rounded window corners across all apps (once the extension is compatible with GNOME 45)
- Various packages I use, such as `git-credential-libsecret` and `gvfs-nfs`
- JetBrains Mono Nerd Font, my terminal font of choice

## Installation

> **Warning**  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/blue-build/template:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/blue-build/template:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO

> **Warning**  
> The ISO GitHub Action will be deprecated soon in favor of the new [ublue-os/isogenerator](https://github.com/ublue-os/isogenerator). The Action will then be removed from this template repository and instructions for building ISOs will be on the website.

This template includes a simple GitHub Action to build and release an ISO of your image.

To run the action, simply edit the `boot_menu.yml` by changing all the references to startingpoint to your repository. This should trigger the action automatically.

The Action currently uses [ublue-os/isogenerator-old](https://github.com/ublue-os/isogenerator-old) and works in a similar manner to the official Universal Blue ISO. If you have any issues, you should first check [the documentation page on installation](https://universal-blue.org/installation/). The ISO is a netinstaller and should always pull the latest version of your image.

Note that this release-iso action is not a replacement for a full-blown release automation like [release-please](https://github.com/googleapis/release-please).

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/blue-build/legacy-template
```
