#!/bin/sh

set -e;

podman build -t copyparty .;
podman run --name copyparty --rmi \
    --read-only --security-opt no-new-privileges --security-opt unmask=none --cap-drop=ALL --pids-limit=128 --memory=2g --memory-swap=2g --cpus=1.0 --ulimit nofile=1024:2048 --network slirp4netns:outbound_addr=127.0.0.1 \
    --cap-add SETPCAP --cap-add SYS_ADMIN --device /dev/fuse --tmpfs /mnt:rw,mode=1777,nosuid,nodev,noexec -v ./copyparty-account.conf:/srv/copyparty-account.conf:ro -v ./data.img:/srv/data.img:rw -p 7000:8080 copyparty;
