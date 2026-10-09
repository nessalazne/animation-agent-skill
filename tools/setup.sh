#!/usr/bin/env bash
# One-command setup for the animation agent skill.
#   bash tools/setup.sh --check     report what is installed, change nothing
#   bash tools/setup.sh             install what is missing (Playwright + Chromium)
# ffmpeg and Python are never installed for you. The script tells you the command.

set -u

CHECK_ONLY=0
[ "${1:-}" = "--check" ] && CHECK_ONLY=1

ok()   { printf '  [ok]      %s\n' "$1"; }
miss() { printf '  [missing] %s\n' "$1"; }
note() { printf '            %s\n' "$1"; }

MISSING=0

echo "Animation agent skill: setup"
echo

# Node 18+
if command -v node >/dev/null 2>&1; then
  NODE_MAJOR=$(node -p "process.versions.node.split('.')[0]")
  if [ "$NODE_MAJOR" -ge 18 ]; then
    ok "Node $(node --version)"
  else
    miss "Node $(node --version) is too old, need 18 or newer"
    note "Install the current LTS from https://nodejs.org"
    MISSING=1
  fi
else
  miss "Node"
  note "Install the current LTS from https://nodejs.org"
  MISSING=1
fi

# ffmpeg
if command -v ffmpeg >/dev/null 2>&1; then
  ok "ffmpeg ($(ffmpeg -version 2>&1 | head -1 | cut -d' ' -f3))"
else
  miss "ffmpeg"
  note "macOS:   brew install ffmpeg"
  note "Windows: winget install Gyan.FFmpeg"
  note "Linux:   sudo apt install ffmpeg"
  MISSING=1
fi

# Playwright (global) and Chromium
HAVE_PW=0
if command -v npm >/dev/null 2>&1; then
  GLOBAL_ROOT=$(npm root -g 2>/dev/null)
  if [ -n "$GLOBAL_ROOT" ] && [ -d "$GLOBAL_ROOT/playwright" ]; then
    HAVE_PW=1
    ok "Playwright (global)"
  fi
fi

if [ "$HAVE_PW" -eq 0 ]; then
  miss "Playwright (global)"
  if [ "$CHECK_ONLY" -eq 1 ]; then
    note "Run: npm i -g playwright && npx playwright install chromium"
    MISSING=1
  elif command -v npm >/dev/null 2>&1; then
    echo "            Installing Playwright..."
    if npm i -g playwright; then
      HAVE_PW=1
      ok "Playwright installed"
    else
      note "The install failed. Try again with sudo, or fix your npm global prefix."
      MISSING=1
    fi
  else
    note "npm not found, so Playwright cannot be installed yet."
    MISSING=1
  fi
fi

if [ "$HAVE_PW" -eq 1 ]; then
  if [ "$CHECK_ONLY" -eq 1 ]; then
    note "Chromium is installed with: npx playwright install chromium"
  else
    echo "            Making sure Chromium is installed..."
    if npx playwright install chromium; then
      ok "Chromium"
    else
      note "Chromium install failed. Run: npx playwright install chromium"
      MISSING=1
    fi
  fi
fi

# Optional: voice-over word timing
echo
echo "Optional (only for voice-overs):"
if command -v python3 >/dev/null 2>&1 && python3 -c "import faster_whisper" >/dev/null 2>&1; then
  ok "faster-whisper (exact word timing)"
else
  note "faster-whisper not installed. Voice-overs still work with estimated word times."
  note "For exact timing: pip install faster-whisper"
fi
note "The ElevenLabs voice is optional too. Without it the skill uses your system voice."

echo
if [ "$MISSING" -eq 0 ]; then
  echo "Ready. In Claude Code, try:  /animate a 20-second history of the bicycle, cut paper"
else
  echo "Fix the missing items above, then run this script again."
  exit 1
fi
