#!/bin/bash
set -e

mkdir -p /data

echo "=== Debug info ==="
echo "Data dir: $(ls -la /data/ 2>&1)"
echo "Disk space: $(df -h /data 2>&1)"
echo "Kernel: $(uname -a 2>&1)"
echo "ulimit -n: $(ulimit -n 2>&1)"
echo "ulimit -u: $(ulimit -u 2>&1)"
echo "io_uring test: $(cat /proc/sys/kernel/io_uring_disabled 2>&1 || echo 'not found')"
echo "=================="

rm -f /data/LOCK

echo "Starting Tuwunel (server_name: ${TUWUNEL_SERVER_NAME})..."
exec tuwunel
