# N8N Workflow Setup for Voice Input

Voice Input requires an N8N workflow for speech transcription and processing.

## Prerequisites

- N8N installation (self-hosted or Cloud)
- OpenAI API Key

## Installation

### Option 1: Import Workflow

1. Open N8N
2. Go to **Workflows** → **Import from File**
3. Select `workflow.json` from this repository
4. Configure OpenAI Credentials (see below)

### Option 2: Create Manually

1. Create a new workflow
2. Add the following nodes:

```
[Webhook] → [OpenAI Transcribe] → [Switch] → [Format Transcript]
                                          → [Format Prompt]
                                          → [Format Mail]
                                          → [Format Analyse]
```

## Configure OpenAI Credentials

1. Go to **Credentials** → **New**
2. Select **OpenAI**
3. Enter your API Key
4. Save
5. Update all OpenAI nodes in the workflow with this credential

## Get the Webhook URL

1. Open the workflow
2. Click on the **Voice Webhook** node
3. Copy the **Production URL** (e.g., `https://your-n8n.com/webhook/voice-input`)
4. Activate the workflow (toggle in top right corner)

## Configure in Voice Input App

1. Open Voice Input
2. Go to **Settings** (gear icon)
3. Paste the webhook URL
4. Save

## Workflow Functions

| Mode | Description |
|------|-------------|
| **Transcript** | Corrects sentence structure, removes filler words |
| **Prompt** | Transforms speech into Claude Code prompts |
| **Mail** | Formats as professional email with subject line |
| **Analyse** | Analyzes text based on voice instruction |

## Customization

You can customize the prompts in the Format nodes as needed:

- **Format Transcript**: Sentence correction rules
- **Format Prompt**: Prompt style for Claude Code
- **Format Mail**: Email format and greetings
- **Format Analyse**: Analysis instructions

## Troubleshooting

### "No N8N URL configured"
→ Enter webhook URL in app settings

### "Webhook error"
→ Check if workflow is activated
→ Check if URL is correct (Production, not Test)

### "JSON error"
→ Check OpenAI Credentials
→ Check if API key is valid
