#!/usr/bin/env bash
set -oue pipefail

rpm-ostree override replace \
        --experimental \
        --from repo=copr:copr.fedorainfracloud.org:kylegospo:prompt \
            vte291 \
            vte-profile \
	    libadwaita && \
        rpm-ostree install \
            prompt
