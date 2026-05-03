#!/bin/sh

disk="./data.img";
size="50G";

[ -f "$disk" ] || {
    truncate -s "$size" "$disk";
    mkfs.ext4 "$disk";
}
e2fsck "$disk";
