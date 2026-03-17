#!/bin/bash
set -e

mkdir -p /data

echo "=== Debug info ==="
echo "Data dir: $(ls -la /data/ 2>&1 || echo 'empty')"
echo "Disk space: $(df -h /data 2>&1 || echo 'unknown')"
echo "Tuwunel binary: $(which tuwunel) $(tuwunel --version 2>&1 || echo 'no --version')"
echo "Env vars:"
env | grep -i TUWUNEL | sort
echo "=================="

rm -f /data/rocksdb_lock /data/LOCK

echo "Starting nginx..."
nginx

echo "Starting Tuwunel (server_name: ${TUWUNEL_SERVER_NAME})..."
exec tuwunel
