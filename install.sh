#!/bin/bash
set -e

# Voice Input Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/TravixMedia/voice-input-releases/main/install.sh | bash

VERSION="${VERSION:-latest}"
REPO="TravixMedia/voice-input-releases"

echo "🎤 Voice Input Installer"
echo "========================"

# Detect package manager and architecture
ARCH=$(uname -m)
if [[ "$ARCH" != "x86_64" ]]; then
    echo "❌ Fehler: Nur x86_64 wird unterstützt (gefunden: $ARCH)"
    exit 1
fi

# Check for required tools
if ! command -v curl &> /dev/null; then
    echo "❌ Fehler: curl ist nicht installiert"
    exit 1
fi

# Get latest version if not specified
if [[ "$VERSION" == "latest" ]]; then
    echo "📡 Hole neueste Version..."
    VERSION=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" | grep '"tag_name"' | cut -d'"' -f4)
    if [[ -z "$VERSION" ]]; then
        echo "❌ Fehler: Konnte Version nicht ermitteln"
        exit 1
    fi
fi

echo "📦 Version: $VERSION"

# Remove 'v' prefix for filename
VERSION_NUM="${VERSION#v}"

# Detect if we should use deb or AppImage
USE_DEB=false
if command -v dpkg &> /dev/null && command -v apt &> /dev/null; then
    USE_DEB=true
fi

TMPDIR=$(mktemp -d)
cd "$TMPDIR"

if [[ "$USE_DEB" == "true" ]]; then
    echo "📥 Lade DEB-Paket herunter..."
    FILENAME="Voice.Input_${VERSION_NUM}_amd64.deb"
    curl -fsSL -o "$FILENAME" "https://github.com/$REPO/releases/download/$VERSION/$FILENAME"
    
    echo "📦 Installiere Abhängigkeiten..."
    sudo apt update -qq
    sudo apt install -y -qq xdotool xclip libasound2 2>/dev/null || true
    
    echo "🔧 Installiere Voice Input..."
    sudo dpkg -i "$FILENAME" || sudo apt-get install -f -y
    
    echo ""
    echo "✅ Installation abgeschlossen!"
    echo ""
    echo "Starte mit: voice-input"
    echo "Oder suche 'Voice Input' im Anwendungsmenü"
else
    echo "📥 Lade AppImage herunter..."
    FILENAME="Voice.Input_${VERSION_NUM}_amd64.AppImage"
    curl -fsSL -o "$FILENAME" "https://github.com/$REPO/releases/download/$VERSION/$FILENAME"
    
    chmod +x "$FILENAME"
    
    # Install to ~/.local/bin
    mkdir -p ~/.local/bin
    mv "$FILENAME" ~/.local/bin/voice-input
    
    echo ""
    echo "✅ Installation abgeschlossen!"
    echo ""
    echo "AppImage installiert in: ~/.local/bin/voice-input"
    echo ""
    echo "Stelle sicher, dass ~/.local/bin in deinem PATH ist:"
    echo '  export PATH="$HOME/.local/bin:$PATH"'
fi

# Cleanup
cd /
rm -rf "$TMPDIR"

echo ""
echo "🎤 Viel Spaß mit Voice Input!"
