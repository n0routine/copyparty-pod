#!/bin/sh

set -e;

podman machine init || :;
podman machine stop || :;
podman machine start;
read -r -p "press ENTER when done...";
podman machine stop;
