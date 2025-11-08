#!/usr/bin/env bash
set -euo pipefail

DESKTOP="/home/vscode/Desktop"
URL="https://vsd-labs.sgp1.cdn.digitaloceanspaces.com/vsd-labs/FreedomStudio-3-1-1_codespace.tar.gz"
ARCHIVE="${DESKTOP}/FreedomStudio-3-1-1_codespace.tar.gz"

echo "[setup] Preparing Desktop..."
mkdir -p "$DESKTOP"
chown -R vscode:vscode "$DESKTOP"

# Skip if already extracted
if compgen -G "${DESKTOP}/FreedomStudio*" > /dev/null; then
  echo "[setup] FreedomStudio already present. Skipping download."
  exit 0
fi

echo "[setup] Downloading FreedomStudio..."
wget -q --show-progress -O "$ARCHIVE" "$URL"

echo "[setup] Extracting FreedomStudio..."
tar -xzf "$ARCHIVE" -C "$DESKTOP"

echo "[setup] Cleaning up..."
rm -f "$ARCHIVE"

chown -R vscode:vscode "$DESKTOP"
echo "[setup] FreedomStudio ready on Desktop."
