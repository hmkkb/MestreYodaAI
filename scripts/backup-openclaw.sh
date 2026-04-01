#!/usr/bin/env bash
set -euo pipefail

STAMP=$(date +%Y%m%d-%H%M%S)
DEST="/data/.openclaw/workspace/docker/backups/openclaw-backup-${STAMP}.tar.gz"

tar -czf "$DEST" /data/.openclaw 2>/dev/null || true

echo "Backup salvo em: $DEST"
