#!/usr/bin/env bash
set -euo pipefail

DESKTOP="/home/vscode/Desktop"
URL="https://vsd-labs.sgp1.cdn.digitaloceanspaces.com/vsd-labs/FreedomStudio-3-1-1_codespace.tar.gz"
ARCHIVE="${DESKTOP}/FreedomStudio-3-1-1_codespace.tar.gz"

echo "[setup] Ensuring Desktop exists and is writable..."
mkdir -p "$DESKTOP"
chown -R vscode:vscode "$DESKTOP"

# Idempotency: if a FreedomStudio directory already exists, skip download/extract
if compgen -G "${DESKTOP}/FreedomStudio*" > /dev/null; then
  echo "[setup] FreedomStudio appears to be present in ${DESKTOP}; skipping download."
  exit 0
fi

echo "[setup] Downloading FreedomStudio payload to ${ARCHIVE} ..."
wget -q --show-progress -O "$ARCHIVE" "$URL"

echo "[setup] Extracting into ${DESKTOP} ..."
tar -xzf "$ARCHIVE" -C "$DESKTOP"

echo "[setup] Cleaning up archive ..."
rm -f "$ARCHIVE"

# Final ownership fix (harmless if already correct)
echo "[setup] Fixing ownership ..."
chown -R vscode:vscode "$DESKTOP"

echo "[setup] Done. You can find FreedomStudio under ${DESKTOP}."
echo "[setup] noVNC desktop will be available at https://localhost:6080/"
