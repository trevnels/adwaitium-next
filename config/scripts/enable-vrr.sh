#!/usr/bin/env bash
set -oue pipefail

rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:kylegospo:gnome-vrr mutter mutter-common gnome-control-center gnome-control-center-filesystem
rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:gloriouseggroll:nvidia-explicit-sync xorg-x11-server-Xwayland

echo "MUTTER_DEBUG_FORCE_KMS_MODE=simple" >> /usr/etc/environment
