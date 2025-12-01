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
    echo "❌ Error: Only x86_64 is supported (found: $ARCH)"
    exit 1
fi

# Check for required tools
if ! command -v curl &> /dev/null; then
    echo "❌ Error: curl is not installed"
    exit 1
fi

# Get latest version if not specified
if [[ "$VERSION" == "latest" ]]; then
    echo "📡 Fetching latest version..."
    VERSION=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" | grep '"tag_name"' | cut -d'"' -f4)
    if [[ -z "$VERSION" ]]; then
        echo "❌ Error: Could not determine version"
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
    echo "📥 Downloading DEB package..."
    FILENAME="Voice.Input_${VERSION_NUM}_amd64.deb"
    curl -fsSL -o "$FILENAME" "https://github.com/$REPO/releases/download/$VERSION/$FILENAME"
    
    echo "📦 Installing dependencies..."
    sudo apt update -qq
    sudo apt install -y -qq xdotool xclip libasound2 2>/dev/null || true
    
    echo "🔧 Installing Voice Input..."
    sudo dpkg -i "$FILENAME" || sudo apt-get install -f -y
    
    echo ""
    echo "✅ Installation complete!"
    echo ""
    echo "Start with: voice-input"
    echo "Or search for 'Voice Input' in your application menu"
else
    echo "📥 Downloading AppImage..."
    FILENAME="Voice.Input_${VERSION_NUM}_amd64.AppImage"
    curl -fsSL -o "$FILENAME" "https://github.com/$REPO/releases/download/$VERSION/$FILENAME"
    
    chmod +x "$FILENAME"
    
    # Install to ~/.local/bin
    mkdir -p ~/.local/bin
    mv "$FILENAME" ~/.local/bin/voice-input
    
    echo ""
    echo "✅ Installation complete!"
    echo ""
    echo "AppImage installed to: ~/.local/bin/voice-input"
    echo ""
    echo "Make sure ~/.local/bin is in your PATH:"
    echo '  export PATH="$HOME/.local/bin:$PATH"'
fi

# Cleanup
cd /
rm -rf "$TMPDIR"

echo ""
echo "🎤 Enjoy Voice Input!"
echo ""
echo "📋 Next step: Set up the N8N workflow"
echo "   See: https://github.com/TravixMedia/voice-input-releases/blob/main/WORKFLOW_SETUP.md"
