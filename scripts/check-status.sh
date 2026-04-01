#!/usr/bin/env bash
set -euo pipefail

docker exec -it openclaw-gwzl-openclaw-1 openclaw status --all
