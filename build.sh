#!/usr/bin/env bash
set -euo pipefail

# Load a local .env if present (for `vercel dev` / local previews).
# In Vercel deployments, API_BASE comes from the project's Environment Variables.
if [ -f .env ] && [ -z "${API_BASE:-}" ]; then
  set -a
  # shellcheck disable=SC1091
  . ./.env
  set +a
fi

if [ -z "${API_BASE:-}" ]; then
  echo "ERROR: API_BASE env var is not set." >&2
  echo "Set it in the Vercel project (or in a local .env) — host only, no /api/v1 suffix." >&2
  echo "  Production: https://investors-api.gokabisa.com" >&2
  echo "  Preview:    https://investors-api.staging.gokabisa.com" >&2
  exit 1
fi

sed -i "s|__API_BASE__|${API_BASE}|g" index.html admin.html
echo "Substituted __API_BASE__ -> ${API_BASE} in index.html, admin.html"
