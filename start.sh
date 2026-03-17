#!/bin/bash
set -e

mkdir -p /data
rm -f /data/LOCK

nginx
exec tuwunel --config /etc/tuwunel.toml
