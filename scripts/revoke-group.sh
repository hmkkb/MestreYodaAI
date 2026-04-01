#!/usr/bin/env bash
set -euo pipefail

CONFIG="/data/.openclaw/openclaw.json"
JID="${1:-}"

if [ -z "$JID" ]; then
  echo "Uso: $0 <jid-do-grupo>"
  exit 1
fi

if [[ ! "$JID" =~ @g\.us$ ]]; then
  echo "JID inválido. Esperado formato como 120363xxxxxxxxxxxx@g.us"
  exit 1
fi

if [ ! -f "$CONFIG" ]; then
  echo "Arquivo de config não encontrado: $CONFIG"
  exit 1
fi

python3 - "$CONFIG" "$JID" <<'PY'
import json
import sys
from pathlib import Path

config_path = Path(sys.argv[1])
jid = sys.argv[2]

data = json.loads(config_path.read_text())
wa = data.setdefault('channels', {}).setdefault('whatsapp', {})
groups = wa.setdefault('groups', {})

if jid not in groups:
    print(f'Grupo não existe na config: {jid}')
else:
    del groups[jid]
    print(f'Grupo removido: {jid}')

config_path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n")
PY

echo "Reiniciando gateway..."
kill -USR1 1 || true

echo "Concluído. Grupo revogado: $JID"
