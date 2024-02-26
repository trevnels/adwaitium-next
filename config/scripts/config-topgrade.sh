#!/usr/bin/env bash
set -oue pipefail

sed -i '1s/^/[include]\npaths = ["\/etc\/ublue-os\/topgrade.toml"]\n\n/' /usr/etc/ublue-update/topgrade-user.toml && \
    sed -i 's/min_battery_percent.*/min_battery_percent = 20.0/' /usr/etc/ublue-update/ublue-update.toml && \
    sed -i 's/max_cpu_load_percent.*/max_cpu_load_percent = 100.0/' /usr/etc/ublue-update/ublue-update.toml && \
    sed -i 's/max_mem_percent.*/max_mem_percent = 90.0/' /usr/etc/ublue-update/ublue-update.toml && \
    sed -i 's/dbus_notify.*/dbus_notify = true/' /usr/etc/ublue-update/ublue-update.toml
