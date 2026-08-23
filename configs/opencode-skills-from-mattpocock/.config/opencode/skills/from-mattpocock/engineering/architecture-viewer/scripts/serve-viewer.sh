#!/usr/bin/env bash
# serve-viewer.sh — live view for a Mermaid diagram with zoom + subgraph folding.
#
# Usage: serve-viewer.sh [path/to/diagrama.mmd]
#   Copies viewer.html + mermaid.min.js + panzoom.min.js next to the diagram,
#   then serves the directory with live-server (hot-reload) and opens the
#   default browser at /?src=<diagrama.mmd>.
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="${1:-diagrama.mmd}"

if [ ! -f "$SRC" ]; then
  echo "Diagrama no encontrado: $SRC" >&2
  echo "Uso: serve-viewer.sh [path/to/diagrama.mmd]" >&2
  exit 1
fi

DIR="$(cd "$(dirname "$SRC")" && pwd)"
NAME="$(basename "$SRC")"

cp "$SKILL_DIR/viewer/viewer.html"         "$DIR/viewer.html"
cp "$SKILL_DIR/viewer/mermaid.min.js"      "$DIR/mermaid.min.js"
cp "$SKILL_DIR/viewer/panzoom.min.js"      "$DIR/panzoom.min.js"
cp "$SKILL_DIR/viewer/daisyui.css"         "$DIR/daisyui.css"
cp "$SKILL_DIR/viewer/tailwind-browser.js" "$DIR/tailwind-browser.js"

echo "Vista en vivo: http://localhost:8080/?src=$NAME"
echo "Edita $SRC y el navegador se actualizará solo. Ctrl+C para salir."
npx -y live-server "$DIR" --entry-file=viewer.html --open="/?src=$NAME"