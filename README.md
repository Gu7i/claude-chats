# Claude Chats

Visor de conversaciones de [Claude Code](https://claude.ai/code) para Linux con integración en KDE.

Desarrollado por [Pablo Gutierrez](https://github.com/Gu7i)

![Python](https://img.shields.io/badge/python-3.10%2B-blue)
![PySide6](https://img.shields.io/badge/PySide6-Qt6-green)
![KDE](https://img.shields.io/badge/KDE-Plasma-blue)

## Características

- Lista todas las conversaciones de Claude Code ordenadas por fecha
- Renderiza Markdown (negrita, código, listas, encabezados)
- Muestra uso de tokens y costo estimado por conversación y total
- Búsqueda por contenido del primer mensaje
- Botón para retomar cualquier conversación en Konsole con `claude --resume`
- Ícono en el escritorio y entrada en el menú de aplicaciones de KDE

## Requisitos

- Python 3.10+
- PySide6
- [Claude Code CLI](https://claude.ai/code)
- KDE Plasma (recomendado) / cualquier escritorio Linux

## Instalación

```bash
git clone https://github.com/Gu7i/claude-chats.git
cd claude-chats
chmod +x install.sh
./install.sh
```

### Instalar PySide6 (si no lo tenés)

```bash
# Arch Linux
sudo pacman -S python-pyside6

# pip
pip install PySide6
```

## Uso

```bash
claude-chats
```

O desde el menú de aplicaciones de KDE → Utilidades → **Claude Chats**.

### Retomar una conversación

Seleccioná un chat en la lista y hacé clic en **Abrir en Konsole**. Esto ejecuta:

```bash
claude --resume <session-id>
```

## Estructura de datos

Claude Code guarda las conversaciones como archivos `.jsonl` en:

```
~/.claude/projects/<proyecto>/<session-id>.jsonl
```

Esta app lee esos archivos localmente, sin hacer llamadas a la API.

## Agregar al inicio de sesión

En KDE: **Configuración del sistema → Autostart → Agregar programa** → `claude-chats`
