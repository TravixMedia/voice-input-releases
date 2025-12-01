# N8N Workflow Setup für Voice Input

Voice Input benötigt einen N8N-Workflow für die Sprachtranskription und -verarbeitung.

## Voraussetzungen

- N8N Installation (self-hosted oder Cloud)
- OpenAI API Key

## Installation

### Option 1: Workflow importieren

1. Öffne N8N
2. Gehe zu **Workflows** → **Import from File**
3. Wähle `workflow.json` aus diesem Repository
4. Konfiguriere die OpenAI Credentials (siehe unten)

### Option 2: Manuell erstellen

1. Erstelle einen neuen Workflow
2. Füge folgende Nodes hinzu:

```
[Webhook] → [OpenAI Transcribe] → [Switch] → [Format Transkript]
                                          → [Format Prompt]
                                          → [Format Mail]
                                          → [Format Analyse]
```

## OpenAI Credentials konfigurieren

1. Gehe zu **Credentials** → **New**
2. Wähle **OpenAI**
3. Füge deinen API Key ein
4. Speichern
5. Aktualisiere alle OpenAI-Nodes im Workflow mit dieser Credential

## Webhook-URL ermitteln

1. Öffne den Workflow
2. Klicke auf den **Voice Webhook** Node
3. Kopiere die **Production URL** (z.B. `https://dein-n8n.de/webhook/voice-input`)
4. Aktiviere den Workflow (Toggle oben rechts)

## In Voice Input App konfigurieren

1. Öffne Voice Input
2. Gehe zu **Einstellungen** (Zahnrad-Icon)
3. Füge die Webhook-URL ein
4. Speichern

## Workflow-Funktionen

| Modus | Beschreibung |
|-------|-------------|
| **Transkript** | Korrigiert Satzstellung, entfernt Füllwörter |
| **Prompt** | Wandelt Sprache in Claude Code Prompts um |
| **Mail** | Formatiert als professionelle E-Mail mit Betreff |
| **Analyse** | Analysiert Text basierend auf Sprachanweisung |
| **Terminal** | Rohes Transkript für direkte Terminal-Eingabe |

## Anpassungen

Du kannst die Prompts in den Format-Nodes nach Bedarf anpassen:

- **Format Transkript**: Satzkorrektur-Regeln
- **Format Prompt**: Prompt-Stil für Claude Code
- **Format Mail**: E-Mail-Format und Grußformeln
- **Format Analyse**: Analyse-Anweisungen

## Fehlerbehebung

### "Keine N8N-URL konfiguriert"
→ Webhook-URL in den App-Einstellungen eintragen

### "Webhook-Fehler"
→ Prüfe ob der Workflow aktiviert ist
→ Prüfe ob die URL korrekt ist (Production, nicht Test)

### "JSON-Fehler"
→ Prüfe die OpenAI Credentials
→ Prüfe ob der API Key gültig ist
