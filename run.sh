#!/bin/sh

set -e;

fuse2fs -o rw,nosuid,nodev,noexec,fakeroot /srv/data.img /mnt;
source ./.venv/bin/activate;
export XDG_CONFIG_HOME="/mnt/.config";
exec \
    setpriv --bounding-set=-all --ambient-caps=-all --inh-caps=-all --no-new-privs \
    copyparty -c copyparty.conf;
