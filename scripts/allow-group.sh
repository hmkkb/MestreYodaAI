#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Uso: $0 <jid-do-grupo>"
  exit 1
fi

echo "Adicione o grupo manualmente na config: $1"
echo "Depois reinicie o gateway."
