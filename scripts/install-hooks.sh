#!/bin/sh
# μFIFA World Cup 2026 - Hook Installer
# Run this once after cloning the repo:
#   sh scripts/install-hooks.sh

HOOK_SRC="scripts/pre-commit"
HOOK_DST=".git/hooks/pre-commit"

if [ ! -d ".git" ]; then
  echo "✗ Run this script from the root of the repository."
  exit 1
fi

# Check that Python 3 is available
if ! command -v python3 >/dev/null 2>&1; then
  echo "⚠  python3 not found."
  echo "   Install Python 3 to enable automatic profile validation on commit."
  echo "   The hook will still be installed but validation will be skipped until Python 3 is available."
fi

# Warn if a hook already exists
if [ -f "$HOOK_DST" ]; then
  echo "⚠  A pre-commit hook already exists at $HOOK_DST."
  echo "   Overwriting it with the μFIFA hook."
fi

cp "$HOOK_SRC" "$HOOK_DST"
chmod +x "$HOOK_DST"

echo ""
echo "✓ μFIFA pre-commit hook installed."
echo "  Your profile will be validated automatically before every commit."
echo ""
