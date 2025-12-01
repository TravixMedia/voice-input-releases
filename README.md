# Voice Input Releases

Distribution repository for Voice Input App - Spracheingabe zu Text mit KI-Formatierung.

## 🚀 Ein-Zeilen-Installation

```bash
curl -fsSL https://raw.githubusercontent.com/TravixMedia/voice-input-releases/main/install.sh | bash
```

Das Script erkennt automatisch dein System und installiert:
- **Debian/Ubuntu**: DEB-Paket mit `dpkg`
- **Andere Linux**: AppImage in `~/.local/bin`

### Spezifische Version installieren

```bash
VERSION=v1.2.0 curl -fsSL https://raw.githubusercontent.com/TravixMedia/voice-input-releases/main/install.sh | bash
```

## ⚙️ N8N Workflow einrichten

Voice Input benötigt einen N8N-Workflow für die Transkription.

**→ [Workflow Setup Anleitung](WORKFLOW_SETUP.md)**

Kurzversion:
1. `workflow.json` in N8N importieren
2. OpenAI Credentials konfigurieren
3. Workflow aktivieren
4. Webhook-URL in Voice Input App eintragen

## 📦 Manuelle Installation

### Debian/Ubuntu

```bash
# Abhängigkeiten
sudo apt install xdotool xclip libasound2

# Download und Installation
wget https://github.com/TravixMedia/voice-input-releases/releases/latest/download/Voice.Input_1.2.0_amd64.deb
sudo dpkg -i Voice.Input_1.2.0_amd64.deb
```

### AppImage (alle Linux-Distributionen)

```bash
wget https://github.com/TravixMedia/voice-input-releases/releases/latest/download/Voice.Input_1.2.0_amd64.AppImage
chmod +x Voice.Input_1.2.0_amd64.AppImage
./Voice.Input_1.2.0_amd64.AppImage
```

## 🎤 Modi

| Modus | Beschreibung |
|-------|-------------|
| **Prompt** | Sprache → Claude Code Prompt |
| **Transkript** | Sprache → korrigierter Text |
| **Mail** | Sprache → formatierte E-Mail |
| **Analyse** | Sprache + Text → Analyse |
| **Terminal** | Sprache → direkt in CLI tippen |

## 🔄 Auto-Updates

Die App prüft automatisch auf Updates und kann sich selbst aktualisieren.

## 📋 Abhängigkeiten

- `xdotool` - Für Terminal-Modus (Text-Eingabe in CLI-Apps)
- `xclip` - Für Clipboard-Funktionen
- `libasound2` - Audio-Aufnahme

## 🔗 Links

- [Releases](https://github.com/TravixMedia/voice-input-releases/releases)
- [Neueste Version](https://github.com/TravixMedia/voice-input-releases/releases/latest)
- [Workflow Setup](WORKFLOW_SETUP.md)
