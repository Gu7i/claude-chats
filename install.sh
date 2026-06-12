#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"
APPS_DIR="$HOME/.local/share/applications"
DESKTOP_DIR="$(xdg-user-dir DESKTOP 2>/dev/null || echo "$HOME/Desktop")"

echo "==> Verificando dependencias..."

if ! command -v python3 &>/dev/null; then
    echo "ERROR: python3 no encontrado"
    exit 1
fi

if ! python3 -c "import PySide6" 2>/dev/null; then
    echo "ERROR: PySide6 no instalado"
    echo "  Arch:   sudo pacman -S python-pyside6"
    echo "  pip:    pip install PySide6"
    exit 1
fi

if ! command -v claude &>/dev/null; then
    echo "ADVERTENCIA: claude CLI no encontrado — el botón 'Abrir en Konsole' no funcionará"
fi

echo "==> Instalando..."

mkdir -p "$BIN_DIR" "$APPS_DIR"

install -m 755 "$SCRIPT_DIR/claude-chats" "$BIN_DIR/claude-chats"

sed "s|Exec=.*|Exec=$BIN_DIR/claude-chats|" \
    "$SCRIPT_DIR/claude-chats.desktop" > "$APPS_DIR/claude-chats.desktop"

if [ -d "$DESKTOP_DIR" ]; then
    cp "$APPS_DIR/claude-chats.desktop" "$DESKTOP_DIR/claude-chats.desktop"
    chmod +x "$DESKTOP_DIR/claude-chats.desktop"
    echo "   Ícono creado en el escritorio"
fi

update-desktop-database "$APPS_DIR" 2>/dev/null || true

echo ""
echo "Instalado. Ejecutá: claude-chats"
