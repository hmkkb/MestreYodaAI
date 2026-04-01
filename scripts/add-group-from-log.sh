#!/usr/bin/env bash
set -euo pipefail

KEYWORD="${1:-/addGroup}"
LOG_CMD="docker exec -i openclaw-gwzl-openclaw-1 openclaw logs"
ALLOW_SCRIPT="/data/.openclaw/workspace/scripts/allow-group.sh"

if [ ! -x "$ALLOW_SCRIPT" ]; then
  echo "Script de allow não encontrado ou sem permissão: $ALLOW_SCRIPT"
  exit 1
fi

LINE=$(sh -lc "$LOG_CMD" | grep 'web-inbound' | grep -F "\"body\":\"$KEYWORD\"" | tail -n 1 || true)

if [ -z "$LINE" ]; then
  echo "Nenhuma mensagem encontrada no log com a palavra-chave: $KEYWORD"
  exit 1
fi

JID=$(printf '%s' "$LINE" | sed -n 's/.*"from":"\([^"]*@g\.us\)".*/\1/p')

if [ -z "$JID" ]; then
  echo "Não foi possível extrair o JID do grupo a partir do log."
  exit 1
fi

echo "Grupo encontrado no log: $JID"
"$ALLOW_SCRIPT" "$JID"
