# Voice Input Releases

Distribution repository for Voice Input App - Speech-to-text with AI formatting.

## One-Line Installation

```bash
curl -fsSL https://raw.githubusercontent.com/TravixMedia/voice-input-releases/main/install.sh | bash
```

The script automatically detects your system and installs:
- **Debian/Ubuntu**: DEB package via `dpkg`
- **Other Linux**: AppImage to `~/.local/bin`

### Install Specific Version

```bash
VERSION=v1.2.0 curl -fsSL https://raw.githubusercontent.com/TravixMedia/voice-input-releases/main/install.sh | bash
```

## N8N Workflow Setup

Voice Input requires an N8N workflow for transcription.

**[Workflow Setup Guide](WORKFLOW_SETUP.md)**

Quick setup:
1. Import `workflow.json` into N8N
2. Configure OpenAI credentials
3. Activate the workflow
4. Enter the webhook URL in Voice Input app

## Manual Installation

### Debian/Ubuntu

```bash
# Dependencies
sudo apt install xdotool xclip libasound2

# Download and install
wget https://github.com/TravixMedia/voice-input-releases/releases/latest/download/Voice.Input_1.2.0_amd64.deb
sudo dpkg -i Voice.Input_1.2.0_amd64.deb
```

### AppImage (all Linux distributions)

```bash
wget https://github.com/TravixMedia/voice-input-releases/releases/latest/download/Voice.Input_1.2.0_amd64.AppImage
chmod +x Voice.Input_1.2.0_amd64.AppImage
./Voice.Input_1.2.0_amd64.AppImage
```

## Modes

| Mode | Description |
|------|-------------|
| **Prompt** | Speech to Claude Code prompt |
| **Transcript** | Speech to corrected text |
| **Mail** | Speech to formatted email |
| **Analyse** | Speech + text to analysis |

## Auto-Updates

The app automatically checks for updates and can update itself.

## Dependencies

- `xclip` - Clipboard functions
- `libasound2` - Audio recording

## Links

- [Releases](https://github.com/TravixMedia/voice-input-releases/releases)
- [Latest Version](https://github.com/TravixMedia/voice-input-releases/releases/latest)
- [Workflow Setup](WORKFLOW_SETUP.md)
