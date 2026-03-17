#!/bin/bash
set -e

mkdir -p /data

echo "Starting nginx..."
nginx

echo "Starting Tuwunel (server_name: ${TUWUNEL_SERVER_NAME})..."
exec tuwunel
