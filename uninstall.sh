#!/usr/bin/env bash
set -e

BIN_DIR="$HOME/.local/bin"
APPS_DIR="$HOME/.local/share/applications"
DESKTOP_DIR="$(xdg-user-dir DESKTOP 2>/dev/null || echo "$HOME/Desktop")"

echo "==> Desinstalando Claude Chats..."

rm -f "$BIN_DIR/claude-chats"
rm -f "$APPS_DIR/claude-chats.desktop"
rm -f "$DESKTOP_DIR/claude-chats.desktop"

update-desktop-database "$APPS_DIR" 2>/dev/null || true

echo "Listo. Claude Chats fue desinstalado."
