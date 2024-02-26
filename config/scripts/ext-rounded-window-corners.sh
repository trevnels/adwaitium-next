#!/usr/bin/env bash
set -oue pipefail

rpm-ostree install nodejs yarnpkg gettext-devel && \
git clone https://github.com/yilozt/rounded-window-corners /tmp/rounded-window-corners && \
cd /tmp/rounded-window-corners && \
yarn install && \
yarn build && \
mkdir -p /usr/share/gnome-shell/extensions/rounded-window-corners@yilozt && \
cp -r _build/** /usr/share/gnome-shell/extensions/rounded-window-corners@yilozt && \
rpm-ostree uninstall gettext-common-devel gettext-devel nodejs nodejs-docs nodejs-full-i18n nodejs-libs nodejs-npm yarnpkg