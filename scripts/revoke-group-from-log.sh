#!/usr/bin/env bash
set -euo pipefail

KEYWORD="${1:-/addGroup}"
LOG_CMD="docker exec -i openclaw-gwzl-openclaw-1 openclaw logs"
REVOKE_SCRIPT="/data/.openclaw/workspace/scripts/revoke-group.sh"

if [ ! -x "$REVOKE_SCRIPT" ]; then
  echo "Script de revoke não encontrado ou sem permissão: $REVOKE_SCRIPT"
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
"$REVOKE_SCRIPT" "$JID"
