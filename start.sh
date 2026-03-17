#!/bin/bash
set -e

mkdir -p /data

echo "=== Debug ==="
echo "Volume: $(df -h /data 2>&1 | tail -1)"
echo "Config: $(cat /etc/tuwunel.toml | grep -E 'pool|rocksdb|workers')"
echo "============="

rm -f /data/LOCK

echo "Starting Tuwunel with config file..."
exec tuwunel --config /etc/tuwunel.toml
