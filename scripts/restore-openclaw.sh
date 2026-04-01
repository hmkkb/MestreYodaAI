#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Uso: $0 <arquivo-backup.tar.gz>"
  exit 1
fi

echo "ATENCAO: revise o conteúdo antes de restaurar."
echo "Comando sugerido: tar -xzf $1 -C /"
